package Digitalbooking.accommodations.service.impl;

import Digitalbooking.accommodations.dto.ProductoDTO;
import Digitalbooking.accommodations.entities.Producto;
import Digitalbooking.accommodations.repository.IProductoRepository;
import Digitalbooking.accommodations.service.IProductoService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service
public class ProductoService implements IProductoService {

    @Autowired
    private IProductoRepository productoRepository;

    @Autowired
    private ObjectMapper mapper;

    @Override
    public ProductoDTO findById(Integer id) {
        Optional<Producto>producto=productoRepository.findById(id);
        ProductoDTO productoDTO = null;
        if(producto.isPresent())
            productoDTO=mapper.convertValue(producto,ProductoDTO.class);
        return  productoDTO;
    }

    @Override
    public ProductoDTO create(ProductoDTO productoDTO) {
        Producto producto = productoRepository.save(productoDTO.toEntity());
        if (producto.getPuntuacion() == null)
            producto.setPuntuacion(0.0);
        return producto.toDto();
    }

    @Override
    public void deleteById(Integer id) {
        productoRepository.deleteById(id);
    }

    @Override
    public ProductoDTO update(ProductoDTO productoDTO) {
        Producto producto = productoRepository.save(productoDTO.toEntity());
        if (producto.getPuntuacion() == null)
            producto.setPuntuacion(0.0);
        return producto.toDto();
    }

    public Set<ProductoDTO> findByCity(String citie) {
        productoRepository.findAllProductByScore();
        List<Producto>productos=productoRepository.findAll();
        Set<ProductoDTO>productosDTO= new HashSet<>();
        for (Producto producto : productos){
            if (producto.getCiudad().getCity().equals(citie))
                if (producto.getPuntuacion() == null)
                    producto.setPuntuacion(0.0);
                productosDTO.add(producto.toDto());
        }
        return productosDTO;
    }

    public Set<ProductoDTO> findRandomProduct() {
        productoRepository.findAllProductByScore();
        List<Producto>productos=productoRepository.findRandomProduct();
        Set<ProductoDTO>productosDTO= new HashSet<>();
        for (Producto producto : productos){
            if (producto.getPuntuacion() == null)
                producto.setPuntuacion(0.0);
            productosDTO.add(producto.toDto());
        }
        return  productosDTO;
    }

    @Override
    public ProductoDTO findOneById(Integer id) {
        productoRepository.findAllProductByScore();
        Producto producto=productoRepository.findOneById(id);
        if (producto.getPuntuacion() == null)
            producto.setPuntuacion(0.0);
        return producto.toDto();
    }

    public Set<ProductoDTO> findByCityAndBetweenDates(String ciudadName, LocalDate fechaInicio, LocalDate fechaFin) {
        productoRepository.findAllProductByScore();
        List<Producto> productos = productoRepository.findByCityAndBetweenDates(ciudadName, fechaInicio, fechaFin);
        Set<ProductoDTO>productosDTO= new HashSet<>();
        for (Producto producto : productos){
            if (producto.getPuntuacion() == null)
                producto.setPuntuacion(0.0);
            productosDTO.add(producto.toDto());
        }
        return  productosDTO;
    }

    @Override
    public Set<ProductoDTO> findAll() {
        productoRepository.findAllProductByScore();
        List<Producto>productos=productoRepository.findAll();
        Set<ProductoDTO>productosDTO= new HashSet<>();
        for (Producto producto : productos){
            if (producto.getPuntuacion() == null)
                producto.setPuntuacion(0.0);
            productosDTO.add(producto.toDto());
        }
        return  productosDTO;
    }
}


