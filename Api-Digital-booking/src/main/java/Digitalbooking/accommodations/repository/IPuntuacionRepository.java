package Digitalbooking.accommodations.repository;

import Digitalbooking.accommodations.entities.Puntuacion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IPuntuacionRepository extends JpaRepository<Puntuacion, Integer> {
}
