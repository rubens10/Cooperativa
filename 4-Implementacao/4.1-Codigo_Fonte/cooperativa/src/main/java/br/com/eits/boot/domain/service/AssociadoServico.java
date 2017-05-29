package br.com.eits.boot.domain.service;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import br.com.eits.boot.domain.entity.Associado;
import br.com.eits.boot.domain.repository.IAssociadoRepositorio;
import br.com.eits.common.application.i18n.MessageSourceHolder;

/**
 * 
 * @author Rubens Tavares Lopes
 */
@Service
@RemoteProxy
@Transactional
public class AssociadoServico
{
	/*-------------------------------------------------------------------
	 *				 		     ATTRIBUTES
	 *-------------------------------------------------------------------*/

	//Repositories
	/**
	 * 
	 */
	@Autowired
	private IAssociadoRepositorio associadoRepositorio;

	/*-------------------------------------------------------------------
	 *				 		     SERVICES
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 * @param user
	 * @return
	 */
	public Associado inserirAssociado( Associado associado )
	{
		associado.setAtivo( false );
		
		return this.associadoRepositorio.save( associado );
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	@Transactional(readOnly=true)
	public Associado buscarAssociadooPorId( long id )
	{
		final Associado associado = this.associadoRepositorio.findOne( id );
		Assert.notNull( associado, MessageSourceHolder.getMessage("repository.notFoundById", id) );
		return associado;
	}
	
	/**
	 * 
	 * @param pageable
	 * @param filters
	 * @return
	 */
	@Transactional(readOnly=true)
	public Page<Associado> buscarUsuariosPorFiltros( String filter, PageRequest pageable )
	{
		return this.associadoRepositorio.listByFilters( filter, pageable );
	}

	/**
	 * 
	 * @param pageable
	 * @param filters
	 * @return
	 */
	public Page<Associado> listarUsuariosPorFiltros( String filter, PageRequest pageable )
	{
		return this.associadoRepositorio.listByFilters( filter, pageable );
		
	}
}