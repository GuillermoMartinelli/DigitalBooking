import React from "react";
import { imgLocationP } from "../../styleAux/fontAwesoneIcon";

const ReservationLocation = ({ product }) => {
  return (
    <div className="reservationD__containe__city">
      <span>{imgLocationP}</span>
      <p>
        {product.ciudad.city}, Argentina, a {product.id * 50} m del centro.
      </p>
    </div>
  );
};

export default ReservationLocation;
