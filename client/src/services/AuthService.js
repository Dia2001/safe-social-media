import axios from "axios";
import config from "../config";
import { getToken, getHeaders } from "../utils";
async function register(email, pass, name, phone) {
  console.log(email, pass, name, phone);
  try {
    await axios.post(`${config.BASE_API}/users`, {
      name: name,
      email: email,
      password: pass,
      phone: phone,
    });
    alert("Registation user Successfully");
  } catch (err) {
    alert(err);
  }
}

async function login(email, password) {
  try{   
    console.log(email,password)
    console.log(config.BASE_API)
    const response= await axios.post(`${config.BASE_API}/auth/login`, {
      email: email,
      password: password,
    });
    return response;
  }catch(err){
    alert(err)
  }
}

const AuthService = {
  login,
  register
};

export { login,register };

export default AuthService;
