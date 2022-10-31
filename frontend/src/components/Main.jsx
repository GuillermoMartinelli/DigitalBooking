import React from "react";
import Search from "../components/searchBar/Search";
import Categories from "./Categories";
import ListImageCard from "./ListImageCard";
import ProductsByPagination from "./productsByPagination/ProductsByPagination";
import CleanerButton from "./CleanerButton";

const Main = () => {
  return (
    <>
      <Search />
      <Categories />
      <CleanerButton/>
      <ListImageCard />
      <ProductsByPagination />
    </>
  );
};

export default Main;
