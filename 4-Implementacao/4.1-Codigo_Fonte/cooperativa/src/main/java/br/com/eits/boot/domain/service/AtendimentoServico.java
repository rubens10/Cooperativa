package br.com.eits.boot.domain.service;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import br.com.eits.boot.domain.entity.atendimento.Assunto;
import br.com.eits.boot.domain.entity.atendimento.Atendimento;
import br.com.eits.boot.domain.entity.Associado;
import br.com.eits.boot.domain.entity.Funcionario;
import br.com.eits.boot.domain.entity.conta.Usuario;
import br.com.eits.boot.domain.entity.conta.UsuarioPerfil;
import br.com.eits.boot.domain.entity.endereco.Cidade;
import br.com.eits.boot.domain.repository.IAtendimentoRepositorio;
import br.com.eits.common.application.i18n.MessageSourceHolder;

/**
 * 
 * @author Rubens Tavares Lopes
 */
@Service
@RemoteProxy
@Transactional
public class AtendimentoServico
{
	/*-------------------------------------------------------------------
	 *				 		     ATTRIBUTES
	 *-------------------------------------------------------------------*/

	//Repositories
	/**
	 * 
	 */
	@Autowired
	private IAtendimentoRepositorio atendimentoRepositorio;

	/*-------------------------------------------------------------------
	 *				 		     SERVICES
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 * @param user
	 * @return
	 */
	@PreAuthorize("hasAnyAuthority('"+UsuarioPerfil.ADMINISTRADOR_VALOR+"','"+UsuarioPerfil.COMERCIAL_VALOR+"')")
	public Atendimento inserirAtendimento( Atendimento atendimento, Integer idFuncionario, Integer idAssociado )
	{

		if(idFuncionario > 0) {
			Funcionario funcionarioTemp = new Funcionario( Long.parseLong(String.valueOf(idFuncionario)) );
			atendimento.setFuncionario( funcionarioTemp );
		}
		if(idAssociado > 0) {
			Associado associadoTemp = new Associado( Long.parseLong(String.valueOf(idAssociado)) );
			atendimento.setAssociado( associadoTemp );
		}
		
		atendimento.setAtivo( true );
		
		return this.atendimentoRepositorio.save( atendimento );
	}
	/**
	 * 
	 * @param user
	 * @return
	 */
	@PreAuthorize("hasAnyAuthority('"+UsuarioPerfil.ADMINISTRADOR_VALOR+"','"+UsuarioPerfil.COMERCIAL_VALOR+"')")
	public Atendimento alterarAtendimento( Atendimento atendimento, Long idFuncionario, Long idAssociado )
	{
		if(idFuncionario > 0) {
			Funcionario funcionarioTemp = new Funcionario(idFuncionario);
			atendimento.setFuncionario( funcionarioTemp );
		}
		if(idAssociado > 0) {
			Associado associadoTemp = new Associado(idAssociado);
			atendimento.setAssociado( associadoTemp );
		}
		
		return this.atendimentoRepositorio.save( atendimento );
	}
	/**
	 * 
	 * @param id
	 * @return
	 */
	@PreAuthorize("hasAnyAuthority('"+UsuarioPerfil.ADMINISTRADOR_VALOR+"','"+UsuarioPerfil.COMERCIAL_VALOR+"')")
	public Atendimento removerAtendimento( long id )
	{
		final Atendimento atendimento = this.atendimentoRepositorio.findOne( id );
		atendimento.setAtivo( false );
	
		return this.atendimentoRepositorio.save( atendimento );
	}
		
	/**
	 * 
	 * @param id
	 * @return
	 */
	@Transactional(readOnly=true)
	public Atendimento buscarAtendimentoPorId( long id )
	{
		final Atendimento atendimento = this.atendimentoRepositorio.findOne( id );
		Assert.notNull( atendimento, MessageSourceHolder.getMessage("repository.notFoundById", id) );
		return atendimento;
	}
	
	/**
	 * 
	 * @param pageable
	 * @param filters
	 * @return
	 */
	@Transactional(readOnly=true)
	public Page<Atendimento> buscarAtendimentosPorFiltros( String filter, PageRequest pageable )
	{
		return this.atendimentoRepositorio.listByFilters( filter, pageable );
	}

	/**
	 * 
	 * @param pageable
	 * @param filters
	 * @return
	 */
	public Page<Atendimento> listarAtendimentosPorFiltros( String filter, PageRequest pageable )
	{
		return this.atendimentoRepositorio.listByFilters( filter, pageable );
		
	}
}