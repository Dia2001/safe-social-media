
const Logout=()=>{
    if(localStorage.getItem('token'))
    {
        localStorage.removeItem('token');
        return true;
    }
    return false;
}

export default Logout;