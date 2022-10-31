package Digitalbooking.accommodations.controller;

import Digitalbooking.accommodations.dto.PuntuacionDTO;
import Digitalbooking.accommodations.service.impl.PuntuacionService;
import Digitalbooking.accommodations.service.impl.ReservaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Set;

@RestController
@RequestMapping("/puntuaciones")
public class PuntuacionController {

    @Autowired
    private PuntuacionService puntuacionService;

    @Autowired
    private ReservaService reservaService;

    @PostMapping()
    public ResponseEntity<PuntuacionDTO> create(@RequestBody PuntuacionDTO puntuacionDTO){
        PuntuacionDTO newPuntuacionDTO = puntuacionService.create(puntuacionDTO);
        return new ResponseEntity<>(newPuntuacionDTO, HttpStatus.OK);
    }

    @GetMapping("/list")
    public  ResponseEntity<Set<PuntuacionDTO>>findAll() {
        Set<PuntuacionDTO> puntuacionDTOSet = puntuacionService.findAll();
        return new ResponseEntity<>(puntuacionDTOSet, HttpStatus.OK);
    }
}
