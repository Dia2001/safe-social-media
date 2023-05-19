import React, { useEffect, useState } from "react";
import { MdOutlineImage, MdVideoCameraBack } from 'react-icons/md'
import { HiOutlinePencilSquare } from 'react-icons/hi2';
import axios from 'axios';
import LargePost from "../../../components/LargePost";
import getCurrentUserId from "../../../utils/getCurrentUser";
const PersonalPost = () => {
  const [listOptions, SetListOptions] = useState(0)
  const [popUp, SetPopUp] = useState(false)
  const [isLoading, setIsLoading] = useState(true);
  const [listPost, setListPost] = useState([])
  const [statusArticles, setStatusArticles] = useState([]);
  const [postVideo,SetPostVideo]=useState([]);
  const [postArticles, setPostArticles] = useState([]);
  const [postPopUp,setPostPopUp] = useState({});
  const [currrentPost, setCurrrentPost] = useState([]);


  //using filter
  useEffect(() => {
    console.log('run....')
    //set loading when choose another option
    setIsLoading(true);
    
    const currentUserId = getCurrentUserId();
    if (currentUserId != null) {
      axios.get('http://localhost:9999/home/' + currentUserId).then(async (res) => {
        setListPost(res.data);
        console.log(res.data);
       
      })
    }
  },[])

  useEffect(
    ()=>{
      //filter post
     console.log("load post ");
     const postArticlesTmp=listPost.filter(res=>res.hasOwnProperty('image'));
     setPostArticles(postArticlesTmp);
     console.log(postArticles);
     //filter status
     const loadStatusTmp=listPost.filter(res=>!res.hasOwnProperty('image'));
     setStatusArticles(loadStatusTmp);
     console.log(statusArticles);
    //set current post
    setCurrrentPost(postArticles);
    setIsLoading(false);
    }
    ,[listPost])


    useEffect(()=>{
      console.log(listOptions);
      switch (listOptions) {
        case 0:
            setCurrrentPost(postArticles);
          break;
        case 1:
            setCurrrentPost(postVideo);
          break;
        case 2:
          setCurrrentPost(statusArticles);
          break;
        default:
          setCurrrentPost(postArticles);
          break;
    }
  },[listOptions])


  function closePopUp() {
    SetPopUp(false); 
  }
  async function popUpPost(item){
    SetPopUp(true);
    setPostPopUp(item); 
  }

  const EffectOpt = (option) => {
    switch (option) {
      case 0:
        SetListOptions(0)
        break;
      case 1:
        SetListOptions(1)
        break;
      case 2:
        SetListOptions(2)
        break;
      default:
        SetListOptions(0)
        break;
    }
  }
  return (<div>
    {popUp && <LargePost item={postPopUp} close={closePopUp} />}
    <div className="w-[422px] border border-Black10 rounded-md mx-auto my-8 flex justify-between items-center py-2 px-4">
      <div onClick={() => EffectOpt(0)} className={`${listOptions == 0 && 'text-Secondary'} flex flex-col gap-1  cursor-pointer`}>
        <MdOutlineImage size={30} />
        <hr className={`${listOptions == 0 && 'opacity-100'} opacity-0 border-2 rounded-lg border-Secondary`} />
      </div>
      <div onClick={() => EffectOpt(1)} className={`${listOptions == 1 && 'text-Secondary'} flex flex-col gap-1  cursor-pointer`}>
        <MdVideoCameraBack size={30} />
        <hr className={`${listOptions == 1 && 'opacity-100'} opacity-0 border-2 rounded-lg border-Secondary`} />
      </div>
      <div onClick={() => EffectOpt(2)} className={`${listOptions == 2 && 'text-Secondary'} flex flex-col gap-1  cursor-pointer`}>
        <HiOutlinePencilSquare size={30} />
        <hr className={`${listOptions == 2 && 'opacity-100'} opacity-0 border-2 rounded-lg border-Secondary`} />
      </div>
    </div>

    {isLoading ? <div className="w-full h-[120px] flex justify-center items-center">
      <div role="status">
        <svg aria-hidden="true" class="w-16 h-16 mr-2 text-gray-200 animate-spin dark:text-gray-600 fill-blue-600" viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z" fill="currentColor" />
          <path d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z" fill="currentFill" />
        </svg>
        <span class="sr-only">Loading...</span>
      </div>
    </div> :
      currrentPost.length>0?<div className="w-[708px] mx-auto grid gap-4 grid-cols-3 p-2">
      {currrentPost.map((item, key) => (
        item.hasOwnProperty('image')?<img key={key} onClick={()=>popUpPost(item)} className="w-[209px] h-[209px] object-cover cursor-pointer hover:shadow-lg hover:shadow-indigo-500/40" src={'http://localhost:9999/images/' + item.image} />:<div key={key} onClick={()=>popUpPost(item)} className="w-[209px] break-all p-2 bg-BlackCool/5 h-[209px] object-cover cursor-pointer hover:shadow-lg hover:shadow-indigo-500/40">
          <p>{item.text}</p>
        </div>
      ))
      }
    </div>:<div className="w-[708px] mx-auto p-2 justify-center">
        <h6 className="text-BlackCool/50">Chưa có bài viết</h6>
    </div>
    }

  </div>)
};
export default PersonalPost;