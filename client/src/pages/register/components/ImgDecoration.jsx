import React from 'react'
import imgBaner from "../../../assets/images/baner.jpg";
const ImgDecoration = () => {
  return (
    <div style={{ backgroundImage: `url(${imgBaner})` }} className='h-[100%]  bg-cover bg-center bg-gray-100 flex items-center justify-center col-span-2'></div>
  )
}

export default ImgDecoration