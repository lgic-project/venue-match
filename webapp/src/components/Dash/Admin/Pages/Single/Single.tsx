import { useEffect, useState } from "react";
import {
  AppShell,
  Navbar,
  Header,
  MediaQuery,
  Burger,
  useMantineTheme,
  SimpleGrid,
} from "@mantine/core";
import { Sidebar } from "../../Components/Sidebar/Sidebar";
import DashNavbar from "../../Components/Navabar/Navbar";
import Normal from "../../Components/Charts/Normal/Normal";
import BasicTable from "../../Components/Table/Table";
import "./Single.scss"
import { Link, useParams } from "react-router-dom";
import axios from "axios";

export default function Single() {
  const theme = useMantineTheme();
  const [opened, setOpened] = useState(false);
  const  {userId} = useParams()
  const [userFirstName,setUserFirstName]=useState();
  const [userLastName,setUserLastName]=useState();
  const [email,setEmail]=useState();
  const [role,setRole]=useState();
  let userName = userFirstName + " " + userLastName
  useEffect(() => {
    axios
      .get(
        `https://kritisubedi.com.np/SnTravels/api/index//get-users?user_id=${userId}`
      )
      .then((response) => {
          const userArray = response.data.users;
          if (userArray.length > 0){
              const user = userArray[0];
              setUserFirstName(user.firstName)
              setUserLastName(user.lastName)
             setEmail(user.email)
             setRole(user.role)
        }

      })
      .catch((error) => {
          console.error("Error fetching data", error);
      });
  });
  return (
    <AppShell
      style={{ backgroundColor: "#f8f9fa" }}
      layout="alt"
      styles={{
        main: {
          background:
            theme.colorScheme === "dark"
              ? theme.colors.dark[8]
              : theme.colors.gray[0],
        },
      }}
      navbarOffsetBreakpoint="sm"
      asideOffsetBreakpoint="sm"
      navbar={
        <Navbar
          p="md"
          hiddenBreakpoint="sm"
          hidden={!opened}
          width={{ sm: 200, lg: 250 }}
        >
          <MediaQuery largerThan="sm" styles={{ display: "none" }}>
            <Burger
              opened={opened}
              onClick={() => setOpened((o) => !o)}
              size="sm"
              color={theme.colors.gray[6]}
              mr="xl"
              style={{
                position: "absolute",
                right: "-15px",
                zIndex: 999,
                top: "20px",
              }}
            />
          </MediaQuery>
          <Sidebar />
        </Navbar>
      }
      header={
        <Header
          height={{ base: 50, md: 60 }}
          p="xs"
          style={{ backgroundColor: "#f8f9fa" }}
        >
          <div
            style={{ display: "flex", alignItems: "center", height: "100%" }}
          >
            <MediaQuery largerThan="sm" styles={{ display: "none" }}>
              <Burger
                opened={opened}
                onClick={() => setOpened((o) => !o)}
                size="sm"
                color={theme.colors.gray[6]}
                mr="xl"
              />
            </MediaQuery>
            <DashNavbar  />
          </div>
        </Header>
      }
    >
      <div style={{padding:"10px"}}>

      <SimpleGrid
            cols={2}
            spacing="20px"
            verticalSpacing="20px"
            breakpoints={[
              { maxWidth: "36rem", cols: 1, spacing: "sm" },
            ]}
          >
      <div className="left1">
         <Link to='edit'>
            <div className="editButton1">Edit</div>
            </Link>
            <div className="listTitle">Information <span style={{textDecoration:"underline"}}>( {role} )</span></div>
            <div className="item1">
              <img
                src="https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=785&q=80"
                alt=""
                className="itemImage1"
              />
              <div className="details1">
                <h1 className="itemTitle1">{userName?userName:"No Name"}</h1>
                <div className="detailItem1">
                  <span className="itemKey1">Email:</span>
                  <span className="itemValue1">{email}</span>
                </div>
                <div className="detailItem1">
                  <span className="itemKey1">Phone:</span>
                  <span className="itemValue1">+977 61 232 323 </span>
                </div>
                <div className="detailItem1">
                  <span className="itemKey1">Address:</span>
                  <span className="itemValue1">Elton St.234 LakeSide. Pokhara</span>
                </div>
                <div className="detailItem1">
                  <span className="itemKey1">Country:</span>
                  <span className="itemValue1">NEPAL</span>
                </div>
              </div>
            </div>
          </div>
            <Normal aspect={3 / 1} title="User Spending (Last 6 Months)"/>
      </SimpleGrid>
        <div style={{ paddingTop: "20px" }}>
        <div className="listContainer">
          <div className="listTitle">Latest Transaction</div>
          <BasicTable/>
        </div>
      </div>
      </div>
    </AppShell>
  );
}
