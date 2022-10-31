package Digitalbooking.accommodations.controller;

import Digitalbooking.accommodations.dto.ReservaDTO;
import Digitalbooking.accommodations.service.impl.ReservaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Set;

@RestController
@RequestMapping("/reservas")
public class ReservaController {

    @Autowired
    private ReservaService reservaService;

    @PostMapping()
    public ResponseEntity<ReservaDTO> create(@RequestBody ReservaDTO reservaDTO){
        ReservaDTO newReservaDTO=reservaService.create(reservaDTO);
        return new ResponseEntity<>(newReservaDTO, HttpStatus.OK);
    }

    @GetMapping("/list")
    public  ResponseEntity<Set<ReservaDTO>>findAll(){
        Set<ReservaDTO>reservaDTOSet=reservaService.findAll();
        return new ResponseEntity<>(reservaDTOSet,HttpStatus.OK);
    }

    @GetMapping("/productos/{id}")
    public ResponseEntity<Set<ReservaDTO>>findReservationByProductId(@PathVariable Integer id) {
        Set<ReservaDTO>reservaDTO=reservaService.findReservationByProductId(id);
        if(reservaDTO==null){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }else{
            return  new ResponseEntity<>(reservaDTO, HttpStatus.OK);
        }
    }

    @GetMapping("/usuarios/{id}")
    public ResponseEntity<Set<ReservaDTO>>findReservationByUserId(@PathVariable Integer id) {
        Set<ReservaDTO>reservaDTO=reservaService.findReservationByUserId(id);
        if(reservaDTO==null){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }else{
            return  new ResponseEntity<>(reservaDTO, HttpStatus.OK);
        }
    }
}
