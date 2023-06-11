package ec.edu.espe.arquitectura.facturacion.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import ec.edu.espe.arquitectura.facturacio.model.Producto;
import java.util.List;

import java.math.BigDecimal;



public interface ProductoRepository extends JpaRepository<Producto, String>{
    
    List<Producto> findByNombre(String nombre);

    List<Producto> findByNombreLikeOrderByNombre(String nombre);

    List<Producto> findByExistencia(BigDecimal existencia);

    List<Producto> findByCode(String codigo);

    Producto findByCodigo(String codigo);



   

}
