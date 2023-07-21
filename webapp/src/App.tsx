import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Authentication from "./components/Auth/Authentication";
import Home from "./components/HomePage/Home";
import { Error404 } from "./components/ErrorPages/Error404";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import Venue from "./components/Venue/Venue";
import Gallery from "./components/Gallery/Gallery";
import { SuccessSignUp } from "./components/SuccessPage/SuccessSignUp";
import { Notifications } from "@mantine/notifications";
import About from "./components/About/About";
import Detail from "./components/Venue/Detail";
import { ScrollToTop } from "./components/ScrollToTop/ScrollToTop";
import { ForgotPassword } from "./components/Auth/ForgotPassword";

import { useEffect, useState } from "react";
import axios from "axios";

import AdminRoute from "./components/utils/AdminRoute";
import DashHome from "./components/Dash/Admin/Pages/Home/Home";
import List from "./components/Dash/Admin/Pages/List/List";
import {
  bookingColumns,
  categoryColumns,
  userColumns,
  venueColumns,
} from "./components/Dash/Admin/Components/Datatable/DataTableSource";
import Single from "./components/Dash/Admin/Pages/Single/Single";
import Edit from "./components/Dash/Admin/Pages/Edit/Edit";
import NewUser from "./components/Dash/Admin/Pages/NewUser/NewUser";
import SingleVenue from "./components/Dash/Admin/Pages/SingleVenue/SingleVenue";
import Dish from "./components/Dash/Admin/Pages/Dish/Dish";
import NewVenue from "./components/Dash/Admin/Pages/NewVenue/NewVenue";
import SingleCategory from "./components/Dash/Admin/Pages/SingleCategory/SingleCategory";
import NewCategory from "./components/Dash/Admin/Pages/NewCategory/NewCategory";
import VenueOwnerRoute from "./components/utils/VenueOwnerRoute";
import VenueOwnerHome from "./components/Dash/VenueOwner/Pages/Home/VenueOwnerHome";
import SingleBookingDetail from "./components/Dash/Admin/Pages/SingleBookingDetail/SingelBookingDetail";
import Stats from "./components/Dash/Admin/Pages/Stats/Stats";

const queryClient = new QueryClient();

function App() {
  const [allUsersData, setAllUsersData] = useState([]);
  const [venueData, setVenueData] = useState([]);
  const [categoryData, setCategoryData] = useState({});
  const [bookingData, setBookingData] = useState({});
  useEffect(() => {
    axios
      .get("https://kritisubedi.com.np/SnTravels/api/index/get-users")
      .then((response) => {
         // Extract the users data from the response
        //  const { users } = response.data;

         // Extract the user_id values and store them in an array
        //  const userIds = users.map((user:any) => user.user_id);
 
         // Set the user_id values in the state
        setAllUsersData(response.data.users);
      })
      .catch((error) => {
        console.error("Error fetching data", error);
      });
  }, []);
  useEffect(() => {
    axios
      .get("https://kritisubedi.com.np/SnTravels/api/index/get-venues")
      .then((response) => {
        setVenueData(response.data.venues);
      })
      .catch((error) => {
        console.error("Error fetching data", error);
      });
  }, []);
  useEffect(() => {
    axios
      .get("https://kritisubedi.com.np/SnTravels/api/index/get-categories")
      .then((response) => {
        setCategoryData(response.data.categories);
      })
      .catch((error) => {
        console.error("Error fetching data", error);
      });
  }, []);
  useEffect(() => {
    axios
      .get("https://kritisubedi.com.np/SnTravels/api/index/get-bookings")
      .then((response) => {
        setBookingData(response.data.bookings);
      })
      .catch((error) => {
        console.error("Error fetching data", error);
      });
  }, []);

  return (
    <QueryClientProvider client={queryClient}>
      <Router>
        {/* <MantineProvider> */}
        <Notifications position="top-right" />
        <Routes>
          <Route path="/">
            <Route index element={<Home />} />
            <Route path="success" element={<SuccessSignUp />} />
            <Route path="gallery" element={<Gallery />} />
            <Route path="about" element={<About />} />
            <Route path="auth">
              <Route index element={<Authentication />} />
              <Route path="forgot-password" element={<ForgotPassword />} />
            </Route>
            <Route path="venues">
              <Route index element={<Venue />} />
              <Route path=":id" element={<Detail />} />
            </Route>
            <Route element={<AdminRoute />}>
              <Route path="admin" element={<DashHome />} />
              <Route path="users">
                <Route
                  index
                  element={
                    <List
                      title="User Table"
                      tableColumns={userColumns}
                      tableRows={allUsersData}
                      showAddNewButton={true}
                    />
                  }
                />
                <Route path=":userId">
                  <Route index element={<Single />} />
                  <Route path="edit" element={<Edit />} />
                </Route>
                <Route path="new" element={<NewUser />} />
              </Route>
              <Route path="venue">
                <Route
                  index
                  element={
                    <List
                      title="Venue Table"
                      tableColumns={venueColumns}
                      tableRows={venueData}
                      showAddNewButton={true}

                    />
                  }
                />
                <Route path=":venueId">
                  <Route index element={<SingleVenue />} />
                  <Route path="dish" element={<Dish />} />
                </Route>
                <Route path="new" element={<NewVenue />} />
              </Route>
              <Route path="categories">
                <Route
                  index
                  element={
                    <List
                      title="Category Table"
                      tableColumns={categoryColumns}
                      tableRows={categoryData}
                      showAddNewButton={true}
                    />
                  }
                />
                <Route path=":categoryId">
                  <Route index element={<SingleCategory />} />
                  <Route path=":venueId">
                    <Route index element={<SingleVenue />} />
                    <Route path="dish" element={<Dish />} />
                  </Route>
                  <Route path="new" element={<NewVenue />} />
                </Route>
                <Route path="new" element={<NewCategory />} />
              </Route>
              <Route path="bookings">
                <Route
                  index
                  element={
                    <List
                      title="Current Bookings"
                      tableColumns={bookingColumns}
                      tableRows={bookingData}
                    />
                  }
                />
                <Route path=":bookingId" element={<SingleBookingDetail/>}/>
              </Route>
              <Route path="stats" element={<Stats/>}/>
              <Route path="profile" element={<Single />} />
            </Route>
            <Route element={<VenueOwnerRoute />}>
              <Route path="venue-owner" element={<VenueOwnerHome />} />
            </Route>
            <Route path="*" element={<Error404 />} />
          </Route>
        </Routes>
        <ScrollToTop />
        {/* </MantineProvider> */}
      </Router>
    </QueryClientProvider>
  );
}

export default App;
