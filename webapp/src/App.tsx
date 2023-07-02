import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Authentication from "./components/Auth/Authentication";
import Home from "./components/HomePage/Home";

import { ForgotPassword } from "./components/Auth/ForgotPassword";
import { Error404 } from "./components/ErrorPages/Error404";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import Admin from "./components/Admin/Users/Admin";
import { Dashboard } from "./components/Admin/Dashboard/Dashboard";
import { Analytics } from "./components/Admin/Analytics/Analytics";
import { Contracts } from "./components/Admin/Contracts/Contracts";
import { Settings } from "./components/Admin/Settings/Settings";
import Venue from "./components/Venue/Venue";
import Gallery from "./components/Gallery/Gallery";
import { SuccessSignUp } from "./components/SuccessPage/SuccessSignUp";
import PrivateRoute from "./components/utils/PrivateRoute";
import { MantineProvider } from "@mantine/core";
import { Notifications } from "@mantine/notifications";
import About from "./components/About/About";
import Detail from "./components/Venue/Detail";
import { ScrollToTop } from "./components/ScrollToTop/ScrollToTop";
const queryClient = new QueryClient();

function App() {
  return (
    <>
     <QueryClientProvider client={queryClient}>
     <MantineProvider>
     <Notifications position="top-right"/>
      <Router>
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/auth" element={<Authentication />} />
            <Route path="/forgot-password" element={<ForgotPassword />} />
            <Route path = "/success" element={<SuccessSignUp/>}/>
            <Route path = "/venues" element={<Venue/>}/>
            <Route path = "/gallery" element={<Gallery/>}/>
            <Route path = "/about" element={<About/>}/>
            <Route path="venues/detail/:id" element={<Detail/>}/>
            <Route path="*" element={<Error404 />} />
            <Route element={<PrivateRoute />}>
            <Route path ="/admin" element={<Dashboard/>}/>
            <Route path ="/users" element={<Admin/>}/>
            <Route path ="/analytics" element={<Analytics/>}/>
            <Route path ="/contracts" element={<Contracts/>}/>
            <Route path ="/settings" element={<Settings/>}/>
            </Route>
          </Routes>
        <ScrollToTop/>
      </Router>
      </MantineProvider>
      </QueryClientProvider>
    </>
  );
}

export default App;
