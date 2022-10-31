import React from "react";
import { Routes, Route } from "react-router-dom";
import { FilterCityProvider } from "../context/FilterByCityContext";
import { FilterProvider } from "../context/FilterContext";
import { IsLoggedProvider } from "../context/isLogedContext";
import { OpenCarouselProvider } from "../context/OpenCarouselContext";
import { OpenToggleProvider } from "../context/OpenToggleContext";
import Home from "../pages/Home";
import Login from "../pages/Login";
import Products from "../pages/Products";
import Reservation from "../pages/Reservation";
import SignUp from "../pages/SignUp";
import Error404 from "../helpers/Error404";
import ScrollToTop from "./ScrollToTop";
import PrivateRoute from "./PrivateRoute";
import Profile from "../pages/Profile";

const ProjectRoutes = () => {
  return (
    <OpenToggleProvider>
      <IsLoggedProvider>
        <FilterCityProvider>
          <FilterProvider>
            <OpenCarouselProvider>
              <ScrollToTop>
                <Routes>
                  <Route path="/" element={<Home />} />
                  <Route path="/login" element={<Login />} />
                  <Route path="/signup" element={<SignUp />} />
                  <Route path="/perfil" element={<Profile />} />
                  <Route path="/alojamientos/:id/:location" element={<Products />} />
                  <Route path="/alojamientos/:id/:location/reservar" element={<PrivateRoute />}>
                    <Route path="/alojamientos/:id/:location/reservar" element={<Reservation />} />
                  </Route>
                  <Route path="/alojamientos/:id/:location/reservar" element={<Reservation />} />
                  <Route path="*" element={<Error404 />} />
                </Routes>
              </ScrollToTop>
            </OpenCarouselProvider>
          </FilterProvider>
        </FilterCityProvider>
      </IsLoggedProvider>
    </OpenToggleProvider>
  );
};

export default ProjectRoutes;
