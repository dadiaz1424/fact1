package ec.edu.espe.arquitectura.facturacion.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import ec.edu.espe.arquitectura.facturacion.model.Producto;
import ec.edu.espe.arquitectura.facturacion.repository.ProductoRepository;
import jakarta.transaction.Transactional;

@Service
public class ProductoService {

    private final ProductoRepository productoRepository;

    public ProductoService(ProductoRepository productoRepository) {
        this.productoRepository = productoRepository;
    }
    
     public Optional<Producto> obtainByCode(String code) {
        return this.productoRepository.findById(code);
    }

    public List<Producto> listByNombreAndExistencia(String nombre, BigDecimal existencia) {
         return productoRepository.findByNombreAndExistencia(nombre,existencia);
    }
    
    public List<Producto> listByNombreAndEstado(String nombre, String estado) {
        if ("ACT".equals(estado)) {
            return this.productoRepository.findByNombreLikeOrderByNombre(nombre);
        } else {
            throw new RuntimeException("No existe un producto ACTIVO con ese NOMBRE");
        }
    }

    @Transactional
    public Producto create(Producto producto) {
        Producto productoTmp = this.productoRepository.findByCodigo(producto.getCodigo());
        if (productoTmp == null) {
            return this.productoRepository.save(producto);
        } else {
            throw new RuntimeException("Producto ya existe");
        }
    }

   
    @Transactional
    public Producto update(Producto producto) {
        Optional<Producto> productoOpt = this.productoRepository.findById(producto.getCodigo());
        if (productoOpt.isPresent()) {
            Producto productoTmp = productoOpt.get();  
            productoTmp.setNombre(producto.getNombre());
            productoTmp.setDescripcion(producto.getDescripcion());
            productoTmp.setPrecio(producto.getPrecio());
            productoTmp.setEstado(producto.getEstado());
            productoTmp.setIva(producto.getIva());
            productoTmp.setIce(producto.getIce());
            this.productoRepository.save(productoTmp); //update
            return productoTmp;
        } else {
            throw new RuntimeException("Producto que desea modificar no esta registrado");
        }
    }

    @Transactional
    public void delete(String productoCode) {
        try {
            Optional<Producto> productoOpt =  this.productoRepository.findById(productoCode);
            if (productoOpt.isPresent()) {
                this.productoRepository.delete(productoOpt.get());
            } else {
                throw new RuntimeException("El prodcuto no esta registrado: "+productoCode);
            }
        } catch (RuntimeException rte) {
            throw new RuntimeException("No se puede eliminar el producto con Codigo: "+ productoCode, rte);
        }
    }

    
    }


