import "../../styles/products/productsHeader.css";
import React from "react";
import {  imgLocationP,  imgStar,  imgStarHalf,} from "../../styleAux/fontAwesoneIcon";
import { faStar } from "@fortawesome/free-regular-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import ProductsHeaderTop from "./ProductsHeaderTop";

function ProductsHeader(props) {

  const product = props.productDetails;
  const imgStarRegular = <FontAwesomeIcon className="fa-star" icon={faStar} />;
  if (product !== "" && product.ciudad !== "") {
    return (
      <>
        <ProductsHeaderTop productDetails={product} linkProps={"/"}/>
        <div className="productsHeaderdetails">
          <div className="productsHeaderdetails__firtsblock">
            <div className="productsHeaderdetails__firtsblock__icon">
              <span>{imgLocationP}</span>
            </div>
            <div className="productsHeaderdetails__firtsblock__text">
              <p>
              {product.ciudad.city}, Argentina
              </p>
              <p className="productsHeaderdetails__firtsblock__distance">
                A {(product.id)*50} m del centro
              </p>
            </div>
          </div>
          <div className="productsHeaderdetails__secondblock">
            <div>
              <p>Muy Bueno</p>
              <div className="productsHeaderdetails__secondblock__stars">
                <span>{imgStar}</span>
                <span>{imgStar}</span>
                <span>{imgStar}</span>
                <span>{imgStarHalf}</span>
                <span>{imgStarRegular}</span>
              </div>
            </div>
            <div className="productsHeaderdetails__secondblock__number">
              <div>8</div>
            </div>
          </div>
        </div>
      </>
    );
  } else {
    return (
      <div>
        <h2> No pudimos cargar el producto </h2>
      </div>
    );
  }
}

export default ProductsHeader;
