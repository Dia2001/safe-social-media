import config from "./config";
import Home from "./pages/home/home";
import Login from "./pages/login/Login";
import Personal from "./pages/personal/Personal";
import Profile from "./pages/profile/profile";
import Register from "./pages/register/Register";

const publicRoutes=[
  {path:config.routes.home,component:Home},
  {path:config.routes.login,component:Login},
  {path:config.routes.register,component:Register},
  {path:config.routes.personal,component:Personal},
  {path:config.routes.profile,component:Profile}
]

export default publicRoutes;