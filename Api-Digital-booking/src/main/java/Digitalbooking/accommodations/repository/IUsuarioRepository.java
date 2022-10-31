package Digitalbooking.accommodations.repository;

import Digitalbooking.accommodations.entities.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface IUsuarioRepository extends JpaRepository<Usuario,Integer> {

    @Query("select u from Usuario u where u.email like ?1")
    Optional<Usuario> findByEmail(String email);

    Boolean existsByEmail(String email);
}
