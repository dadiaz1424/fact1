package ec.edu.espe.arquitectura.facturacion.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import ec.edu.espe.arquitectura.facturacio.model.Cliente;
import java.util.List;


public interface ClienteRepository extends JpaRepository<Cliente, Integer> {

    List<Cliente> findByApellidoLikeOrderByApellido(String apellidoPattern);

    List<Cliente> findByRazonSocialLikeOrderByRazonSocial(String razonSocialPattern);

    Cliente findByTipoIdentificacionAndIdentificacion(String tipoIdentificacion, String identificacion);
    
}
