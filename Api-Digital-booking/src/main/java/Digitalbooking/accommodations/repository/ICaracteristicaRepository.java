package Digitalbooking.accommodations.repository;

import Digitalbooking.accommodations.entities.Caracteristica;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ICaracteristicaRepository extends JpaRepository<Caracteristica,Integer> {
}
