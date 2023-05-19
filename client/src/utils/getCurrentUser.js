import isAuthorize from "./isAuthorize";
import jwt_decode from 'jwt-decode';
const getCurrentUserId=() =>{
    if(isAuthorize()){
        const token=localStorage.getItem('token');
        const decoded=jwt_decode(token);
        const userId=decoded.currentUser.id;
        return userId;
    }
    return null;
}

export default getCurrentUserId;