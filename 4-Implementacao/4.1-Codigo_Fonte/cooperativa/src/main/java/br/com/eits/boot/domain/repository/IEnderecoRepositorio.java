package br.com.eits.boot.domain.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.eits.boot.domain.entity.endereco.Estado;
import br.com.eits.boot.domain.entity.endereco.Cidade;

/**
 * 
 * @author Rubens Tavares Lopes 
 */
public interface IEnderecoRepositorio extends JpaRepository<Estado, Long>
{
	
	/**
	 * @param filter
	 * @param pageable
	 * @return
	 */
	@Query(value="FROM Estado estado")
	public Page<Estado> buscarEstado( Pageable pageable );
	
	@Query(value="FROM Cidade cidade WHERE id_estado = :filter ")
	public Page<Cidade> buscarCidade( @Param("filter") Integer filter, Pageable pageable );
}
