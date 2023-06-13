package ec.edu.espe.arquitectura.facturacion.service;

import java.math.BigDecimal;
import java.util.Optional;

import org.springframework.stereotype.Service;

import ec.edu.espe.arquitectura.facturacion.model.Impuesto;
import ec.edu.espe.arquitectura.facturacion.model.ImpuestoPorcentaje;
import ec.edu.espe.arquitectura.facturacion.model.ImpuestoPorcentajePK;
import ec.edu.espe.arquitectura.facturacion.repository.ImpuestPorcentajeRepository;
import ec.edu.espe.arquitectura.facturacion.repository.ImpuestoRepository;
import jakarta.transaction.Transactional;

@Service
public class ImpuestoService {

    private final ImpuestoRepository impuestoRepository;
    private final ImpuestPorcentajeRepository impuestoPorcentajeRepository;

    

    public ImpuestoService(ImpuestoRepository impuestoRepository,
            ImpuestPorcentajeRepository impuestoPorcentajeRepository) {
        this.impuestoRepository = impuestoRepository;
        this.impuestoPorcentajeRepository = impuestoPorcentajeRepository;
    }

    public Optional<Impuesto> obtainImpuestoByCode(String code) {
        return this.impuestoRepository.findById(code);
    }

    public Optional<ImpuestoPorcentaje> obtainImpuestoPorcentajeByCode(String codeImpuesto, BigDecimal porcentaje) {
        return this.impuestoPorcentajeRepository.findById(new ImpuestoPorcentajePK(codeImpuesto, porcentaje));
    }

    public void obtainAllImpuestos() {
        this.impuestoRepository.findAll();
    }

    @Transactional
    public Impuesto createImpuesto(Impuesto impuesto) {
        Optional<Impuesto> impuestoOpt = this.impuestoRepository.findById(impuesto.getCodigo());
        Impuesto impuestoTmp = impuestoOpt.get();
        if (impuestoTmp == null) {
            return this.impuestoRepository.save(impuesto);
        } else {
            throw new RuntimeException("El impuesto ya existe.");
        }
    }

    @Transactional
    public ImpuestoPorcentaje createImpuestoPorcentaje(ImpuestoPorcentaje impuestoPorcentaje) {
        if (!this.impuestoPorcentajeRepository.existsById(impuestoPorcentaje.getPk())) {
            return this.impuestoPorcentajeRepository.save(impuestoPorcentaje);
        } else {
            throw new RuntimeException("El impuesto porcentaje ya existe.");
        }
    }

    @Transactional
    public Impuesto updateImpuesto(Impuesto impuesto) {
        Optional<Impuesto> impuestoOpt = this.impuestoRepository.findById(impuesto.getCodigo());
        if (impuestoOpt.isPresent()) {
            Impuesto impuestoTmp = impuestoOpt.get(); 
            impuestoTmp.setNombre(impuesto.getNombre());
            impuestoTmp.setSiglas(impuesto.getSiglas());
            this.impuestoRepository.save(impuestoTmp); 
            return impuestoTmp;
        } else {
            throw new RuntimeException("El impuesto que desea modificar no esta registrado");
        }
    }

    @Transactional
    public void deleteImpuesto(String impuestoCode) {
        try {
            Optional<Impuesto> impuestoOpt = this.impuestoRepository.findById(impuestoCode);
            if (impuestoOpt.isPresent()) {
                this.impuestoRepository.delete(impuestoOpt.get());
            } else {
                throw new RuntimeException("El impuesto no esta registrado: " + impuestoCode);
            }
        } catch (RuntimeException rte) {
            throw new RuntimeException("No se puede eliminar el impuesto con Codigo: " + impuestoCode, rte);
        }
    }

}
