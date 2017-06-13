package br.com.eits.boot.domain.service;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import br.com.eits.boot.domain.entity.Farmacia;
import br.com.eits.boot.domain.repository.IFarmaciaRepositorio;
import br.com.eits.common.application.i18n.MessageSourceHolder;

/**
 * 
 * @author Rubens Tavares Lopes
 */
@Service
@RemoteProxy
@Transactional
public class FarmaciaServico
{
	/*-------------------------------------------------------------------
	 *				 		     ATTRIBUTES
	 *-------------------------------------------------------------------*/

	//Repositories
	/**
	 * 
	 */
	@Autowired
	private IFarmaciaRepositorio farmaciaRepositorio;

	/*-------------------------------------------------------------------
	 *				 		     SERVICES
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 * @param user
	 * @return
	 */
	public Farmacia inserirFarmacia( Farmacia farmacia )
	{
		farmacia.setAtivo( false );
		
		return this.farmaciaRepositorio.save( farmacia );
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	@Transactional(readOnly=true)
	public Farmacia buscarFarmaciaoPorId( long id )
	{
		final Farmacia farmacia = this.farmaciaRepositorio.findOne( id );
		Assert.notNull( farmacia, MessageSourceHolder.getMessage("repository.notFoundById", id) );
		return farmacia;
	}
	
	/**
	 * 
	 * @param pageable
	 * @param filters
	 * @return
	 */
	@Transactional(readOnly=true)
	public Page<Farmacia> buscarUsuariosPorFiltros( String filter, PageRequest pageable )
	{
		return this.farmaciaRepositorio.listByFilters( filter, pageable );
	}

	/**
	 * 
	 * @param pageable
	 * @param filters
	 * @return
	 */
	public Page<Farmacia> listarUsuariosPorFiltros( String filter, PageRequest pageable )
	{
		return this.farmaciaRepositorio.listByFilters( filter, pageable );
		
	}
}