import "./Navbar.scss";
import SearchIcon from "@mui/icons-material/Search";
import LanguageIcon from "@mui/icons-material/Language";
import DarkModeOutlinedIcon from "@mui/icons-material/DarkModeOutlined";
import FullscreenExitIcon from "@mui/icons-material/FullscreenExit";
import NotificationsNoneIcon from "@mui/icons-material/NotificationsNone";
import ChatBubbleOutlineIcon from "@mui/icons-material/ChatBubbleOutline";
import ListIcon from "@mui/icons-material/List";



export default function DashNavbar() {
  return (
    <div className="navbar1">
      <div className="wrapper1">
        <div className="search1">
          <input type="text" placeholder="Search..." />
          <SearchIcon />
        </div>
        <div className="items1">
          <div className="item1 mobilenone" style={{gap:"5px"}}>
            <LanguageIcon className="icon1" />
            <span>English</span>
          </div>
          <div className="item1 mobilenone">
            <DarkModeOutlinedIcon className="icon1 mobilenone" />
          </div>
          <div className="item1 mobilenone">
            <FullscreenExitIcon className="icon1" />
          </div>
          <div className="item1 mobilenone">
            <NotificationsNoneIcon className="icon1" />
            <div className="counter1">1</div>
          </div>
          <div className="item1 mobilenone">
            <ChatBubbleOutlineIcon className="icon1" />
            <div className="counter1">2</div>
          </div>
          <div className="item1 mobilenone">
            <ListIcon className="icon1"/>
            </div>
          <div className="item1">
            <img
              src="https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=785&q=80"
              alt=""
              className="avatar1"
            />
          </div>
        </div>
      </div>
    </div>
  );
}
