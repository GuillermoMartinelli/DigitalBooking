import React, { useContext, useEffect } from "react";
import { Link } from "react-router-dom";
import {
  imgWifi,
  imgStar,
  imgStarHalf,
  imgHeart,
  imgAirCond,
  imgParking,
  imgKitchen,
  imgPet,
  imgPool,
  imgTv,
} from "../styleAux/fontAwesoneIcon";
import { BsHeartFill } from "react-icons/bs";
import { imgLocation } from "../styleAux/fontAwesoneIcon";
import { faStar } from "@fortawesome/free-regular-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import "../styles/productCard.css";
import FilterContext from "../context/FilterContext";
import axios from "axios";
import { baseUrl, getFavByUser } from "../constants/urls";
import IsLoggedContext from "../context/isLogedContext";

const ProductCard = ({ data, searchButton }) => {
  const { setFavoritos, favoritos } = useContext(FilterContext);
  const token = JSON.parse(localStorage.getItem("userToken"));
  const imgStarRegular = <FontAwesomeIcon className="fa-star" icon={faStar} />;
  const { isLoged } = useContext(IsLoggedContext);

  const headersDelete = {
    headers: { Authorization: `Bearer ${token}` },
  };
  const headers = {
    "Content-Type": "application/json",
    Authorization: `Bearer ${token}`,
  };
  const dataPost = {
    producto: { id: data.id },
    usuario: { id: localStorage.id },
  };
  const postFav = async () => {
    try {
      await axios.post(baseUrl + "favoritos/agregar", dataPost, {
        headers: headers,
      });
      getfavById();
    } catch (error) {
      console.log(error);
    }
  };
  function pushearFav(obj) {
    const initialState = [];
    obj.forEach((element) => initialState.push(element.producto.id));
    setFavoritos(initialState);
  }
  function getfavById() {
    axios
      .get(baseUrl + getFavByUser + localStorage.id)
      .then((response) => {
        const fav = response.data;
        pushearFav(fav);
      })
      .catch((error) => console.error(`Error: ${error}`));
  }

  function develteFav(id_producto) {
    axios
      .delete(
        baseUrl + "favoritos/" + id_producto + "/" + localStorage.id,
        headersDelete
      )
      .then((response) => {
        getfavById();
      })
      .catch((error) => console.error(`Error: ${error}`));
  }

  function quitFav(id_producto) {
    develteFav(id_producto);
  }
  
  function addFav() {
    postFav();
  }

  useEffect(() => {
    isLoged && getfavById();
  }, []);

  return (
    <div key={data.name} className="cardListImageContainer">
      <div className="imgContainer">
        {favoritos.includes(data.id) && localStorage.login != null ? (
          <span
            onClick={() => quitFav(data.id)}
            className={"imgContainer__imgHeart__like"}
          >
            <BsHeartFill />
          </span>
        ) : (
          <span onClick={addFav} className={"imgContainer__imgHeart"}>
            {imgHeart}
          </span>
        )}
        {data.imagen.map(
          (ele) =>
            ele.title === "principal" && (
              <img key={data.id} src={ele.url} alt="img" />
            )
        )}
      </div>
      <div className="characteristics">
        <div className="listImageContainer__top">
          <div className="listImageContainer__top_1">
            <div className="characteristics__stars">
              <h5>{data.categoria.title.toUpperCase()}</h5>
              <div className="productsHeaderdetails__secondblock__stars">
                <span>{imgStar}</span>
                <span>{imgStar}</span>
                <span>{imgStar}</span>
                <span>{imgStarHalf}</span>
                <span>{imgStarRegular}</span>
              </div>
            </div>
            <div className="listImageCardTitle">
              <h3>{data.name}</h3>
            </div>
          </div>
          <div className="listImageContainer__top_2">
            <span>8</span>
            <div>Muy bueno</div>
          </div>
        </div>
        <div className="listImageCard__characteristics">
          <span>{imgLocation}</span>
          <p>
            {data.ciudad.city}, a {data.id * 50} m del centro.
          </p>
        </div>
        <div className="listImageCard__characteristics__icons">
          {data.caracteristica.airConditioning && imgAirCond}
          {data.caracteristica.freeParking && imgParking}
          {data.caracteristica.kitchen && imgKitchen}
          {data.caracteristica.petsAllowed && imgPet}
          {data.caracteristica.pool && imgPool}
          {data.caracteristica.tv && imgTv}
          {data.caracteristica.wifi && imgWifi}
        </div>
        <p className="listImageCard__characteristics__desc">
          {data.description}
        </p>
        <Link
          onClick={searchButton}
          to={`/alojamientos/${data.id}/${data.name.replace(/[+ ]|%20/g, "-")}`}
        >
          <button>Ver más</button>
        </Link>
      </div>
    </div>
  );
};

export default ProductCard;
