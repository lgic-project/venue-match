import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Authentication from "./components/Auth/Authentication";
import Home from "./components/HomePage/Home";

import { ForgotPassword } from "./components/Auth/ForgotPassword";
import { Error404 } from "./components/ErrorPages/Error404";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import Admin from "./components/Admin/Users/Admin";
import { Dashboard } from "./components/Admin/Dashboard/Dashboard";
import { Users } from "./components/Admin/Users/Users";
import { Analytics } from "./components/Admin/Analytics/Analytics";
import { Contracts } from "./components/Admin/Contracts/Contracts";
import { Settings } from "./components/Admin/Settings/Settings";
const queryClient = new QueryClient();

function App() {
  return (
    <>
     <QueryClientProvider client={queryClient}>
      <Router>
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/auth" element={<Authentication />} />
            <Route path="/forgot-password" element={<ForgotPassword />} />
            <Route path ="/admin" element={<Dashboard/>}/>
            <Route path ="/users" element={<Admin/>}/>
            <Route path ="/analytics" element={<Analytics/>}/>
            <Route path ="/contracts" element={<Contracts/>}/>
            <Route path ="/settings" element={<Settings/>}/>

            <Route path="*" element={<Error404 />} />
          </Routes>
        
      </Router>
      </QueryClientProvider>
    </>
  );
}

export default App;
