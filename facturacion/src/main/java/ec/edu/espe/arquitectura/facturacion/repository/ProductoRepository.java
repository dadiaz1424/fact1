package ec.edu.espe.arquitectura.facturacion.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import ec.edu.espe.arquitectura.facturacion.model.Producto;
import java.util.List;

import java.math.BigDecimal;



public interface ProductoRepository extends JpaRepository<Producto, String>{
    
    List<Producto> findByNombre(String nombre);

    List<Producto> findByNombreLikeOrderByNombre(String nombre);
    
    List<Producto> findByNombreAndExistencia(String nombre, BigDecimal existencia);
    
    List<Producto> findByNombreAndEstado(String nombre , String estado);

    Producto findByCodigo(String codigo);



   

}
