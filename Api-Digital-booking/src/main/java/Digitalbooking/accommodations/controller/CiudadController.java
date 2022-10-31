package Digitalbooking.accommodations.controller;

import Digitalbooking.accommodations.dto.CiudadDTO;
import Digitalbooking.accommodations.service.impl.CiudadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Set;

@RestController
@RequestMapping("/ciudades")
public class CiudadController {

    @Autowired
    private CiudadService ciudadService;

    @GetMapping("/list")
    public ResponseEntity<Set<CiudadDTO>>findAll(){
        Set<CiudadDTO>ciudadDTOSet=ciudadService.findAll();
        return new ResponseEntity<>(ciudadDTOSet,HttpStatus.OK);
    }
}
