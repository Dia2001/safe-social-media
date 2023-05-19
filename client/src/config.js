const config = {
  BASE_API: process.env.REACT_APP_BASE_URL_API,
  BASE_API_V1: process.env.REACT_APP_GATEWAY_API,
  routes:{
    home:'/',
    login:'/dang-nhap',
    register:'/dang-ky',
    personal:'/trang-ca-nhan',
    profile:'/thong-tin-ca-nhan'
}
};

export default config;
