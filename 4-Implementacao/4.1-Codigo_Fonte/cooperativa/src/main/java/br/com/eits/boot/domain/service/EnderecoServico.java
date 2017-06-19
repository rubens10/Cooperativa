package br.com.eits.boot.domain.service;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import br.com.eits.boot.domain.entity.endereco.Cidade;
import br.com.eits.boot.domain.entity.endereco.Estado;
import br.com.eits.boot.domain.entity.Funcionario;
import br.com.eits.boot.domain.entity.conta.Usuario;
import br.com.eits.boot.domain.entity.conta.UsuarioPerfil;
import br.com.eits.boot.domain.repository.IEnderecoRepositorio;
import br.com.eits.common.application.i18n.MessageSourceHolder;

/**
 * 
 * @author Rubens Tavares Lopes
 */
@Service
@RemoteProxy
@Transactional
public class EnderecoServico
{
	/*-------------------------------------------------------------------
	 *				 		     ATTRIBUTES
	 *-------------------------------------------------------------------*/

	//Repositories
	/**
	 * 
	 */
	@Autowired
	private IEnderecoRepositorio enderecoRepositorio;

	/*-------------------------------------------------------------------
	 *				 		     SERVICES
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 * @param pageable
	 * @param filters
	 * @return
	 */
	public Page<?> buscarEstado( String filter, PageRequest pageable )
	{
		return this.enderecoRepositorio.buscarEstado( pageable );
		
	}
	/**
	 * 
	 * @param pageable
	 * @param filters
	 * @return
	 */
	public Page<?> buscarCidade( Integer filter, PageRequest pageable )
	{
		return this.enderecoRepositorio.buscarCidade( filter, pageable );
		
	}
}