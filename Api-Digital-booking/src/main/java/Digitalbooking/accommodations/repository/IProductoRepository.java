package Digitalbooking.accommodations.repository;

import Digitalbooking.accommodations.entities.Producto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface IProductoRepository extends JpaRepository<Producto,Integer> {

    @Query(value = "SELECT u FROM Producto u ORDER BY RAND()")
    List<Producto> findRandomProduct();

    @Query(value = "SELECT u FROM Producto u WHERE u.id = ?1")
    Producto findOneById(Integer id);

    @Query(value = "{call findByCityAndBetweenDates_procedure(?1, ?2, ?3)}", nativeQuery = true)
    List<Producto> findByCityAndBetweenDates(String ciudadName, LocalDate fechaInicio, LocalDate fechaFin);

    @Procedure(procedureName = "findAllProductByScore")
    List<Producto> findAllProductByScore();
}
