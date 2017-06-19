package br.com.eits.boot.domain.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.eits.boot.domain.entity.atendimento.Assunto;
import br.com.eits.boot.domain.entity.atendimento.Atendimento;

/**
 * 
 * @author Rubens Tavares Lopes 
 */
public interface IAtendimentoRepositorio extends JpaRepository<Atendimento, Long>
{
	
	/**
	 * @param filter
	 * @param pageable
	 * @return
	 */
	@Query(value="FROM Atendimento atendimento " +
				  "WHERE atendimento.ativo = true AND ( FILTER(atendimento.id, :filter) = TRUE OR FILTER(atendimento.situacao, :filter) = TRUE  OR FILTER(atendimento.assunto, :filter) = TRUE )" )
	public Page<Atendimento> listByFilters( @Param("filter") String filter, Pageable pageable );
}