package Digitalbooking.accommodations.repository;

import Digitalbooking.accommodations.entities.Favorito;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IFavoritoRepository extends JpaRepository<Favorito, Integer> {
}
