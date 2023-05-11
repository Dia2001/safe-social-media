import React, { useEffect, useState } from "react";
import Header from '../../components/Header'
import PersonalHeader from "./components/PersonalHeader";
import ListOfPost from "./components/ListOfPost";
import Image from '../../assets/images/baner.jpg'
import LargePost from "../../components/LargePost";
const Personal = () => {
    const [listPost, setListPost] = useState([])
    
    useEffect(() => { 
        const post={
            image:Image
        }
        setListPost([post,post,post,post,post,post,post,post,post,post])
    }, [])
    return <div className="relative">
        
        <div className="max-w-[760px] mx-auto mt-8 rounded-[6px] border border-Black25 p-4">
            <PersonalHeader />
            <ListOfPost list={listPost}/>
        </div>
       
    </div>;
};
export default Personal;