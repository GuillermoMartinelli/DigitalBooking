package Digitalbooking.accommodations.service.impl;

import Digitalbooking.accommodations.dto.FavoritoDTO;
import Digitalbooking.accommodations.entities.Favorito;
import Digitalbooking.accommodations.repository.IFavoritoRepository;
import Digitalbooking.accommodations.service.IFavoritoService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class FavoritoService implements IFavoritoService {

    @Autowired
    private IFavoritoRepository favoritoRepository;

    @Autowired
    private ObjectMapper objectMapper;

    @Override
    public FavoritoDTO create(FavoritoDTO favoritoDTO) {
        Favorito favorito = favoritoRepository.save(favoritoDTO.toEntity());
        return favorito.toDTO();
    }

    @Override
    public void deleteById(Integer id) {
        favoritoRepository.deleteById(id);
    }

    @Override
    public void deleteByProductId(Integer id_producto, Integer id_usuario) {
        List<Favorito>favoritos= favoritoRepository.findAll();
        for (Favorito favorito : favoritos){
            if (favorito.getProducto().getId().equals(id_producto) && favorito.getUsuario().getId().equals(id_usuario))
                favoritoRepository.deleteById(favorito.getId());
        }
    }

    @Override
    public Set<FavoritoDTO> findAll() {
        List<Favorito>favoritos= favoritoRepository.findAll();
        Set<FavoritoDTO>favoritosDTO= new HashSet<>();
        for (Favorito favorito : favoritos){
            favoritosDTO.add(favorito.toDTO());
        }
        return  favoritosDTO;
    }

    @Override
    public FavoritoDTO update(FavoritoDTO favoritoDTO) {
        return null;
    }

    @Override
    public FavoritoDTO findById(Integer id) {
        return null;
    }

    @Override
    public Set<FavoritoDTO> findByUsuario(Integer id_usuario) {
        List<Favorito>favoritos= favoritoRepository.findAll();
        Set<FavoritoDTO>favoritosDTO= new HashSet<>();
        for (Favorito favorito : favoritos){
            if (favorito.getUsuario().getId().equals(id_usuario))
                favoritosDTO.add(favorito.toDTO());
        }
        return favoritosDTO;
    }


}
