package Digitalbooking.accommodations.service;

import Digitalbooking.accommodations.dto.ProductoDTO;

import java.time.LocalDate;
import java.util.Set;

public interface IProductoService extends ICRUDService<ProductoDTO>{

    Set<ProductoDTO> findByCity(String citie);
    Set<ProductoDTO> findRandomProduct();
    ProductoDTO findOneById(Integer id);
    Set<ProductoDTO> findByCityAndBetweenDates(String ciudadName, LocalDate fechaInicio, LocalDate fechaFin);
}
