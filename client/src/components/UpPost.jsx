import React, { useEffect, useState } from "react";
import { MdOutlineClose } from 'react-icons/md';
import axios from "axios";
import ImagePlaceholder from '../assets/images/image-placeholder.png';
import { AiOutlineGlobal } from 'react-icons/ai';
import isAuthorize from "../utils/isAuthorize";
import getUser from "../utils/getUser";
import getCurrentUserId from "../utils/getCurrentUser";
const UpPost = ({ openPost }) => {
    const [auth, SetAuth] = useState(false)
    const [user, SetUser] = useState('');
    const [avatar,SetAvatar]=useState('');
    useEffect(() => {

        var isAuth = isAuthorize();
        console.log(isAuth);
        SetAuth(isAuth);
        if (isAuth) {
            (async () => {
                const getNameUser = await getUser(getCurrentUserId());
                SetUser(getNameUser.name);
                SetAvatar(getNameUser.avatar);
            })()
        }
    }, [])

    const [imageTmp, SetImageTmp] = useState(null);
    const [text, SetText] = useState("");
    const [enableSubmit, SetEnableSubmit] = useState(true);
    const [validText, SetValidText] = useState(false);

    const validatedText = (e) => {
        const text = e.target.value;
        SetText(text);
        if (text.length == 0 || text.length > 225) {
            SetValidText(false)
        } else {
            SetValidText(true)
        }
    }


    const onImageChange = (event) => {
        if (event.target.files && event.target.files[0]) {
            SetImageTmp(event.target.files[0]);
        }
    }
    //Use to submit post indirectly by using axios.
    const submitPost = () => {
        console.log("enter")

        //check text and image, if text, only post with text, if have image inside, post with text and image
        if (validText) {
            const postArticle = {
                paragraph: text,
                image: imageTmp,
            }
            axios.post(`http://localhost:3080/post-article`, postArticle, {
                headers: {
                    "Content-Type": "multipart/form-data",
                    "x-access-token": localStorage.getItem('token')
                }
            }).then((res) => {
                console.log(res.data);
                alert("Bạn đã đăng thành công!");
                window.location.reload(true);
            }).catch((err) => { console.log(err) })

        }
        else {
            alert("Nội dung của bạn không đúng!");
        }
    }

    return <div className="absolute top-[-120px] left-0 w-full h-[120%] bg-BlackCool/25">
        <div className="sticky top-[90px] mx-auto bg-white w-[650px] min-h-[600px] rounded-md overflow-hidden shadow-md z-50">
            <div className="flex justify-between p-4">
                <div className="flex gap-4">
                    <img src={avatar} className="shadow-sm w-[76px] h-[76px] rounded-full" />
                    <div>
                        <h5>{user}</h5>
                        <div className="flex gap-2 items-center">
                            <AiOutlineGlobal size={20} /> <h6>Công khai</h6>
                        </div>
                    </div>
                </div>
                <MdOutlineClose size={40} onClick={() => openPost()} className="bg-BlackCool/25 text-white rounded-full p-2 cursor-pointer" />
            </div>
            <div className="w-[420px] mx-auto">
                <textarea onChange={validatedText} name="paragraph" className="w-full h-[133px] outline-none p-4 text-[16px] rounded-md border-2 border-BlackCool/50 resize-none" placeholder="Bạn đang cảm thấy như thế nào ...">

                </textarea>
                {!validText ? <p className="m-2 text-ErrorColor">Không được bỏ trống hoặc vượt quá 225 ký tự ...</p> : <p className="m-2"></p>}
                <img src={imageTmp ? URL.createObjectURL(imageTmp) : ImagePlaceholder} className="w-[282px] h-[261px] mx-auto object-cover rounded-sm" />
                <div className="my-6 flex gap-6 justify-end">
                    <button onClick={submitPost} className="text-white font-semibold py-2 px-4 w-fit h-fit bg-Secondary3 rounded-[24px] hover:opacity-90">Đăng bài viết</button>
                    <label htmlFor="uploadimage" className="text-white  font-semibold py-2 px-4 w-fit h-fit bg-ActiveColor rounded-[24px] hover:opacity-90">Tải lên</label>
                    <input id="uploadimage" onChange={onImageChange} type="file" accept="image/png, image/gif, image/jpeg" className="hidden" />
                </div>
            </div>

        </div>
    </div>
};
export default UpPost;