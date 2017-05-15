package br.com.eits.boot.domain.repository.conta;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.eits.boot.domain.entity.conta.Usuario;

/**
 * 
 * @author rodrigo@eits.com.br 
 * @since 22/04/2014
 * @version 1.0
 * @category Repository
 */
public interface IUsuarioRepositorio extends JpaRepository<Usuario, Long>
{
	/**
	 * @param username
	 * @return
	 */
	public Usuario buscarPorEmail(String email);
	
	/**
	 * @param filter
	 * @param pageable
	 * @return
	 */
	@Query(value="FROM User user " +
				  "WHERE ( FILTER(user.id, :filter) = TRUE "
				  	 + "OR FILTER(user.name, :filter) = TRUE "
				  	 + "OR FILTER(user.email, :filter) = TRUE )" )
	public Page<Usuario> listByFilters( @Param("filter") String filter, Pageable pageable );
}
