package br.com.eits.boot.domain.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.eits.boot.domain.entity.Associado;
import br.com.eits.boot.domain.entity.conta.Usuario;

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
	@Query(value="FROM Associado associado " +
				  "WHERE associado.ativo = true AND ( FILTER(associado.id, :filter) = TRUE "
				  	 + "OR FILTER(associado.nome, :filter) = TRUE OR FILTER(associado.cpf, :filter) = TRUE  OR FILTER(associado.telefone, :filter) = TRUE OR FILTER(associado.celular, :filter) = TRUE )" )
	public Page<Associado> listByFilters( @Param("filter") String filter, Pageable pageable );
}
