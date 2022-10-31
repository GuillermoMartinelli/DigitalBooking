import React, { useState, useEffect, useContext } from "react";
import "../../styles/profile/account.css";
import BannerImg from "../../assets/images/bannerBooking.png";
import ProductCard from "../ProductCard";
import axios from "axios";
import { baseUrl, getFavByUser } from "../../constants/urls";
import FilterContext from "../../context/FilterContext";
import Movements from "./Movements";
import { Link } from "react-router-dom";
import {  imgLeft } from "../../styleAux/fontAwesoneIcon";

function Account() {
  const [favoritosList, setFavoritosList] = useState([]);
  const { setFilterDate, filterDateSearch } = useContext(FilterContext);

  function searchButton() {
    setFilterDate(filterDateSearch);
  }

  function getfavById() {
    axios
      .get(baseUrl + getFavByUser + localStorage.id)
      .then((response) => {
        setFavoritosList(response.data);
      })
      .catch((error) => console.error(`Error: ${error}`));
  }
  useEffect(() => {
    getfavById();
  }, []);
  return (
    <>
     <div><div className="productsHeader">
    <div className="productsHeader__blockLeft">
    </div>
    <div className="productsHeader__blockRight">
      <Link to={"/"}>
        <span className="productsHeader__blockRight__button">
          {imgLeft}
        </span>
      </Link>
    </div>
  </div></div>
      <div className="account">
        <img className="account__image" src={BannerImg} alt="banner_profile" />
        <div className="account__title">
          <h2>Bienvenido {localStorage.userName}</h2>
          <h3>a tu espacio personal en Digital Booking</h3>
        </div>
        <div className="account__fav">
          <h3>Mis Reservas</h3>
          <div>
            <Movements />
          </div>
        </div>
        <div className="account__fav">
          <h3>Mis favoritos</h3>
          <div className="movements">
            <div className="movements__title">
              <span>Tus&nbsp;</span> Favoritos
            </div>
            <div className="movements__title2">
              A continuación podrás ver el detalle de tus favoritos.
            </div>
          </div>
          <div className="account__favoritos__list">
            {favoritosList.length === 0 ? (
              <div className="account__favoritos__null">
                Aún no tenes favoritos agregados en tu lista personal.
              </div>
            ) : (
              favoritosList.map((host) => (
                <ProductCard
                  key={host.producto.id}
                  data={host.producto}
                  searchButton={searchButton}
                />
              ))
            )}
          </div>
        </div>
      </div>
    </>
  );
}

export default Account;
