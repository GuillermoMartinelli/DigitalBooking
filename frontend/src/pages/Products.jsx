import Footer from "../components/Footer";
import Header from "../components/header/Header";
import ProductsCalendar from "../components/products/ProductsCalendar";
import ProductsDescription from "../components/products/ProductsDescription";
import ProductsFeatures from "../components/products/ProductsFeatures";
import ProductsHeader from "../components/products/ProductsHeader";
import ProductsImg from "../components/products/ProductsImg";
import ProductsLocation from "../components/products/ProductsLocation";
import ProductsPolitics from "../components/products/ProductsPolitics";
import React, { useState, useEffect } from "react";
import axios from "axios";

import { useParams } from "react-router-dom";
import { baseUrl, getProductsById } from "../constants/urls";
import Loader from "../helpers/Loader";
import ErrorMono from "../helpers/ErrorMono";

const initialProductDetails = {
  id: "",
  name: "",
  description: "",
  categoria: {
    id: "",
    title: "",
    description: "",
    imgUrl: "",
  },
  ciudad: {
    id: "",
    city: "",
    pais: {
      id: "",
      pais: "",
    },
  },
  imagen: [
    {
      id: "",
      title: "",
      url: "",
    },
    {
      id: "",
      title: "",
      url: "",
    },
    {
      id: "",
      title: "",
      url: "",
    },
    {
      id: "",
      title: "",
      url: "",
    },
    {
      id: "",
      title: "",
      url: "",
    },
  ],
};

const Products = () => {
  const [prueba, setprueba] = useState([]);
  const [productDetails, setProductDetails] = useState(initialProductDetails);
  const [error, setError] = useState(false);
  let { id, location } = useParams();

  sessionStorage.setItem("productId", id);
  sessionStorage.setItem("productLocation", location);

  useEffect(() => {
    axios
      .get(baseUrl + getProductsById + id)
      .then((response) => {
        const product = response.data;
        setProductDetails(product);
        setprueba(product);
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
        <ProductsHeader productDetails={prueba} />
        <ProductsImg productDetails={productDetails} />
        <ProductsDescription productDetails={productDetails} />
        <ProductsFeatures productDetails={productDetails} />
        <ProductsCalendar productDetails={prueba} />
        <ProductsLocation productDetails={productDetails} />
        <ProductsPolitics />
        <Footer />
      </>
    );
  }
};

export default Products;
