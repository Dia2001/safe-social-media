import React from "react";
import FormRegister from "./components/FormRegister";
import ImgDecoration from "./components/ImgDecoration";
const Register = () => {

  return (
    <div className="grid grid-cols-3">
      <FormRegister/>
      <ImgDecoration/>
    </div>
  );
};

export default Register;
