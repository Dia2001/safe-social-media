import React from "react";
import { Link } from "react-router-dom";
import imgError from "../../assets/images/error-page.svg";
const Error = () => {
  return (
    <div className="h-[100vh] bg-Black5 flex justify-center items-center">
      <div className="w-[610px] bg-white shadow-sm">
        <h1 className="text-ErrorColor/75 text-center">404 :(</h1>
        <h4 className="text-center">Không tìm thấy trang !</h4>
        <div className="flex justify-between p-1x">
          <Link to="/" className="bg-DarkBlue self-end hover:opacity-75 text-white font-semibold w-fit h-fit p-1x">
            <h5>Về trang chủ</h5>
          </Link>
          <img className="w-[110px] h-[110px]" src={imgError} alt="trang lỗi" />
        </div>
      </div>
    </div>
  );
};

export default Error;