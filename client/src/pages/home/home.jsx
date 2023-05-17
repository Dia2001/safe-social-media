import React from "react";
import CreatePostMenu from "./components/CreatePostMenu";
import { useEffect, useState } from "react";
import Header from "../../components/Header";
import ListPosts from "./components/ListPosts";
import UpPost from "../../components/UpPost";
import axios from "axios";

const Home = () => {
    
    const [listPosts, setListPosts] = useState([]);
    const [popUp, SetPopUp] = useState(false);
    useEffect( () => {
        const getAllPost=axios.get('http://localhost:9999/home').then((response) => 
        {
            if(response.status===200)
                setListPosts(response.data);
            else
            console.log("Loi!!!");
        });
    })

    function PopUpHandler() { SetPopUp(!popUp) }

    return(
    <div className="relative">
        {/* <div onClick={BlackBgHandler} className={`${!blackBg&&'hidden'} absolute top-0 left-0 w-full h-full bg-BlackCool/50 z-10`}>
        </div> */}
        {popUp&&<UpPost openPost={PopUpHandler}/>}
        <div className="w-full z-0">
            <div className="w-[749px] mx-auto">
                <CreatePostMenu writePost={PopUpHandler}/>
                <ListPosts list={listPosts}/>
            </div>
        </div>;
    </div>)
};
export default Home;