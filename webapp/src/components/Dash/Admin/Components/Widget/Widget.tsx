import "./Widget.scss";
import KeyboardArrowUpIcon from "@mui/icons-material/KeyboardArrowUp";
import PersonOutlineIcon from "@mui/icons-material/PersonOutline";
import MonetizationOnOutlinedIcon from "@mui/icons-material/MonetizationOnOutlined";
import AccountBalanceWalletOutlinedIcon from "@mui/icons-material/AccountBalanceWalletOutlined";
import { IconBrandBooking, IconBuildingCottage } from "@tabler/icons-react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faBowlFood } from "@fortawesome/free-solid-svg-icons";
import { useEffect, useState } from "react";
import axios from "axios";
import { Link } from "react-router-dom";


interface WidgetData {
  title: string;
  isMoney: boolean;
  link: string;
  icon: JSX.Element;
  amount:string;
  linkto:string;
}

interface WidgetProps {
  type: string;
}

export default function Widget({ type }: WidgetProps) {

  let data: WidgetData | undefined;
  const [userCount, setUserCount] = useState();
  const [venueCount, setVenueCount] = useState();
  const [categoryCount, setCategoryCount] = useState();
  const [bookingCount, setBookingCount] = useState();
  const [totalAmount, setTotalAmount] = useState();
  // temp data
  const diff = 20;

  useEffect(() => {
    axios
      .get("https://kritisubedi.com.np/SnTravels/api/index//total-users")
      .then((response) => {
        setUserCount(response.data.total_users);
      })
      .catch((error) => {
        console.error("Error fetching data", error);
      });
  }, []);
  useEffect(() => {
    axios
      .get("https://kritisubedi.com.np/SnTravels/api/index//total-venues")
      .then((response) => {
        setVenueCount(response.data.total_venues);
      })
      .catch((error) => {
        console.error("Error fetching data", error);
      });
  }, []);
  useEffect(() => {
    axios
      .get("https://kritisubedi.com.np/SnTravels/api/index//total-categories")
      .then((response) => {
        setCategoryCount(response.data.total_categories);
      })
      .catch((error) => {
        console.error("Error fetching data", error);
      });
  }, []);
  useEffect(() => {
    axios
      .get("https://kritisubedi.com.np/SnTravels/api/index//total-bookings")
      .then((response) => {
        setBookingCount(response.data.total_bookings);
      })
      .catch((error) => {
        console.error("Error fetching data", error);
      });
  }, []);
  useEffect(() => {
    axios
      .get("https://kritisubedi.com.np/SnTravels/api/index//total-amount")
      .then((response) => {
        setTotalAmount(response.data.total_amount);
      })
      .catch((error) => {
        console.error("Error fetching data", error);
      });
  }, []);

  switch (type) {
    case "user":
      data = {
        title: "USERS",
        isMoney: false,
        link: "See all users",
        icon: (
          <PersonOutlineIcon
            className="icon"
            style={{ color: "crimson", backgroundColor: "rgba(255,0,0,0.2)" }}
          />
        ),
        amount:`${userCount}`,
        linkto:"/users"
      };
      break;
    case "venue":
      data = {
        title: "VENUES",
        isMoney: false,
        link: "View all venues",
        icon: (
          <IconBuildingCottage
            className="icon"
            style={{ color: "goldenrod", backgroundColor: "rgba(218,165,32,0.2)" }}
          />
        ),
        amount:`${venueCount}`,
        linkto:"/venue"

      };
      break;
      case "myvenue":
        data = {
          title: "MY VENUES",
          isMoney: false,
          link: "View all venues",
          icon: (
            <IconBuildingCottage
              className="icon"
              style={{ color: "goldenrod", backgroundColor: "rgba(218,165,32,0.2)" }}
            />
          ),
          amount:"100",
          linkto:"#"
        };
        break;
    case "earning":
      data = {
        title: "TOTAL EARNINGS",
        isMoney: true,
        link: "View net earnings",
        icon: (
          <MonetizationOnOutlinedIcon
            className="icon"
            style={{ color: "green", backgroundColor: "rgba(0,128,0,0.2)" }}
          />
        ),
        amount:`${totalAmount}`,
        linkto:"/bookings"

      };
      break;
    case "balance":
      data = {
        title: "BALANCE",
        isMoney: true,
        link: "See details",
        icon: (
          <AccountBalanceWalletOutlinedIcon
            className="icon"
            style={{ color: "purple", backgroundColor: "rgba(128,0,128,0.2)" }}
          />
        ),
        amount:`${totalAmount}`,
        linkto:"#"

      };
      break;
      case "categories":
        data = {
          title: "CATEGORIES",
          isMoney: false,
          link: "View all categories",
  
          icon: (
            <AccountBalanceWalletOutlinedIcon
              className="icon"
              style={{ color: "purple", backgroundColor: "rgba(128,0,128,0.2)" }}
            />
          ),
          amount:`${categoryCount}`,
          linkto:"/categories"

        };
        break;
        case "mycategories":
          data = {
            title: "MY CATEGORIES",
            isMoney: false,
            link: "View all categories",
    
            icon: (
              <AccountBalanceWalletOutlinedIcon
                className="icon"
                style={{ color: "purple", backgroundColor: "rgba(128,0,128,0.2)" }}
              />
            ),
            amount:`${categoryCount}`,
            linkto:"#"

          };
          break;
      case "bookings":
        data = {
          title: "BOOKINGS",
          isMoney: false,
          link: "See details",
  
          icon: (
            <IconBrandBooking
              className="icon"
              style={{ color: "green", backgroundColor: "rgba(0,128,0,0.2)" }}
            />
          ),
          amount:`${bookingCount}`,
          linkto:"/bookings"

        };
        break;
        case "dishes":
        data = {
          title: "MY DISHES",
          isMoney: false,
          link: "See details",
  
          icon: (
            <FontAwesomeIcon icon={faBowlFood}className="icon"
            style={{ color: "crimson", backgroundColor: "rgba(255,0,0,0.2)" }}
            />

          ),
          amount:"100",
          linkto:"#"

        };
        break;
    default:
      break;
  }

  if (!data) {
    // Handle the case when `data` is undefined (no matching type)
    return null;
  }

  return (
    
    <div className="widget">
      <div className="left">
        <span className="title">{data.title}</span>
        <span className="counter">
          {data.isMoney && "Nrs "}
          {data.amount}
        </span>
        <Link to={data.linkto}>
        <span className="link">{data.link}</span>
        </Link>
      </div>
      <div className="right">
        <div className="percentage positive">
          <KeyboardArrowUpIcon />
          {diff} %
        </div>
        {data.icon}
      </div>
    </div>
  );
}
