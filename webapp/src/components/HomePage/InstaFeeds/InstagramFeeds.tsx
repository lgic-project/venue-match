import { faInstagram } from "@fortawesome/free-brands-svg-icons"
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome"


export default function InstagramFeeds() {
  return (
    <section className="insta-feed-section">
    <figure className="mb-0 insta-feed-img">
        <img src="../src/assets/images/footer-background-img.jpg" alt="" className="img-fluid star"/>
    </figure>
  <div className="container">
      <div className="row">
          <div className="col-lg-12">
            <figure className="mb-0 insta-bird-fig">
                <img src="../src/assets/images/insta-bird-img.png" alt="" className="star"/>
            </figure>
            <figure className="insta-fig">
                <img src="../src/assets/images/insta-icon.png" alt=""/>
            </figure>
          </div>
      </div>
      <h2>Instagram Feed</h2>
      <div className="row">
          <div className="col-lg-3 col-md-3 col-sm-6">
            <figure className="mb-0 insta-section-imgs">
                <img src="../src/assets/images/insta-section-img1.png" alt="" className="img-fluid"/>
                <div className="hover_box_plus">
                    <a href="#"><FontAwesomeIcon icon={faInstagram} style={{marginRight:"4px"}} />Venue Match</a>
                </div>
            </figure>
          </div>
          <div className="col-lg-3 col-md-3 col-fluid sm-6">
            <figure className="mb-0 insta-section-imgs">
                <img src="../src/assets/images/insta-section-img2.png" alt="" className="img-fluid"/>
                <div className="hover_box_plus">
                    <a href="#"><FontAwesomeIcon icon={faInstagram} style={{marginRight:"4px"}} />Venue Match</a>
                </div>
            </figure>
        </div>
        <div className="col-lg-3 col-md-3 col-sm-6">
            <figure className="mb-0 insta-section-imgs insta-section-imgs-mb">
                <img src="../src/assets/images/insta-section-img3.png" alt="" className="img-fluid"/>
                <div className="hover_box_plus">
                    <a href="#"><FontAwesomeIcon icon={faInstagram} style={{marginRight:"4px"}} />Venue Match</a>
                </div>
            </figure>
        </div>
        <div className="col-lg-3 col-md-3 col-sm-6">
            <figure className="mb-0 insta-section-imgs insta-section-imgs-mb">
                <img src="../src/assets/images/insta-section-img4.png" alt="" className="img-fluid"/>
                <div className="hover_box_plus">
                    <a href="#"><FontAwesomeIcon icon={faInstagram} style={{marginRight:"4px"}} />Venue Match</a>
                </div>
            </figure> 
        </div>
      </div>
  </div>
</section>
  )
}
