import React from "react";

const ReservationConfirmButton = ({ loaderSuccessful, animationSuccessful, isDisabled }) => {
  return (
    <div className="button__successful__container">
      <div
        onClick={loaderSuccessful}
        className="buttonBar"
        id={animationSuccessful === true ? "buttonBar2" : ""}>
        <span id="progreso" className="llenandose"></span>
      </div>

      <button
        disabled={isDisabled}
        className={
          !isDisabled
            ? "reservationD__checkout_button"
            : "reservationD__checkout_button btnDisabled"
        }
        id={animationSuccessful === true ? "buttonBar3" : ""}>
        Confirmar reserva
      </button>
    </div>
  );
};

export default ReservationConfirmButton;
