package ec.edu.espe.arquitectura.facturacion.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import ec.edu.espe.arquitectura.facturacio.model.FacturaDetalle;

public interface FacturaDetalleRepository extends JpaRepository<FacturaDetalle, Integer>{
    
}
