import Footer from "../HomePage/FooterSection/Footer";
import Header from "../HomePage/HomeHeaderSection/Header";
import TopHeader from "../HomePage/HomeHeaderSection/TopHeader";
import GalleryTop from "./GalleryTop";
import GetInTouch from "./GetInTouch";
import AppDemo from "../HomePage/Appdemo/AppDemo";

export default function Gallery() {
  return (
    <div className="home-header-section sub-header-section">
      <TopHeader />
      <Header />
      <GalleryTop />
      <GetInTouch />
      <AppDemo/>
      <Footer/>
    </div>
  );
}
