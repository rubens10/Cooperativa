package br.com.eits.boot.domain.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.eits.boot.domain.entity.Funcionario;

/**
 * 
 * @author Rubens Tavares Lopes 
 */
public interface IFuncionarioRepositorio extends JpaRepository<Funcionario, Long>
{
	
	/**
	 * @param filter
	 * @param pageable
	 * @return
	 */
	@Query(value="FROM Funcionario funcionario " +
				  "WHERE ( FILTER(funcionario.id, :filter) = TRUE "
				  	 + "OR FILTER(funcionario.nome, :filter) = TRUE )" )
	public Page<Funcionario> listByFilters( @Param("filter") String filter, Pageable pageable );
}
