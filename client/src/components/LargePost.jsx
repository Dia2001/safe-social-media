import React, { useEffect, useState } from "react";
import Image from '../assets/images/image-post.jpg';
import Avatar from '../assets/images/anhdaidien.jpeg';
import { MdOutlineClose, MdOutlineFavorite } from 'react-icons/md';
import isAuthorize from "../utils/isAuthorize";
import getUser from "../utils/getUser";
import getCurrentUserId from "../utils/getCurrentUser";
import bgStatus from "../assets/images/white-background.jpg";
import config from "../config";
const LargePost = ({ close, item }) => {
    const [auth, SetAuth] = useState(false)
    const [user, SetUser] = useState('');
    useEffect(
        () => {
            var isAuth = isAuthorize();
            SetAuth(isAuth);
            if (isAuth) {
                (async () => {
                    const getNameUser = await getUser(getCurrentUserId());
                    SetUser(getNameUser.name);
                })();
            }
        }, []
    )
    return <div className="absolute top-[-120px] left-0 w-full h-[150%] bg-BlackCool/25 ">
        <div className="relative top-[120px] mx-auto mt-[180px] w-[506px] rounded-md overflow-hidden shadow-md z-50">
            <img src={Avatar} className="rounded-full w-[63px] h-[63px] shadow-sm object-conver absolute top-4 left-4" />
            <MdOutlineClose onClick={() => close()} size={35} className=" bg-BlackCool/25 p-1 rounded-full text-white absolute right-4 top-4 cursor-pointer" />
            {item.hasOwnProperty('image') ? <img src={`${config.BASE_API_V1}/images/` + item.image} className="w-[506px] object-cover" /> : <img src={bgStatus} className="w-[506px] object-cover" />}
            <div className="p-4 bg-BlackCool/40 w-full text-white absolute bottom-0 left-0">
                <div className="absolute right-2 px-2 py-1 top-[-2em] flex gap-2 justify-center items-center bg-BlackCool/25 rounded-[14px]">
                    <MdOutlineFavorite size={15} className="text-ErrorColor" />
                    <p>0</p>
                </div>
                <div className="mx-auto w-[95%] my-1 break-all">
                    <h6><b>{user} </b>
                        {item.text}</h6>
                </div>
            </div>
        </div>
    </div>;
};
export default LargePost;
