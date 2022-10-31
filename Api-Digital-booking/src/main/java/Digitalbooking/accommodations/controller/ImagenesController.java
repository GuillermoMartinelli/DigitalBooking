package Digitalbooking.accommodations.controller;

import Digitalbooking.accommodations.dto.ImagenDTO;
import Digitalbooking.accommodations.service.impl.ImagenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Set;

@RestController
@RequestMapping("/imagenes")
public class ImagenesController {

    @Autowired
    private ImagenService imagenService;

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping()
    public ResponseEntity<ImagenDTO>create(@RequestBody ImagenDTO imagenDTO){
        ImagenDTO newImagenDTO=imagenService.create(imagenDTO);
        return new ResponseEntity<>(newImagenDTO, HttpStatus.OK);
    }

    @GetMapping("/list")
    public  ResponseEntity<Set<ImagenDTO>>findAll(){
        Set<ImagenDTO>imagenDTOSet=imagenService.findAll();
        return  new ResponseEntity<>(imagenDTOSet,HttpStatus.OK);
    }
}
