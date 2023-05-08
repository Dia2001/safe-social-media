import React from 'react'
import FormLogin from './component/FormLogin'
import ImgDecoration from './component/ImgDecoration'

const Login = () => {
  return (
    <div className="grid grid-cols-3 h-[88vh]">
    <FormLogin/>
    <ImgDecoration/>
  </div>
  )
}

export default Login