import React from "react";
import { Link } from "react-router-dom";
import config from "../config";
const HiddenContent = () => {
    return <div className="absolute top-[-120px] left-0 w-full h-[120%] backdrop-blur-xl bg-BlackCool/25">
        <div className="sticky top-[90px] flex flex-col gap-6 justify-center items-center mx-auto bg-white w-[650px] min-h-[400px] rounded-md overflow-hidden shadow-md z-50">
            <h5>Xin lỗi bạn không thể xem nội dung này!</h5>
            <h6 className="text-BlackCool/50">Hãy đăng nhập & đăng ký</h6>
            <Link to={config.routes.login} type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 font-medium rounded-full text-sm px-8 py-4 text-center mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                <h5>Đăng nhập</h5>
            </Link>
            <Link  to={config.routes.register} type="button" class="text-white bg-yellow-400 hover:bg-yellow-500 focus:outline-none focus:ring-4 focus:ring-yellow-300 font-medium rounded-full text-sm px-8 py-4 text-center mr-2 mb-2 dark:focus:ring-yellow-900">
                <h5>Đăng ký</h5>
            </Link>
        </div>
    </div>;
};
export default HiddenContent;