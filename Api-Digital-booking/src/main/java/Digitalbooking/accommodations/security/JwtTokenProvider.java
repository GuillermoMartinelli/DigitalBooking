package Digitalbooking.accommodations.security;

import Digitalbooking.accommodations.dto.UserDTO;
import io.jsonwebtoken.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ResponseStatusException;

import java.util.Date;

@Component
public class JwtTokenProvider {

    @Value("${app.jwt-secret}")
    private String jwtSecret;

    @Value("${app.jwt-expiration-miliseconds}")
    private int jwtExpirationInMs;

    public String generateToken(Authentication authentication, UserDTO user) {
        String username = authentication.getName();
        Date fechaActual = new Date();
        Date fechaExpiracion = new Date(fechaActual.getTime() + jwtExpirationInMs);

        String token = Jwts.builder().setSubject(username)
                .setIssuedAt(new Date())
                .setExpiration(fechaExpiracion)
                .signWith(SignatureAlgorithm.HS512, jwtSecret)
                .claim("id", user.getId())
                .claim("nombre", user.getNombre())
                .claim("apellido",user.getApellido())
                .compact();

        return token;
    }

    public String obtenerUsernameDelJWT(String token){
        Claims claims = Jwts.parser().setSigningKey(jwtSecret).parseClaimsJws(token).getBody();
        return claims.getSubject();
    }

    public boolean validarToken(String token){
        try {
            Jwts.parser().setSigningKey(jwtSecret).parseClaimsJws(token);
            return true;
        } catch (SignatureException ex){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"Firma JWT no valida");
        } catch (MalformedJwtException ex) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"Token JWT no valido");
        } catch (ExpiredJwtException ex) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"Token JWT caducado");
        } catch (UnsupportedJwtException ex) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"Token JWT no compatible");
        } catch (IllegalArgumentException ex) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,"La cadena claims JWT está vacia");
        }
    }
}
