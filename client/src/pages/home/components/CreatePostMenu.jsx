import React from "react";
import Avatar from '../../../assets/images/anhdaidien.jpeg'

const CreatePostMenu = ({writePost}) => {
  return <div className="w-full border-2 border-BlackCool/50 rounded-sm shadow-sm flex justify-between mt-8 items-center">
    <div className="flex gap-2 items-center">
    <img src={Avatar} className="h-[76px] w-[76px] rounded-full m-2x"/> 
    <h6>Nguyễn Văn Dìa</h6>
    </div>
    <button onClick={()=>writePost()} className="px-2 py-4 m-2x h-fit bg-Secondary4 rounded-md hover:bg-Secondary3 transition text-white font-semibold">
      Tạo bài viết
    </button>
  </div>;
};
export default CreatePostMenu;