import React, { useState } from 'react'
import FormLogin from './component/FormLogin'
import ImgDecoration from './component/ImgDecoration'
import isAuthorize from '../../utils/isAuthorize'
import Logout from '../../utils/logout'

const Login = () => {
  const [auth, SetAuth] = useState(isAuthorize());

  const logout = () => {
    if (Logout()) {
      window.location.reload(true);
      alert("Đăng xuất thành công.")
    }
    else
      alert("Đăng xuất không thành công.")
  }
  return (
    <div>
      {auth ? <div className="flex justify-center h-[256px] items-center">
        <div className="flex flex-col gap-4 items-center">
          <h5>Bạn đã đăng nhập? Hãy đăng xuất để đăng nhập tài khoản khác</h5>
          <button type="button" class="h-fit w-fit focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900">
            <h5 onClick={logout}>Đăng xuất</h5>
          </button>
        </div>
      </div> : <div>
        <div className="grid grid-cols-3 h-[88vh]">
          <FormLogin />
          <ImgDecoration />
        </div>
      </div>}
    </div>
  )
}

export default Login