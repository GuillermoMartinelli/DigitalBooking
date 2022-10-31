package Digitalbooking.accommodations.controller;

import Digitalbooking.accommodations.dto.FavoritoDTO;
import Digitalbooking.accommodations.dto.ProductoDTO;
import Digitalbooking.accommodations.service.impl.FavoritoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;
import java.util.Set;

@RestController
@RequestMapping("/favoritos")
public class FavoritoController {

    @Autowired
    private FavoritoService favoritoService;

    @PostMapping("/agregar")
    public ResponseEntity<FavoritoDTO> create(@RequestBody FavoritoDTO favoritoDTO){
        FavoritoDTO newFavorito = favoritoService.create(favoritoDTO);
        return new ResponseEntity<>(newFavorito, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable Integer id){
        favoritoService.deleteById(id);
        return ResponseEntity.ok(HttpStatus.OK);
    }

    @DeleteMapping("/{id_producto}/{id_usuario}")
    public ResponseEntity<?> deleteByProductId(@PathVariable Integer id_producto, @PathVariable Integer id_usuario){
        favoritoService.deleteByProductId(id_producto, id_usuario);
        return ResponseEntity.ok(HttpStatus.OK);
    }

    @GetMapping("/usuario/{id_usuario}")
    public ResponseEntity<Set<FavoritoDTO>>findByUsuario(@PathVariable("id_usuario") Integer id_usuario){
        Set<FavoritoDTO>favoritoDTOSet=favoritoService.findByUsuario(id_usuario);
        return new ResponseEntity<>(favoritoDTOSet,HttpStatus.OK);
    }

    @GetMapping("/list")
    public ResponseEntity<Collection<FavoritoDTO>> findAll() {
        return ResponseEntity.ok(favoritoService.findAll());
    }
}
