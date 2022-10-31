package Digitalbooking.accommodations.entities;

import Digitalbooking.accommodations.dto.PuntuacionDTO;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.Objects;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@Entity
@Table(name = "puntuaciones")
public class Puntuacion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotNull(message = "La puntuación no puede estar vacía")
    @Min(value = 1, message = "La puntuación mínima no puede ser menor a uno")
    @Max(value = 5, message = "La puntuación máxima no puede ser mayor a cinco")
    @Column(name = "puntuacion")
    private Double puntuacion;

    @NotNull(message = "El id de producto no puede ser nulo")
    @ManyToOne
    @JoinColumn(name = "producto_id")
    @JsonIgnore
    private Producto productos;

    @NotNull(message = "El id de usuario no puede ser nulo")
    @ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.MERGE)
    @JoinColumn(name = "usuario_id", nullable = false)
    @JsonIgnore
    private Usuario usuario;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Puntuacion puntuacion = (Puntuacion) o;
        return Objects.equals(id, puntuacion.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    public PuntuacionDTO toDto() {
        PuntuacionDTO puntuacionDTO = new PuntuacionDTO();
        puntuacionDTO.setId(id);
        puntuacionDTO.setPuntuacion(puntuacion);
        puntuacionDTO.setProductos(productos);
        puntuacionDTO.setUsuario(usuario);
        return puntuacionDTO;
    }
}
