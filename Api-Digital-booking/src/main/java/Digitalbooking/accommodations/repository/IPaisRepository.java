package Digitalbooking.accommodations.repository;

import Digitalbooking.accommodations.entities.Pais;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IPaisRepository extends JpaRepository<Pais,Integer> {
}
