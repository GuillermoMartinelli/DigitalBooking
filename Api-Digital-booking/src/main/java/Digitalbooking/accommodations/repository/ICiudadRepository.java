package Digitalbooking.accommodations.repository;

import Digitalbooking.accommodations.entities.Ciudad;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ICiudadRepository extends JpaRepository<Ciudad,Integer> {
}
