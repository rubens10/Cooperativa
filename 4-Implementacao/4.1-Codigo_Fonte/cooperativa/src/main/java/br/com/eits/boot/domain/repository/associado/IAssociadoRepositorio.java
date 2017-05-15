package br.com.eits.boot.domain.repository.associado;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.eits.boot.domain.entity.associado.Associado;

/**
 * 
 * @author Rubens Tavares Lopes 
 */
public interface IAssociadoRepositorio extends JpaRepository<Associado, Long>
{
	
	/**
	 * @param filter
	 * @param pageable
	 * @return
	 */
	@Query(value="FROM User user " +
				  "WHERE ( FILTER(user.id, :filter) = TRUE "
				  	 + "OR FILTER(user.name, :filter) = TRUE "
				  	 + "OR FILTER(user.email, :filter) = TRUE )" )
	public Page<Associado> listByFilters( @Param("filter") String filter, Pageable pageable );
}
