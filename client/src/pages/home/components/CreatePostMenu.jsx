import React, { useEffect, useState } from "react";
import getUser from "../../../utils/getUser";
import getCurrentUserId from "../../../utils/getCurrentUser";

const CreatePostMenu = ({writePost}) => {
  const [user,SetUser]=useState('');
  const [avatar,SetAvatar]=useState('');
  useEffect(
    ()=>{
      (async()=>{
        const getNameUser=await getUser(getCurrentUserId());
        SetUser(getNameUser.name);
        SetAvatar(getNameUser.avatar);
    })();
    },[]
  )

  return <div className="w-full border-2 border-BlackCool/50 rounded-sm shadow-sm flex justify-between mt-8 items-center">
    <div className="flex gap-2 items-center">
    <img src={avatar} className="h-[76px] w-[76px] rounded-full m-2x"/> 
    <h6>{user}</h6>
    </div>
    <button onClick={()=>writePost()} className="px-2 py-4 m-2x h-fit bg-Secondary4 rounded-md hover:bg-Secondary3 transition text-white font-semibold">
      Tạo bài viết
    </button>
  </div>;
};
export default CreatePostMenu;