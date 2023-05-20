import React, { useEffect, useState } from "react";
import PersonalHeader from "./components/PersonalHeader";
import isAuthorize from "../../utils/isAuthorize";
import Error from "../error/error";
import PersonalPost from "./components/PersonalPost";

const Personal = () => {
    const [isAuth,SetAuth]=useState(false)
    useEffect(
        ()=>{
        SetAuth(isAuthorize())    
        }
    )
    return <div className="">
        
       {
        isAuth?
        <div className="max-w-[760px] mx-auto mt-8 rounded-[6px] border border-Black25 p-4">
            <PersonalHeader/>
            <PersonalPost/>
        </div>:<Error/>
       }
       
    </div>;
};
export default Personal;