import Header from "./components/Header";
import Login from "./pages/login/Login";
import Register from "./pages/register/Register";
import Home from "./pages/home/home";
import Personal from "./pages/personal/Personal";
import LargePost from "./components/LargePost";
import UpPost from "./components/UpPost";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import publicRoutes from "./routes";

function App() {
  return (
  <BrowserRouter>
    <Routes>
      {publicRoutes.map((route,index)=>{
        const Page=route.component;
        return (<Route
        key={index}
        path={route.path}
        element={
          <>
          <Header/>
          <Page/>
          </>
        }
        />)
      })}
    </Routes>
  </BrowserRouter>
  );
}

export default App;
