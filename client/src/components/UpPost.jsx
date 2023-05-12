import React from "react";
import Avatar from '../assets/images/anhdaidien.jpeg'
import {MdOutlineClose} from 'react-icons/md';
import {AiOutlineGlobal} from 'react-icons/ai';
const UpPost = ({openPost}) => {
  return <div className="absolute top-[-90px] left-0 w-full h-[120%] bg-BlackCool/25">
  <div className="sticky top-[90px] mx-auto bg-white w-[750px] min-h-[780px] rounded-md overflow-hidden shadow-md z-50">
    <div className="flex justify-between p-4">
        <div className="flex gap-4">
            <img src={Avatar} className="shadow-sm w-[76px] h-[76px] rounded-full"/>
            <div>
                <h5>Nguyễn Văn Dìa</h5>
               <div className="flex gap-2 items-center">
               <AiOutlineGlobal size={20}/> <h6>Công khai</h6>
               </div>
            </div>
        </div>
        <MdOutlineClose size={40} onClick={()=>openPost()} className="bg-BlackCool/25 text-white rounded-full p-2 cursor-pointer"/>
    </div>
    <div className="w-[530px] mx-auto">
        <textarea className="w-full h-[133px] outline-none p-4 text-[16px] rounded-md border-2 border-BlackCool/50 resize-none" placeholder="Bạn đang cảm thấy như thế nào ...">

        </textarea>
        <p className="m-2 text-ErrorColor">Không được vượt quá 225 ký tự ...</p>
        <img className="w-[506px] h-[468px] ml-auto"/>
        <div className="my-6 flex gap-6 justify-end">
                <button className="text-white font-semibold py-2 px-4 w-fit h-fit bg-Secondary3 rounded-[24px] hover:opacity-90">Đăng bài</button>
                <button className="text-white font-semibold py-2 px-4 w-fit h-fit bg-ActiveColor rounded-[24px] hover:opacity-90">Tải lên</button>
        </div>
    </div>

</div>
</div>
};
export default UpPost;