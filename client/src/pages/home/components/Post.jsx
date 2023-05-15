import React from "react";
import {BsThreeDots} from "react-icons/bs"
import {AiOutlineGlobal} from "react-icons/ai"
import {GrFavorite} from "react-icons/gr"
import {CgComment} from "react-icons/cg"
import TestImage from "../../../assets/images/baner.jpg"
import Avatar from '../../../assets/images/anhdaidien.jpeg'
const Post = ({post}) => {
  return <div className="max-w-[750px] mx-auto rounded-[12px] shadow-md">
    <div className="flex justify-between mt-6 items-start">
    <div className="flex gap-2 items-center">
    <img src={Avatar} className="h-[76px] w-[76px] rounded-full m-2x"/> 
    <div>
        <h6>Nguyễn Văn Dìa</h6>
       <div className="flex gap-2 items-end"> 
        <AiOutlineGlobal/>
        <h6>4 giờ trước</h6>
       </div>
    </div>
    </div>
   <BsThreeDots size={30} className="m-4"/>
    </div>
    <img src={TestImage} className="max-w-[506px] object-cover max-h-[1050px] mx-auto" />
    <div className="h-[60px] my-6 max-w-[506px] mx-auto">
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Dicta, quaerat vel debitis, unde eaque perferendis soluta alias obcaecati natus perspiciatis quam porro quos non ut recusandae ipsa ex expedita. Quas.
    </div>
    <hr className="border border-BlackCool/50"/>
    <div className="flex gap-4 items-center p-8">
        <GrFavorite size={25}/>
        <h6>100</h6>
        <CgComment size={25}/>
        <h6>2000</h6>
    </div>
  </div>;
};
export default Post;