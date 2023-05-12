import React from "react";
import Avatar from '../../../assets/images/anhdaidien.jpeg'
import {AiOutlineCamera} from "react-icons/ai"
const PersonalHeader = () => {
  return <div className="flex gap-4">
    <div className="relative p-4">
        <img src={Avatar} className="w-[156px] h-[156px] rounded-full object-cover"/>
        <AiOutlineCamera size={25} className="absolute right-2 bottom-2 p-1 h-fit rounded-full w-fit bg-Black25"/>
    </div>
    <div className="flex flex-col justify-center gap-8 ">
        <h4>Nguyễn Văn Dìa</h4>
        <div className="flex justify-between">
            <div className="flex flex-col gap-2 items-center">
                <h6>10</h6>
                <h6>Bài viết</h6>
            </div>
            <div className="flex flex-col gap-2 items-center">
                <h6>10</h6>
                <h6>Bài viết</h6>
            </div>
            <div className="flex flex-col gap-2 items-center">
                <h6>10</h6>
                <h6>Bài viết</h6>
            </div>
        </div>
    </div>
  </div>;
};
export default PersonalHeader;