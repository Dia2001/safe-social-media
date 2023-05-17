import React, { useState, useEffect } from "react";
import { HiOutlineEyeOff as EyeOff, HiOutlineEye as Eye } from "react-icons/hi";
import AuthService from "../../../services/AuthService";
import { useNavigate } from "react-router-dom";
import config from "../../../config";

const FormLogin = () => {
  const [isShowPass, setIsShowPass] = useState(false);
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const navigate = useNavigate();
  useEffect(() => {
    const keyDownHandler = (event) => {
      if (event.key === "Enter") {
        event.preventDefault();
        handleLogin();
      }
    };
    document.addEventListener("keydown", keyDownHandler);

    return () => {
      document.removeEventListener("keydown", keyDownHandler);
    };
  }, [password]);

  const handleLogin = async (e) => {
    const result = await AuthService.login(email,password);
    console.log(result);
    console.log(result.data.token)
    if (result) {
      
      localStorage.setItem("token", result.data.token);
      alert('login sucess');
      navigate(config.routes.home)
    } else {
      alert('Tên tài khoản hoặc mật khẩu không chính xác!')
    }
  };

  return (
    <div className="h-[88vh] w-[425px] bg-white  z-20  col-span-1">
      <div className="w-[80%] bg-white  ml-9 mt-3">
        <div className="w-[10%] ml-36  mt-20">
          <svg
            width="55"
            height="55"
            viewBox="0 0 55 55"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <ellipse
              cx="27.5373"
              cy="27.4749"
              rx="25.5"
              ry="29"
              transform="rotate(-45 27.5373 27.4749)"
              fill="url(#paint0_linear_100_516)"
            />
            <path
              d="M33.139 28.4117C30.4878 25.9081 25.9793 23.8213 22.9967 22.4399C22.4914 22.2069 22.0353 21.9969 21.6481 21.8099C20.5226 21.2684 18.9837 19.7689 19.6465 18.0463C20.0928 16.8814 21.2248 16.2941 23.0164 16.2941C23.5906 16.2941 24.2206 16.3597 24.8932 16.4844C27.2295 16.9208 29.0013 17.7936 30.0054 18.2891C30.1301 18.3514 30.2745 18.358 30.4057 18.312C30.5337 18.2628 30.642 18.1644 30.6978 18.0364L32.9979 12.8488C33.0996 12.6224 33.0209 12.3533 32.8109 12.2155C31.1899 11.1392 27.1442 9.54126 22.6488 9.54126C21.9992 9.54126 21.3528 9.57407 20.7228 9.6397C17.1396 10.0072 13.5499 10.962 11.5615 15.4278C10.3212 18.207 10.3245 21.3374 11.5648 23.5949C12.8904 26.0591 15.0626 27.1616 17.8123 28.5528L18.1667 28.7333C20.1518 29.7242 22.5307 30.8267 24.0959 31.5519C26.4092 32.6675 27.2656 34.6494 26.734 35.8438C25.8776 37.7699 23.9843 38.1931 20.7096 37.2645C17.8188 36.4803 15.1512 34.2655 14.4064 33.6059C14.2948 33.5075 14.1471 33.4616 13.9962 33.4813C13.8485 33.5009 13.7173 33.5863 13.6353 33.7077L10.0718 39.1709C9.93729 39.3777 9.96682 39.65 10.144 39.8206C11.9913 41.6024 13.4974 42.6392 16.106 43.9222C17.8615 44.7852 20.4307 45.3036 22.9803 45.3036C25.6446 45.3036 32.1513 44.6867 35.006 38.9839C36.8271 35.3352 36.1479 31.4895 33.139 28.4117Z"
              fill="#40C0E7"
            />
            <path
              d="M48.2288 29.0512L36.9788 49.3012C36.7763 49.6612 36.405 49.875 36 49.875C35.91 49.875 35.8088 49.8637 35.7188 49.8412C35.2238 49.7062 34.875 49.2675 34.875 48.75V36.375H24.75C24.3675 36.375 24.0188 36.1837 23.805 35.8687C23.6025 35.5537 23.5688 35.1488 23.715 34.8L31.59 16.8C31.77 16.395 32.175 16.125 32.625 16.125H39.375C39.7463 16.125 40.095 16.305 40.3088 16.62C40.5113 16.9238 40.5563 17.3175 40.4213 17.6662L36.54 27.375H47.25C47.6438 27.375 48.015 27.5887 48.2175 27.9262C48.42 28.275 48.4313 28.7025 48.2288 29.0512Z"
              fill="#FFB841"
            />
            <circle
              cx="8"
              cy="48"
              r="6"
              transform="rotate(180 8 48)"
              fill="#D2F3FF"
            />
            <defs>
              <linearGradient
                id="paint0_linear_100_516"
                x1="27.5373"
                y1="-1.52513"
                x2="27.5373"
                y2="56.4749"
                gradientUnits="userSpaceOnUse"
              >
                <stop stop-color="#D2F3FF" />
                <stop offset="1" stop-color="#B0E9FF" />
              </linearGradient>
            </defs>
          </svg>
        </div>

        <h6 className="font-sans text-center">
          Safe Social-Mạng xã hội trực tuyến an toàn
        </h6>

        <div className="w-full py-2">
          <input
            type="text"
            className="p-2x w-[95%] ml-2 rounded-md border shadow-md"
            placeholder="Email *"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
          />
        </div>
        <div className="relative w-full py-2">
          <input
            type={`${isShowPass ? "text" : "password"}`}
            className="p-2x w-[95%] ml-2 rounded-md border shadow-md"
            placeholder="Password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
          {!isShowPass ? (
            <EyeOff
              className="absolute right-4 bottom-4"
              onClick={() => setIsShowPass(!isShowPass)}
              size={35}
            />
          ) : (
            <Eye
              className="absolute right-3 bottom-4"
              onClick={() => setIsShowPass(!isShowPass)}
              size={35}
            />
          )}
        </div>
        <div className="w-full flex ml-4 py-2">
          <label className="flex gap-1 ">
            <input type="checkbox" />
            <h6>Duy trì đăng nhập</h6>
          </label>
        </div>
        <button
          onClick={handleLogin}
          className=" ml-2 w-[95%] px-2x py-4 bg-[#b0e9ff] hover:opacity-75 text-white font-bold rounded-md "
        >
          <h5>Đăng nhập</h5>
        </button>
        <div className="w-[80%] mx-auto flex justify-between my-2x">
          <h6 className="underline underline-offset-1 text-DarkBlue">
            Quên mật khẩu?
          </h6>
          <h6 className="underline underline-offset-1 text-DarkBlue">
            Điều khoản sử dụng?
          </h6>
        </div>
      </div>
    </div>
  );
};

export default FormLogin;
