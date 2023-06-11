package ec.edu.espe.arquitectura.facturacion.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import ec.edu.espe.arquitectura.facturacio.model.ImpuestoPorcentaje;
import ec.edu.espe.arquitectura.facturacio.model.ImpuestoPorcentajePK;

public interface ImpuestPorcentajeRepository extends JpaRepository<ImpuestoPorcentaje, ImpuestoPorcentajePK>{
    
}
