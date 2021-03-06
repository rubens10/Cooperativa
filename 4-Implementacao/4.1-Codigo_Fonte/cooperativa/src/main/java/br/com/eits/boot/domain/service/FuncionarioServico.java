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
import br.com.eits.boot.domain.entity.Funcionario;
import br.com.eits.boot.domain.entity.conta.Usuario;
import br.com.eits.boot.domain.entity.conta.UsuarioPerfil;
import br.com.eits.boot.domain.repository.IFuncionarioRepositorio;
import br.com.eits.common.application.i18n.MessageSourceHolder;

/**
 * 
 * @author Rubens Tavares Lopes
 */
@Service
@RemoteProxy
@Transactional
public class FuncionarioServico
{
	/*-------------------------------------------------------------------
	 *				 		     ATTRIBUTES
	 *-------------------------------------------------------------------*/

	//Repositories
	/**
	 * 
	 */
	@Autowired
	private IFuncionarioRepositorio funcionarioRepositorio;

	/*-------------------------------------------------------------------
	 *				 		     SERVICES
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 * @param user
	 * @return
	 */
	@PreAuthorize("hasAnyAuthority('"+UsuarioPerfil.ADMINISTRADOR_VALOR+"','"+UsuarioPerfil.COMERCIAL_VALOR+"')")
	public Funcionario inserirFuncionario( Funcionario funcionario )
	{
		funcionario.setAtivo( true );
		return this.funcionarioRepositorio.save( funcionario );
	}
	/**
	 * 
	 * @param user
	 * @return
	 */
	@PreAuthorize("hasAnyAuthority('"+UsuarioPerfil.ADMINISTRADOR_VALOR+"','"+UsuarioPerfil.COMERCIAL_VALOR+"')")
	public Funcionario alterarFuncionario( Funcionario funcionario )
	{
		return this.funcionarioRepositorio.save( funcionario );
	}
	/**
	 * 
	 * @param id
	 * @return
	 */
	@PreAuthorize("hasAnyAuthority('"+UsuarioPerfil.ADMINISTRADOR_VALOR+"','"+UsuarioPerfil.COMERCIAL_VALOR+"')")
	public Funcionario removerFuncionario( long id )
	{
		final Funcionario funcionario = this.funcionarioRepositorio.findOne( id );
		funcionario.setAtivo( false );
	
		return this.funcionarioRepositorio.save( funcionario );
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	@Transactional(readOnly=true)
	public Funcionario buscarFuncionarioPorId( long id )
	{
		final Funcionario funcionario = this.funcionarioRepositorio.findOne( id );
		Assert.notNull( funcionario, MessageSourceHolder.getMessage("repository.notFoundById", id) );
		return funcionario;
	}
	
	/**
	 * 
	 * @param pageable
	 * @param filters
	 * @return
	 */
	@Transactional(readOnly=true)
	public Page<Funcionario> buscarFuncionariosPorFiltros( String filter, PageRequest pageable )
	{
		return this.funcionarioRepositorio.listByFilters( filter, pageable );
	}

	/**
	 * 
	 * @param pageable
	 * @param filters
	 * @return
	 */
	public Page<Funcionario> listarFuncionariosPorFiltros( String filter, PageRequest pageable )
	{
		return this.funcionarioRepositorio.listByFilters( filter, pageable );
		
	}
}