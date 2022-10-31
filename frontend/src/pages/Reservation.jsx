import Footer from "../components/Footer";
import Header from "../components/header/Header";
import ProductsPolitics from "../components/products/ProductsPolitics";
import React, { useState, useEffect } from "react";
import axios from "axios";
import { useParams } from "react-router-dom";
import { baseUrl, getProductsById } from "../constants/urls";
import Loader from "../helpers/Loader";
import ErrorMono from "../helpers/ErrorMono";
import ProductsHeaderTop from "../components/products/ProductsHeaderTop";
import ReservationDetails from "../components/Reservation/ReservationDetails";

const initialProductDetails = [];
const Reservation = () => {
const [product, setProduct] = useState([]);
  const [productDetails, setProductDetails] = useState(initialProductDetails);
  const [error, setError] = useState(false);
  let { id } = useParams();

  useEffect(() => {
    axios
      .get(baseUrl + getProductsById + id)
      .then((response) => {
        const product = response.data;
        setProductDetails(product);
        setProduct(product);
      })
      .catch((error) => {
        console.error(`Error: ${error}`);
        setError(true);
      });
  }, [id]);

  if (error) {
    return (
      <>
        <Header />
        <ErrorMono />
        <Footer />
      </>
    );
  } else if (productDetails === initialProductDetails) {
    return (
      <>
        <Header />
        <Loader />
        <Footer />
      </>
    );
  } else {
    return (
      <>
        <Header />
        <ProductsHeaderTop productDetails={product} linkProps={`/alojamientos/${product.id}/${product.name.replace(/[+ ]|%20/g, '-')}`}/>
        <ReservationDetails productDetails={product}/>
        <ProductsPolitics />
        <Footer />
      </>
    );
  }
};

export default Reservation;
