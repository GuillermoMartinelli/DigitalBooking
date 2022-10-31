package Digitalbooking.accommodations.controller;

import Digitalbooking.accommodations.dto.ProductoDTO;
import Digitalbooking.accommodations.service.impl.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.time.LocalDate;
import java.util.Set;

@RestController
@Transactional
@RequestMapping("/productos")
public class ProductoController {

    @Autowired
    private ProductoService productoService;

     @GetMapping("/{id}")
     public ResponseEntity<ProductoDTO>findOneById(@PathVariable("id") Integer id){
        ProductoDTO productoDTO=productoService.findOneById(id);
        if(productoDTO==null){
            return new ResponseEntity<>(productoDTO,HttpStatus.NOT_FOUND);
        }else{
            return  new ResponseEntity<>(productoDTO, HttpStatus.OK);
        }
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping()
    public ResponseEntity<ProductoDTO>create(@RequestBody ProductoDTO productoDTO){
         ProductoDTO newProductoDTO = productoService.create(productoDTO);
         return  new ResponseEntity<>(newProductoDTO, HttpStatus.OK);
    }

    @GetMapping("/list")
    public ResponseEntity<Set<ProductoDTO>>findAll(){
         Set<ProductoDTO>productoDTOSet=productoService.findAll();
         return  new ResponseEntity<>(productoDTOSet,HttpStatus.OK);
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PutMapping("/update/{id}")
    public ResponseEntity<ProductoDTO>update(@RequestBody ProductoDTO productoDTO){
        ProductoDTO updateProductoDTO = productoService.update(productoDTO);
        return  new ResponseEntity<>(updateProductoDTO, HttpStatus.OK);
    }

    @GetMapping("/page")
    public ResponseEntity<Set<ProductoDTO>>findRandomProduct(){
        Set<ProductoDTO>productoDTOSet=productoService.findRandomProduct();
        return  new ResponseEntity<>(productoDTOSet,HttpStatus.OK);
    }

    @GetMapping("/ciudades/{ciudad}")
    public ResponseEntity<Set<ProductoDTO>>findByCity(@PathVariable("ciudad") String ciudad){
        Set<ProductoDTO>productoDTOSet=productoService.findByCity(ciudad);
        return  new ResponseEntity<>(productoDTOSet,HttpStatus.OK);
    }

    @GetMapping("/{ciudadName}/{fechaInicio}/{fechaFin}")
    public ResponseEntity<Set<ProductoDTO>>findByCityAndBetweenDates(@PathVariable("fechaInicio") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate fechaInicio,
                                                                     @PathVariable("fechaFin") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate fechaFin,
                                                                     @PathVariable("ciudadName") String ciudadName) {
         Set<ProductoDTO>productoDTOSet = productoService.findByCityAndBetweenDates(ciudadName, fechaInicio, fechaFin);
         if (productoDTOSet.isEmpty()){
             throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No se encontraron alojamientos disponibles en la ciudad " + ciudadName + " para la fecha de inicio " + fechaInicio + " y fecha fin " + fechaFin + ".");
         }
         return new ResponseEntity<>(productoDTOSet, HttpStatus.OK);
    }
}
