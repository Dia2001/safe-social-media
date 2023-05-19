import axios from 'axios';
const getUser=async (user_id)=>{
  const apiUser=process.env.REACT_APP_BASE_URL_API+'/users/'+user_id;
    const user=await axios.get(apiUser)
    return user.data;
   
}

export default getUser;