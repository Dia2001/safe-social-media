import React, { useEffect, useState } from "react";
import {AiOutlineCamera} from "react-icons/ai"
import getUser from "../../../utils/getUser";
import getCurrentUserId from "../../../utils/getCurrentUser";
import {FcSettings} from 'react-icons/fc'
import { Await, Link } from "react-router-dom";
import config from '../../../config';
import axios from "axios";

const PersonalHeader = () => {
    const [user,SetUser]=useState('');
    const [avatar,SetAvatar]=useState('');
    const [countArticle,setCountArticle]=useState(0);

    useEffect(
        ()=>{
        (async()=>{
            const getNameUser=await getUser(getCurrentUserId());
            SetUser(getNameUser.name);
            SetAvatar(getNameUser.avatar);
            const getPostOfUser=(await axios.get('http://localhost:9999/home/'+getCurrentUserId())).data;
            setCountArticle(getPostOfUser.length);
            
        })();
        
        },[]
    )
  return <div className="flex gap-4">
    <div className="relative p-4">
        <img src={avatar} className="w-[156px] h-[156px] rounded-full object-cover"/>
        <AiOutlineCamera size={25} className="absolute right-2 bottom-2 p-1 h-fit rounded-full w-fit bg-Black25"/>
    </div>
    <div className="flex flex-col justify-center gap-8 ">
        <h4>{user}</h4>
        <div className="flex justify-between w-[360px]">
            <div className="flex flex-col gap-2 items-center">
                <h6>{countArticle}</h6>
                <h6>Bài viết</h6>
            </div>
            <div className="flex flex-col gap-2 items-center">
                <h6>0</h6>
                <h6>Bạn bè</h6>
            </div>
            <div className="flex flex-col gap-2 items-center">
                <h6>0</h6>
                <h6>Lượt thích</h6>
            </div>
       <Link to={config.routes.profile}>
       <FcSettings size={50} className="text-BlackCool cursor-pointer"/>
       </Link>
        </div>
    </div>
  </div>;
};
export default PersonalHeader;