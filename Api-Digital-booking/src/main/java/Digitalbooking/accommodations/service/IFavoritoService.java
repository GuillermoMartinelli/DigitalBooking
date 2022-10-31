package Digitalbooking.accommodations.service;

import Digitalbooking.accommodations.dto.FavoritoDTO;

import java.util.Set;

public interface IFavoritoService extends  ICRUDService<FavoritoDTO>{

    Set<FavoritoDTO> findByUsuario(Integer id_usuario);
    void deleteByProductId(Integer id_producto, Integer id_usuario);
}
