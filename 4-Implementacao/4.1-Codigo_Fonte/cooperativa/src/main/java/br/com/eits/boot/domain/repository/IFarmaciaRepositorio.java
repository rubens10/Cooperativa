package br.com.eits.boot.domain.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.eits.boot.domain.entity.Farmacia;
import br.com.eits.boot.domain.entity.conta.Usuario;

/**
 * 
 * @author Rubens Tavares Lopes 
 */
public interface IFarmaciaRepositorio extends JpaRepository<Farmacia, Long>
{
	
	/**
	 * @param filter
	 * @param pageable
	 * @return
	 */
	@Query(value="FROM Farmacia farmacia " +
				  "WHERE farmacia.ativo = true AND ( FILTER(farmacia.id, :filter) = TRUE OR FILTER(farmacia.razaoSocial, :filter) = TRUE OR FILTER(farmacia.nomeFantasia, :filter) = TRUE OR FILTER(farmacia.cnpj, :filter) = TRUE OR FILTER(farmacia.email, :filter) = TRUE OR FILTER(farmacia.telefone, :filter) = TRUE OR FILTER(farmacia.cidade, :filter) = TRUE)" )
	public Page<Farmacia> listByFilters( @Param("filter") String filter, Pageable pageable );
}
