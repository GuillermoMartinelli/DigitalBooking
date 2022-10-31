import { createContext, useState } from "react";

const FilterByCityContext = createContext();

const initialFilter = [];

const FilterCityProvider = ({ children }) => {
  const [filterCity, setFilterCity] = useState(initialFilter);
  const [filterCity2, setFilterCity2] = useState(initialFilter);
  const [placeholder, setPlaceholder] = useState("¿A dónde vamos?");
  const [fav, setFav] = useState(["Piponeta Hostel"]);

  const data = {
    filterCity,
    setFilterCity,
    filterCity2,
    setFilterCity2,
    placeholder,
    setPlaceholder,
    fav,
    setFav,
  };

  return (
    <FilterByCityContext.Provider value={data}>
      {children}
    </FilterByCityContext.Provider>
  );
};

export { FilterCityProvider };

export default FilterByCityContext;
