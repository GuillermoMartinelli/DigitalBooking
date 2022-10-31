package Digitalbooking.accommodations.service.impl;

import Digitalbooking.accommodations.dto.PuntuacionDTO;
import Digitalbooking.accommodations.entities.Puntuacion;
import Digitalbooking.accommodations.entities.Reserva;
import Digitalbooking.accommodations.repository.IPuntuacionRepository;
import Digitalbooking.accommodations.repository.IReservaRepository;
import Digitalbooking.accommodations.service.IPuntuacionService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class PuntuacionService implements IPuntuacionService {

    @Autowired
    private IPuntuacionRepository puntuacionRepository;

    @Autowired
    private IReservaRepository reservaRepository;

    @Autowired
    private ObjectMapper mapper;

    @Override
    public PuntuacionDTO findById(Integer id) {
        return null;
    }

    @Override
    public PuntuacionDTO create(PuntuacionDTO puntuacionDTO) {
        List<Reserva> reservaU = reservaRepository.findReservationByUserId(puntuacionDTO.getUsuario().getId());
        for (Reserva reservaUsuario : reservaU) {
            if (reservaUsuario.getProducto().getId().equals(puntuacionDTO.getProductos().getId()) && reservaUsuario.getUsuario().getId().equals(puntuacionDTO.getUsuario().getId())) {
                Puntuacion puntuacion = puntuacionRepository.save(puntuacionDTO.toEntity());
                return puntuacion.toDto();
            }
        }
        throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No se puede realizar una puntuación sin tener una reserva en el alojamiento seleccionado");
    }

    @Override
    public void deleteById(Integer id) {
        puntuacionRepository.deleteById(id);
    }

    @Override
    public PuntuacionDTO update(PuntuacionDTO puntuacionDTO) {
        List<Reserva> reservaU = reservaRepository.findReservationByUserId(puntuacionDTO.getUsuario().getId());
        for (Reserva reservaUsuario : reservaU) {
            if (reservaUsuario.getProducto().getId().equals(puntuacionDTO.getProductos().getId()) && reservaUsuario.getUsuario().getId().equals(puntuacionDTO.getUsuario().getId())) {
                Puntuacion puntuacion = puntuacionRepository.save(puntuacionDTO.toEntity());
                return puntuacion.toDto();
            }
        }
        throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No se puede realizar una puntuación sin tener una reserva en el alojamiento seleccionado");
    }

    @Override
    public Set<PuntuacionDTO> findAll() {
        List<Puntuacion>puntuaciones=puntuacionRepository.findAll();
        Set<PuntuacionDTO>puntuacionesDTO= new HashSet<>();
        for (Puntuacion puntuacion : puntuaciones){
            if (puntuacion.getPuntuacion() == null)
                puntuacion.setPuntuacion(0.0);
            puntuacionesDTO.add(puntuacion.toDto());
        }
        return  puntuacionesDTO;
    }
}
