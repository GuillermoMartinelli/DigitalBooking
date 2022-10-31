package Digitalbooking.accommodations.controller;

import Digitalbooking.accommodations.dto.LoginDTO;
import Digitalbooking.accommodations.dto.UserDTO;
import Digitalbooking.accommodations.dto.UsuarioDTO;
import Digitalbooking.accommodations.repository.IUsuarioRepository;
import Digitalbooking.accommodations.security.JWTAuthResponseDTO;
import Digitalbooking.accommodations.security.JwtTokenProvider;
import Digitalbooking.accommodations.service.impl.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.Set;

@RestController
@RequestMapping("/usuarios")
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    @Autowired
    private IUsuarioRepository usuarioRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtTokenProvider jwtTokenProvider;

    @PostMapping("/registrar")
    public ResponseEntity<UsuarioDTO> create(@RequestBody UsuarioDTO usuarioDTO){
        if(usuarioRepository.existsByEmail(usuarioDTO.getEmail())) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        UsuarioDTO newUsuarioDTO = usuarioService.create(usuarioDTO);
        newUsuarioDTO.setContraseña(passwordEncoder.encode(usuarioDTO.getContraseña()));
        return new ResponseEntity<>(newUsuarioDTO, HttpStatus.CREATED);
    }

    @GetMapping("/list")
    public  ResponseEntity<Set<UsuarioDTO>>findAll(){
        Set<UsuarioDTO>usuarioDTOSet = usuarioService.findAll();
        return new ResponseEntity<>(usuarioDTOSet,HttpStatus.OK);
    }

    @PostMapping("/login")
    public ResponseEntity<JWTAuthResponseDTO> authenticateUser(@RequestBody LoginDTO loginDTO) {
        Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(loginDTO.getEmail(), loginDTO.getContraseña()));
        SecurityContextHolder.getContext().setAuthentication(authentication);
        UsuarioDTO usuario = usuarioService.findByEmail(loginDTO.getEmail());
        UserDTO user = new UserDTO(usuario.getId(), usuario.getNombre(), usuario.getApellido());
        String token = jwtTokenProvider.generateToken(authentication, user);
        return new ResponseEntity<>(new JWTAuthResponseDTO(token), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteById(@PathVariable("id") Integer id) {
        usuarioService.deleteById(id);
        return new ResponseEntity<>("Cuenta eliminada", HttpStatus.OK);
    }
}
