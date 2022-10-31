package Digitalbooking.accommodations.service.impl;

import Digitalbooking.accommodations.dto.ReservaDTO;
import Digitalbooking.accommodations.entities.Reserva;
import Digitalbooking.accommodations.repository.IReservaRepository;
import Digitalbooking.accommodations.service.IReservaService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service
public class ReservaService implements IReservaService {
    @Autowired
    private IReservaRepository reservaRepository;

    @Autowired
    private ObjectMapper mapper;

    @Override
    public ReservaDTO findById(Integer id) {
        Optional<Reserva> reserva = reservaRepository.findById(id);
        ReservaDTO reservaDTO=null;
        if(reserva.isPresent())
            reservaDTO=reserva.get().toDTO();
        return reservaDTO;
    }

    @Override
    public ReservaDTO create(ReservaDTO reservaDTO) {
        List<Reserva> usuario = reservaRepository.findReservationByUserId(reservaDTO.getUsuario().getId());
        Reserva reserva = new Reserva();
        if (reservaDTO.getNombreReserva() == null || reservaDTO.getApellidoReserva() == null || reservaDTO.getEmailReserva() == null || reservaDTO.getTelefonoReserva() == null) {
            for (Reserva reservaU : usuario) {
                reserva.setNombreReserva(reservaU.getUsuario().getNombre());
                reserva.setApellidoReserva(reservaU.getUsuario().getApellido());
                reserva.setEmailReserva(reservaU.getUsuario().getEmail());
                reserva.setTelefonoReserva(reservaU.getUsuario().getTelefono());
            }
            reserva.setUsuario(reservaDTO.getUsuario());
            reserva.setProducto(reservaDTO.getProducto());
            reserva.setHoraComienzo(reservaDTO.getHoraComienzo());
            reserva.setFechaInicio(reservaDTO.getFechaInicio());
            reserva.setFechaFin(reservaDTO.getFechaFin());
            reserva.setComentarios(reservaDTO.getComentarios());
            reserva.setVacunacion(reservaDTO.getVacunacion());
        } else {
            Reserva reservaCompleto = reservaRepository.save(reservaDTO.toEntity());
            return reservaCompleto.toDTO();
        }
        Reserva reservaFin = reservaRepository.save(reserva);
        return reservaFin.toDTO();
    }

    @Override
    public void deleteById(Integer id) {
        reservaRepository.deleteById(id);
    }

    @Override
    public ReservaDTO update(ReservaDTO reservaDTO) {
        List<Reserva> usuario = reservaRepository.findReservationByUserId(reservaDTO.getUsuario().getId());
        Reserva reserva = new Reserva();
        if (reservaDTO.getNombreReserva() == null || reservaDTO.getApellidoReserva() == null || reservaDTO.getEmailReserva() == null || reservaDTO.getTelefonoReserva() == null) {
            for (Reserva reservaU : usuario) {
                reserva.setNombreReserva(reservaU.getUsuario().getNombre());
                reserva.setApellidoReserva(reservaU.getUsuario().getApellido());
                reserva.setEmailReserva(reservaU.getUsuario().getEmail());
                reserva.setTelefonoReserva(reservaU.getUsuario().getTelefono());
            }
            reserva.setUsuario(reservaDTO.getUsuario());
            reserva.setProducto(reservaDTO.getProducto());
            reserva.setHoraComienzo(reservaDTO.getHoraComienzo());
            reserva.setFechaInicio(reservaDTO.getFechaInicio());
            reserva.setFechaFin(reservaDTO.getFechaFin());
            reserva.setComentarios(reservaDTO.getComentarios());
            reserva.setVacunacion(reservaDTO.getVacunacion());
        } else {
            Reserva reservaCompleto = reservaRepository.save(reservaDTO.toEntity());
            return reservaCompleto.toDTO();
        }
        Reserva reservaFin = reservaRepository.save(reserva);
        return reservaFin.toDTO();
    }

    @Override
    public Set<ReservaDTO> findAll() {
        List<Reserva> reservas = reservaRepository.findAll();
        Set<ReservaDTO>reservaDTOS=new HashSet<>();
        for (Reserva reserva : reservas){
            reservaDTOS.add(reserva.toDTO());
        }
        return reservaDTOS;
    }

    @Override
    public Set<ReservaDTO> findReservationByProductId(Integer id) {
        List<Reserva> reservas = reservaRepository.findReservationByProductId(id);
        Set<ReservaDTO>reservaDTOS=new HashSet<>();
        for (Reserva reserva : reservas){
            reservaDTOS.add(reserva.toDTO());
        }
        return reservaDTOS;
    }

    @Override
    public Set<ReservaDTO> findReservationByUserId(Integer id) {
        List<Reserva> reservas = reservaRepository.findReservationByUserId(id);
        Set<ReservaDTO>reservaDTOS=new HashSet<>();
        for (Reserva reserva : reservas){
            reservaDTOS.add(reserva.toDTO());
        }
        return reservaDTOS;
    }

    @Override
    public ReservaDTO findOneById(Integer id) {
        Reserva reserva=reservaRepository.findOneById(id);
        return reserva.toDTO();
    }
}
