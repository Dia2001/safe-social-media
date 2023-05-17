import React, { useEffect, useState } from "react";
import PersonalHeader from "./components/PersonalHeader";
import ListOfPost from "./components/ListOfPost";
import isAuthorize from "../../utils/isAuthorize";
import Error from "../error/error";

const Personal = () => {
    const [isAuth,SetAuth]=useState(false)
    useEffect(
        ()=>{
        SetAuth(isAuthorize())    
        }
    )
    return <div className="relative">
        
       {
        isAuth?
        <div className="max-w-[760px] mx-auto mt-8 rounded-[6px] border border-Black25 p-4">
            <PersonalHeader/>
            <ListOfPost/>
        </div>:<Error/>
       }
       
    </div>;
};
export default Personal;