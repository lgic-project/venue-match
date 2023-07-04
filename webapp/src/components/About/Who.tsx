import { Link } from "react-router-dom";

export default function Who() {
  return (
    
    <div className="about-section about-page" style={{paddingBottom:"0"}}>
            <div className="container">
                <div className="row">
                    <div className="col-xl-6 col-lg-6 col-md-6 col-sm-12 order-lg-1 order-1">
                        <div className="about-us-content aos-init aos-animate" data-aos="fade-up">
                            <h5 className="autorix-text"><span className="ityped">Who We Are</span><span className="ityped-cursor">|</span></h5>
                            <h2>Planner for Your Perfect Venue</h2>
                            <p className="aboutus-p">"At Venue Match, we believe that our clients' success is our success. We take a collaborative approach, working closely with each client to understand their objectives, challenges, and vision. Our team of dedicated professionals goes above and beyond to deliver personalized solutions, creating memorable experiences for guests while maximizing the venue's potential." </p>
                            
                            <div className="banner-btn discover-btn-banner">
                                <Link to="/venues" className="text-decoration-none">Get Started</Link>
                            </div>
                        </div>
                    </div>
                    <div className="col-xl-5 col-lg-6 col-md-6 col-sm-12 order-lg-2 order-2">
                        <div className="about-content-img">
                            <figure className="mb-0 about-section-f1"><img src="../src/assets/images/about-bird-icon.png" alt="" className="star"/>
                            </figure>
                            <figure className="mb-0 about-banner-img"><img src="../src/assets/images/nanu (1).png" alt="" className=""/>
                            </figure>
                        </div>
                    </div>

                </div>
            </div>
        </div>

  )
}

