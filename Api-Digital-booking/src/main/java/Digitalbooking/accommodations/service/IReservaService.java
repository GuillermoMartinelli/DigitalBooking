package Digitalbooking.accommodations.service;

import Digitalbooking.accommodations.dto.ReservaDTO;

import java.util.Set;

public interface IReservaService extends ICRUDService<ReservaDTO>{

    Set<ReservaDTO> findReservationByProductId(Integer id);
    Set<ReservaDTO> findReservationByUserId(Integer id);
    ReservaDTO findOneById(Integer id);
}
