import React, { useEffect, useState } from "react";
import "../../styles/profile/movements.css";
import "./Movdetails";
import Movdetails from "./Movdetails";
import axios from "axios";
import { baseUrl } from "../../constants/urls";

function Movements() {
  const [reservasList, setReservasList] = useState([]);

  function getReservasById() {
    axios
      .get(baseUrl + "reservas/usuarios/" + localStorage.id)
      .then((response) => {
        setReservasList(response.data);
      })
      .catch((error) => console.error(`Error: ${error}`));
  }

  useEffect(() => {
    getReservasById();
  }, []);

  return (
    <div className="movements">
      <div className="movements__title">
        Reservas <span>realizadas</span>
      </div>
      <div className="movements__title2">
        A continuación podrás ver el detalle de tus reservas.
      </div>
      <div className="movements__type">
        <div className="movements__details_id">ID</div>
        <div className="movements__details_name">Alojamiento</div>
        <div className="movements__location">Ubicacion</div>
        <div className="movements__check">Check-in</div>
        <div className="movements__check">Check-out</div>
        <div className="movements__hour">Hora</div>
      </div>
      {reservasList.length === 0 ? (
        <div className="movements__null">Aún no tenes reservas realizadas.</div>
      ) : (
        reservasList.map((reserva) => (
          <Movdetails key={reserva.id}
            id={reserva.id}
            propiedad={reserva.producto.name}
            ubicacion={reserva.producto.ciudad.city}
            pais={reserva.producto.ciudad.pais.pais}
            checkIn={reserva.fechaInicio}
            checkOut={reserva.fechaFin}
            hora={reserva.horaComienzo}
          />
        ))
      )}
    </div>
  );
}

export default Movements;
