import { createContext, useState } from "react";

const FilterContext = createContext();

const initialFilter = "";

const FilterProvider = ({ children }) => {
  const [filter, setFilter] = useState(initialFilter);
  const [filterDate, setFilterDate] = useState([]);
  const [filterDateSearch, setFilterDateSearch] = useState([]);
  const [placeholderCalendar, setplaceholderCalendar] = useState("Check in - Check out");
  const [valueCalendar, setValueCalendar] = useState("Check In - Check Out");
  const [searchByDate, setSearchByDate] = useState([]);
  const [checkInDate, setCheckInDate] = useState("");
  const [checkOutDate, setCheckOutDate] = useState("");
  const [searchFilter, setSearchFilter] = useState(false);
  const [animationSuccessful, setanimationSuccessful] = useState(false);
  const [favoritos, setFavoritos] = useState([]);
  const [cleanerButtonClass, setCleanerButtonClass] = useState("off");
  const [containsDisabledDates, setContainsDisabledDates] = useState(false);

  const handleFilter = () => {
    setFilter((current) => !current);
  };

  const data = {
    filter,
    handleFilter,
    setFilter,
    filterDate,
    setFilterDate,
    filterDateSearch,
    setFilterDateSearch,
    placeholderCalendar,
    setplaceholderCalendar,
    valueCalendar,
    setValueCalendar,
    searchByDate,
    setSearchByDate,
    checkInDate,
    setCheckInDate,
    checkOutDate,
    setCheckOutDate,
    searchFilter,
    setSearchFilter,
    animationSuccessful,
    setanimationSuccessful,
    favoritos,
    setFavoritos,
    containsDisabledDates,
    setContainsDisabledDates,
    cleanerButtonClass,
     setCleanerButtonClass
  };

  return (
    <FilterContext.Provider value={data}>{children}</FilterContext.Provider>
  );
};

export { FilterProvider };

export default FilterContext;
