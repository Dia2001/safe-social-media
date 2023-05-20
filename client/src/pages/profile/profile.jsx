import React, { useEffect, useState } from "react";
import isAuthorize from "../../utils/isAuthorize";
import Error from "../error/error";
import getCurrentUserId from "../../utils/getCurrentUser";
import getUser from "../../utils/getUser";
import Avatar from '../../assets/images/anhdaidien.jpeg';
import axios from "axios";

const Profile = () => {

  const [auth, SetAuth] = useState(isAuthorize());
  const [user, setUser] = useState({})
  const [name, setName] = useState('');
  const [phone, setPhone] = useState('');

  //get current user's information
  useEffect(
    () => {
      (
        async () => {
          const currentUserId = await getCurrentUserId();
          if (currentUserId != null) {
            const currentUser = await getUser(currentUserId);
            setUser(currentUser);
            setName(currentUser.name);
            setPhone(currentUser.phone);
          }
        }
      )();
    }
    , [])

  const onChangeName = async (e) => {
    setName(e.target.value);
    console.log(e.target.value);
  }
  const onChangePhone = async (e) => {
    setPhone(e.target.value);
  }

  function isNumeric(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
  }

  const updateUser = async () => {
    try {
      if(!isNumeric(phone))
      {
        alert("Hãy nhập số vào ô điện thoại!")
        return;
      }
      if (name != '' && phone != '') {
        const currentUserId = await getCurrentUserId();
        const user = await axios.put('http://localhost:5010/api/v1/users/' + currentUserId, {
          name: name,
          phone: phone
        });
      }
      alert("Cập nhật thành công");
      window.location.reload(true);
    } catch(e) {
      console.log(e);
      alert("Cập nhật không thành công");
    }
  }

  return <div>
    {auth ? <div className="mx-auto mt-[48px] p-4 border border-BlackCool/5 w-[750px] h-[369px] rounded-sm shadow-md bg-white">
      <h5>Thông tin cá nhân</h5>
      <div className="flex gap-4">
        <img src={Avatar} className="w-[80px] h-[80px] rounded-full shadow-sm" />
        <div>
          <h6 className="font-bold">{user.name}</h6>
          <h6>Ngày tạo {user.date}</h6>
        </div>
      </div>
      <hr className="border-2 my-4 border-BlackCool/5" />
      <div className="flex gap-16">
        <input type="text" onChange={onChangeName} className="outline outline-BlackCool/5 p-2" defaultValue={user.name} placeholder="Tên người dùng" />
        <input type="text" onChange={onChangePhone} className="outline outline-BlackCool/5 p-2" defaultValue={user.phone} placeholder="Số điện thoại" />
      </div>
      <div className="my-4">
        <h6>Email</h6>
        <h6>{user.email}</h6>
      </div>
      <div className="flex justify-end gap-4 m-8">
        <button type="button" onClick={updateUser} class="text-green-700 hover:text-white border border-green-700 hover:bg-green-800 focus:ring-4 focus:outline-none focus:ring-green-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:border-green-500 dark:text-green-500 dark:hover:text-white dark:hover:bg-green-600 dark:focus:ring-green-800">Cập nhật</button>
        <button type="button" class="text-gray-900 hover:text-white border border-gray-800 hover:bg-gray-900 focus:ring-4 focus:outline-none focus:ring-gray-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:border-gray-600 dark:text-gray-400 dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-gray-800">Hủy bỏ thay đổi</button>
      </div>
    </div> : <Error />}
  </div>;
};
export default Profile;