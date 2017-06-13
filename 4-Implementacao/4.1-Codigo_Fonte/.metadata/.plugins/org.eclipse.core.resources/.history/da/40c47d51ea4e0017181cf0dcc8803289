package br.com.eits.boot.domain.service;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import br.com.eits.boot.domain.entity.Funcionario;
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
	public Funcionario inserirFuncionario( Funcionario funcionario )
	{
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
	public Page<Funcionario> buscarUsuariosPorFiltros( String filter, PageRequest pageable )
	{
		return this.funcionarioRepositorio.listByFilters( filter, pageable );
	}

	/**
	 * 
	 * @param pageable
	 * @param filters
	 * @return
	 */
	public Page<Funcionario> listarUsuariosPorFiltros( String filter, PageRequest pageable )
	{
		return this.funcionarioRepositorio.listByFilters( filter, pageable );
		
	}
}