package Digitalbooking.accommodations.service.impl;

import Digitalbooking.accommodations.dto.UsuarioDTO;
import Digitalbooking.accommodations.entities.Usuario;
import Digitalbooking.accommodations.repository.IUsuarioRepository;
import Digitalbooking.accommodations.service.IUsuarioService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service
public class UsuarioService implements IUsuarioService {

    @Autowired
    private IUsuarioRepository usuarioRepository;

    @Autowired
    private ObjectMapper mapper;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public UsuarioDTO findById(Integer id) {
        Optional<Usuario> usuario = usuarioRepository.findById(id);
        UsuarioDTO usuarioDTO = null;
        if(usuario.isPresent())
            usuarioDTO = mapper.convertValue(usuario,UsuarioDTO.class);
        return usuarioDTO;
    }

    @Override
    public UsuarioDTO create(UsuarioDTO usuarioDTO) {
        Usuario usuario = usuarioDTO.toEntity();
        String encodedPassword = this.bCryptPasswordEncoder.encode(usuario.getContraseña());
        usuario.setContraseña(encodedPassword);
        Usuario resUsuario = usuarioRepository.save(usuario);
        UsuarioDTO resUsuarioDTO = resUsuario.toDto();
        return resUsuarioDTO;
    }

    @Override
    public void deleteById(Integer id) {
        usuarioRepository.deleteById(id);
    }

    @Override
    public UsuarioDTO update(UsuarioDTO usuarioDTO) {
        Usuario usuario = mapper.convertValue(usuarioDTO,Usuario.class);
        Usuario updateUsuario = usuarioRepository.save(usuario);
        UsuarioDTO updateUsuarioDTO = updateUsuario.toDto();
        return updateUsuarioDTO;
    }

    @Override
    public Set<UsuarioDTO> findAll() {
        List<Usuario> usuarios = usuarioRepository.findAll();
        Set<UsuarioDTO>usuarioDTOS = new HashSet<>();
        for (Usuario usuario : usuarios){
            usuarioDTOS.add(usuario.toDto());
        }
        return usuarioDTOS;
    }

    @Override
    public UsuarioDTO findByEmail(String email) {
        Optional<Usuario> usuario = usuarioRepository.findByEmail(email);
        UsuarioDTO usuarioDTO = null;
        if(usuario.isPresent())
            usuarioDTO = mapper.convertValue(usuario,UsuarioDTO.class);
        return usuarioDTO;
    }
}
