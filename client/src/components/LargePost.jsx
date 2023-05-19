import React from "react";
import Image from '../assets/images/image-post.jpg';
import Avatar from '../assets/images/anhdaidien.jpeg';
import {MdOutlineClose, MdOutlineFavorite} from 'react-icons/md';
const LargePost = ({close}) => {
    
  return <div className="absolute top-[-120px] left-0 w-full h-[120%] bg-BlackCool/25 ">
        <div className="relative mx-auto mt-[180px] w-[506px] rounded-md overflow-hidden shadow-md">
            <img src={Avatar} className="rounded-full w-[63px] h-[63px] shadow-sm object-conver absolute top-4 left-4" />
            <MdOutlineClose onClick={()=>close()} size={35} className=" bg-white/50 p-1 rounded-full text-white absolute right-4 top-4 cursor-pointer"/>
            <img src={Image} className="w-[506px] object-cover"/>
            <div className="p-4 bg-BlackCool/25 text-white absolute bottom-0 left-0">
                <div className="absolute right-2 px-2 py-1 top-[-2em] flex gap-2 justify-center items-center bg-BlackCool/25 rounded-[14px]">
                    <MdOutlineFavorite size={15} className="text-ErrorColor"/>
                    <p>0</p>
                </div>
                <div className="mx-auto w-[95%] my-1">
                <h6><b>Nguyễn Văn Dìa: </b>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus dolorem fugit reiciendis saepe eos nisi debitis, vero non neque numquam est officia quos tenetur laboriosam iste cumque recusandae, molestiae cum!</h6>
                </div>
            </div>
        </div>
  </div>;
};
export default LargePost;
