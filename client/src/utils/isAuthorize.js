import jwt_decode from 'jwt-decode';

const isAuthorize=()=>{
    var isExpiredResult=false;
    const token = localStorage.getItem('token');
    if(token!==null){
        const decoded=jwt_decode(token);
        const now = new Date().getTime()/1000;
        if(now<decoded.exp){
            isExpiredResult=true;
        }
    }
    return isExpiredResult;
}

export default isAuthorize;