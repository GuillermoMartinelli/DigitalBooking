package Digitalbooking.accommodations.service;

import Digitalbooking.accommodations.dto.UsuarioDTO;

public interface IUsuarioService extends ICRUDService<UsuarioDTO>{

    UsuarioDTO findByEmail(String email);
}
