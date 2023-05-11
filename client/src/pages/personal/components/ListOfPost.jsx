import React, { useState } from "react";
import { MdOutlineImage, MdVideoCameraBack } from 'react-icons/md'
import { HiOutlinePencilSquare } from 'react-icons/hi2'
import LargePost from "../../../components/LargePost";
const ListOfPost = ({ list }) => {
  const [listOptions, SetListOptions] = useState([true, false, false])
  const [popUp,SetPopUp] = useState(false)

  function closePopUp(){
    SetPopUp(false);
  }
  const EffectOpt = (option) => {
    switch (option) {
      case 1:
        SetListOptions([true, false, false])
        break;
      case 2:
        SetListOptions([false, true, false])
        break;
      case 3:
        SetListOptions([false, false, true])
        break;
        default:
          SetListOptions([true, false, false])
        break;
    }
  }
  return (<div>
     {popUp && <LargePost close={closePopUp}/>}
    <div className="w-[422px] border border-Black10 rounded-md mx-auto my-8 flex justify-between items-center py-2 px-4">
      <div onClick={()=>EffectOpt(1)} className={`${listOptions[0]&&'text-Secondary'} flex flex-col gap-1  cursor-pointer`}>
        <MdOutlineImage size={30}/>
        <hr className={`${listOptions[0]&&'opacity-100'} opacity-0 border-2 rounded-lg border-Secondary`} />
      </div>
      <div onClick={()=>EffectOpt(2)} className={`${listOptions[1]&&'text-Secondary'} flex flex-col gap-1  cursor-pointer`}>
        <MdVideoCameraBack size={30}/>
        <hr className={`${listOptions[1]&&'opacity-100'} opacity-0 border-2 rounded-lg border-Secondary`} />
      </div>
      <div onClick={()=>EffectOpt(3)} className={`${listOptions[2]&&'text-Secondary'} flex flex-col gap-1  cursor-pointer`}>
        <HiOutlinePencilSquare size={30}/>
        <hr className={`${listOptions[2]&&'opacity-100'} opacity-0 border-2 rounded-lg border-Secondary`} />
      </div>
    </div>
    <div className="w-[708px] mx-auto grid gap-4 grid-cols-3 p-2">
      {list.map((item, key) => (
        <img key={key} onClick={() =>SetPopUp(true)}className="w-[209px] h-[209px] object-cover cursor-pointer hover:shadow-lg hover:shadow-indigo-500/40" src={item.image} />
      ))}
    </div>
  </div>)
};
export default ListOfPost;