package br.com.eits.boot.domain.service;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import br.com.eits.boot.domain.entity.Farmacia;
import br.com.eits.boot.domain.entity.conta.UsuarioPerfil;
import br.com.eits.boot.domain.entity.endereco.Cidade;
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
	private Cidade cidadeTemp;

	/*-------------------------------------------------------------------
	 *				 		     SERVICES
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 * @param user
	 * @return
	 */
	@PreAuthorize("hasAnyAuthority('"+UsuarioPerfil.ADMINISTRADOR_VALOR+"','"+UsuarioPerfil.COMERCIAL_VALOR+"')")
	public Farmacia inserirFarmacia( Farmacia farmacia, Long cidade )
	{
		farmacia.setAtivo( true );
		
		if(cidade > 0) {
			cidadeTemp = new Cidade(cidade);
			farmacia.setCidade( cidadeTemp );
		}
		
		return this.farmaciaRepositorio.save( farmacia );
	}
	/**
	 * 
	 * @param user
	 * @return
	 */
	@PreAuthorize("hasAnyAuthority('"+UsuarioPerfil.ADMINISTRADOR_VALOR+"','"+UsuarioPerfil.COMERCIAL_VALOR+"')")
	public Farmacia alterarFarmacia( Farmacia farmacia, Long cidade )
	{
		if(cidade > 0) {
			cidadeTemp = new Cidade(cidade);
			farmacia.setCidade( cidadeTemp );
		}
		
		return this.farmaciaRepositorio.save( farmacia );
	}
	/**
	 * 
	 * @param id
	 * @return
	 */
	@PreAuthorize("hasAnyAuthority('"+UsuarioPerfil.ADMINISTRADOR_VALOR+"','"+UsuarioPerfil.COMERCIAL_VALOR+"')")
	public Farmacia removerFarmacia( long id )
	{
		final Farmacia farmacia = this.farmaciaRepositorio.findOne( id );
		farmacia.setAtivo( false );
	
		return this.farmaciaRepositorio.save( farmacia );
	}
		
	/**
	 * 
	 * @param id
	 * @return
	 */
	@Transactional(readOnly=true)
	public Farmacia buscarFarmaciaPorId( long id )
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
	public Page<Farmacia> buscarFarmaciasPorFiltros( String filter, PageRequest pageable )
	{
		return this.farmaciaRepositorio.listByFilters( filter, pageable );
	}

	/**
	 * 
	 * @param pageable
	 * @param filters
	 * @return
	 */
	public Page<Farmacia> listarFarmaciasPorFiltros( String filter, PageRequest pageable )
	{
		return this.farmaciaRepositorio.listByFilters( filter, pageable );
		
	}
}