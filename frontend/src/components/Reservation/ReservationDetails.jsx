import React, { useContext, useEffect, useState } from "react";
import ProductsDatePicker from "../products/ProductsDatePicker";
import "../../styles/reservation/reservationDetails.css";
import FilterContext from "../../context/FilterContext";
import ReservationSuccessful from "./ReservationSuccessful";
import OpenCarouselContext from "../../context/OpenCarouselContext";
import axios from "axios";
import { baseUrl, postReservation } from "../../constants/urls";
import ReservationForm from "./ReservationForm";
import ReservationTimeArrival from "./ReservationTimeArrival";
import ReservationImage from "./ReservationImage";
import ReservationLocation from "./ReservationLocation";
import ReservationStars from "./ReservationStars";
import ReservationCheckIn from "./ReservationCheckIn";
import ReservationCheckOut from "./ReservationCheckOut";
import ReservationConfirmButton from "./ReservationConfirmButton";

const userName = localStorage.getItem("userName");
const userLastname = localStorage.getItem("userLastname");
const userEmail = localStorage.getItem("userEmail");

const initialReservationForm = {
  name: userName,
  lastname: userLastname,
  email: userEmail,
  phone: "",
  comentaries: "",
  covid: false,
};

function ReservationDetails(props) {
  const [timeSelect, setTimeSelect] = useState("");
  const [isDisabled, setIsDisabled] = useState(true);
  const [hoursToData, setHoursToData] = useState("");
  const [reservationForm, setReservationForm] = useState(initialReservationForm);

  const product = props.productDetails;
  const option = true;
  const {
    checkInDate,
    setCheckInDate,
    checkOutDate,
    setCheckOutDate,
    animationSuccessful,
    setanimationSuccessful,
    containsDisabledDates,
  } = useContext(FilterContext);
  const { openCarousel, handleCarousel } = useContext(OpenCarouselContext);

  const date = new Date();
  let hours = date.getHours();
  let minutes = date.getMinutes();
  let seconds = date.getSeconds();
  const productId = JSON.parse(sessionStorage.getItem("productId"));
  const userId = JSON.parse(localStorage.getItem("userId"));

  if (hours < 10) {
    hours = "0" + hours;
  }
  if (minutes < 10) {
    minutes = "0" + minutes;
  }
  if (seconds < 10) {
    seconds = "0" + seconds;
  }

  let checkInYear;
  let checkInMounth;
  let checkInDay;
  let checkOutYear;
  let checkOutMounth;
  let checkOutDay;

  if (checkInDate !== "") {
    checkInYear = checkInDate.getFullYear();
    checkInMounth =
      checkInDate.getMonth() < 9 ? "0" + (checkInDate.getMonth() + 1) : checkInDate.getMonth() + 1;
    checkInDay = checkInDate.getDate() < 9 ? "0" + checkInDate.getDate() : checkInDate.getDate();
  }

  if (checkOutDate !== "" && checkOutDate !== null) {
    checkOutYear = checkOutDate.getFullYear();
    checkOutMounth =
      checkOutDate.getMonth() < 9
        ? "0" + (checkOutDate.getMonth() + 1)
        : checkOutDate.getMonth() + 1;
    checkOutDay =
      checkOutDate.getDate() < 9 ? "0" + checkOutDate.getDate() : checkOutDate.getDate();
  }

  const handleChangeSelect = (selectedOption) => {
    setTimeSelect(selectedOption.value);
    setHoursToData(selectedOption.value.slice(0, 2) + ":00:00");
  };

  const emailRegex = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
  const validationForm =
    reservationForm.name !== "" &&
    reservationForm.lastname !== "" &&
    reservationForm.email !== "" &&
    emailRegex.test(reservationForm.email)

  const validateCondition =
    timeSelect !== "" && checkInDate !== "" && checkOutDate !== null && !containsDisabledDates;

  useEffect(() => {
    validateCondition && validationForm ? setIsDisabled(false) : setIsDisabled(true);
  }, [validateCondition, validationForm]);

  const removeCalendar = () => {
    setIsDisabled(true);
    setCheckInDate("");
    setCheckOutDate("");
  };

  function loaderSuccessful(e) {
    e.preventDefault();
    if (validateCondition && validationForm) {
      postReserve();
      setanimationSuccessful(true);
      setTimeout(() => {
        handleCarousel();
      }, 4800);
      setTimeout(() => {
        setCheckInDate("");
        setCheckOutDate("");
      }, 12000);
    }
  }

  const token = JSON.parse(localStorage.getItem("userToken"));

  const headers = {
    "Content-Type": "application/json",
    Authorization: `Bearer ${token}`,
  };

  const data = {
    horaComienzo: hoursToData,
    fechaInicio: `${checkInYear}-${checkInMounth}-${checkInDay}`,
    fechaFin: `${checkOutYear}-${checkOutMounth}-${checkOutDay}`,
    usuario: { id: userId },
    producto: { id: productId },
    nombreReserva: reservationForm.name,
    apellidoReserva: reservationForm.lastname,
    emailReserva: reservationForm.email,
    telefonoReserva: reservationForm.phone,
    comentarios: reservationForm.comentaries,
    vacunacion: reservationForm.covid,
  };

  const postReserve = async () => {
    try {
      await axios.post(baseUrl + postReservation, data, { headers: headers });
    } catch (error) {
      console.log(error);
    }
  };

  return (
    <>
      <div className={openCarousel ? "successfull__on" : "successfull__none"}>
        <ReservationSuccessful productDetails={product} />
      </div>
      <div className="reservationD">
        <div className="reservationD__title">
          <h2>Completá tus datos</h2>
          <p>Ingresá los datos de la persona a quien está dirigida la reserva</p>
        </div>
        <div className="reservationD__container">
          <div className="reservationD__container__blockleft">
            <ReservationForm
              reservationForm={reservationForm}
              setReservationForm={setReservationForm}
            />

            <div className="reservationD__calendar">
              <h2>Seleccioná tu fecha de reserva</h2>
              <ProductsDatePicker productDetails={product} pickerDisabled={option} />
            </div>

            <div className="reservationD__time">
              <h2>Tu horario de llegada</h2>
              <ReservationTimeArrival handleChangeSelect={handleChangeSelect} />
            </div>
          </div>

          <div className="reservationD__container__blockright">
            <div>
              <h2>Detalle de la reserva</h2>
              <div className="reservationD__container__card">
                <ReservationImage product={product} />

                <div className="reservationD__container__blockright__dates">
                  <h3>{product.categoria.title.toUpperCase()}</h3>
                  <h2>{product.name}</h2>
                  <ReservationStars />
                  <ReservationLocation product={product} />

                  <ReservationCheckIn
                    checkInDay={checkInDay}
                    checkInMounth={checkInMounth}
                    checkInYear={checkInYear}
                  />

                  <ReservationCheckOut
                    checkOutDay={checkOutDay}
                    checkOutMounth={checkOutMounth}
                    checkOutYear={checkOutYear}
                  />

                  <div className="reservation__errors">
                    {checkInDate !== "" && checkOutDate !== "" ? (
                      <button className="reservation__button__remover" onClick={removeCalendar}>
                        Limpiar fechas
                      </button>
                    ) : (
                      ""
                    )}
                    {checkInDate === "" || checkOutDate === "" || checkOutDate === null ? (
                      <p className="reservation__errors__p">Ingresar fecha check in - check out</p>
                    ) : (
                      ""
                    )}
                    {timeSelect === "" ? (
                      <p className="reservation__errors__p">Ingresar horario de ingreso</p>
                    ) : (
                      ""
                    )}
                    {!validationForm ? (
                      <p className="reservation__errors__p">Completar tus datos requeridos</p>
                    ) : (
                      ""
                    )}
                  </div>

                  <ReservationConfirmButton
                    loaderSuccessful={loaderSuccessful}
                    animationSuccessful={animationSuccessful}
                    isDisabled={isDisabled}
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default ReservationDetails;
