import React from "react";
import "../../styles/products/productsCalendar.css";
import ProductsDatePicker from "./ProductsDatePicker";
import { Link } from "react-router-dom";

function ProductsCalendar({ productDetails }) {
  const option = false;
  return (
    <div className="productsCalendar">
      <h2 className="productsCalendar__title">Fechas Disponibles</h2>
      <div className="productsCalendar__blockCalendar">
        <div className="productsCalendar__calendar">
          <ProductsDatePicker
            productDetails={productDetails}
            pickerDisabled={option}
          />
        </div>
        <div className="productsCalendar__reservation">
          <p>Agregá tus fechas de viaje para obtener precios exactos</p>
          <Link
            to={`/alojamientos/${
              productDetails.id
            }/${productDetails.name.replace(/[+ ]|%20/g, "-")}/reservar`}
          >
            <button className="">Iniciar reserva</button>
          </Link>
        </div>
      </div>
    </div>
  );
}

export default ProductsCalendar;
