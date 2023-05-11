import React from "react";
import Post from "./Post";

const ListPosts = ({list}) => {
  return list.map((item,index) =>
    <Post key={index} post={item}/>
  );
};
export default ListPosts;