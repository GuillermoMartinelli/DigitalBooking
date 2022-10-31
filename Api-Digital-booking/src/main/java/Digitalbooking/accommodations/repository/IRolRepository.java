package Digitalbooking.accommodations.repository;

import Digitalbooking.accommodations.entities.Rol;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface IRolRepository extends JpaRepository<Rol,Integer> {

    public Optional<Rol> findByName(String name);
}
