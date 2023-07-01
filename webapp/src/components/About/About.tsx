

import Footer from '../HomePage/FooterSection/Footer';
import Header from '../HomePage/HomeHeaderSection/Header';
import TopHeader from '../HomePage/HomeHeaderSection/TopHeader';
import Aboutheader from './Aboutheader';
import Who from './Who';

export default function About() {
  return (
    
      <div className="home-header-section">
    <TopHeader />
    <Header />
    <div className="home-header-section">
      <div
        className="home-banner-section overflow-hidden position-relative"
        style={{ paddingTop: "0",paddingBottom:"100px" }}
      >
        <figure className="banner-img1 mb-0">
          <img
            src="../src/assets/images/banner-img1.png"
            alt=""
            className="star"
          />
        </figure>
        
        <figure className="banner-img2 mb-0">
          <img
            src="../src/assets/images/banner-img2.png"
            alt=""
            className="star"
          />
        </figure>
        <Aboutheader/>  
            

            </div>
     <Who/>
       </div>      
       <Footer/>
       </div>   
  );
}
