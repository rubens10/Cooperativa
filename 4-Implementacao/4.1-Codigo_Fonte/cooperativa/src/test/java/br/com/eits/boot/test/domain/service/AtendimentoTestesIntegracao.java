package br.com.eits.boot.test.domain.service;

import java.util.Calendar;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.context.jdbc.Sql;

import br.com.eits.boot.domain.entity.atendimento.Atendimento;
import br.com.eits.boot.domain.entity.atendimento.Situacao;
import br.com.eits.boot.domain.entity.conta.UsuarioPerfil;
import br.com.eits.boot.domain.entity.Associado;
import br.com.eits.boot.domain.entity.Funcionario;
import br.com.eits.boot.domain.entity.atendimento.Assunto;
import br.com.eits.boot.domain.service.AtendimentoServico;
import br.com.eits.boot.test.domain.AbstractIntegrationTests;

/**
 * 
 * @author Rubens Tavares Lopes
 */
public class AtendimentoTestesIntegracao extends AbstractIntegrationTests
{
	/*-------------------------------------------------------------------
	 *				 		     ATTRIBUTES
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 */
	@Autowired
	private AtendimentoServico atendimentoServico;
	
	/*-------------------------------------------------------------------
	 *				 		      TESTS
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 */
	@Test(expected=AccessDeniedException.class)
	@WithUserDetails("abc@testes.com")
	@Sql({
		"/dataset/atendimentos.sql"
	})
	public void salvarAtendimentoDeveFalhar() 
	{
		this.atendimentoServico.inserirAtendimento( new Atendimento(), null, null );
		Assert.fail("Deveria retornar erro de acesso negado");
	}
	
	/**
	 * 
	 */
	@Test
	@WithUserDetails("admin@email.com")
	@Sql({
		"/dataset/atendimentos.sql"
	})
	public void inserirAtendimentoDevePassar()
	{	
		Atendimento atendimento = new Atendimento( null, "Por favor", "Associado foi atendido", null, null, Assunto.INSUMOS, Situacao.FINALIZADO, true );
		atendimento = this.atendimentoServico.inserirAtendimento( atendimento, 2000, 2000 );

		Assert.assertNotNull( atendimento );
		Assert.assertNotNull( atendimento.getId() );
		Assert.assertNotNull( atendimento.getCreated() );
		Assert.assertTrue( atendimento.getMensagem().equals( "Por favor" ) );
	}
	
	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/atendimentos.sql"
	})
	public void buscarAtendimentoPorIdDevePassar()
	{
		final Atendimento atendimento = this.atendimentoServico.buscarAtendimentoPorId( 1003L );
	
		Assert.assertNotNull( atendimento );
		Assert.assertNotNull( atendimento.getId() );
		Assert.assertNotNull( atendimento.getCreated() );
		Assert.assertEquals( "Fico no aguardo da resposta", atendimento.getMensagem() );
	}
	
	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/atendimentos.sql"
	})
	public void listarAtendimentosPorFiltrosDeveRetornar1()
	{
		final Page<Atendimento> atendimentos = this.atendimentoServico.listarAtendimentosPorFiltros( "1001", null );
		
		Assert.assertNotNull( atendimentos );
		Assert.assertEquals( 1, atendimentos.getTotalElements());
	}
	
	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/atendimentos.sql"
	})
	public void listarAtendimentosPorFiltrosDeveRetornar2()
	{
		final Page<Atendimento> atendimentos = this.atendimentoServico.listarAtendimentosPorFiltros( "1000,1002", null );
		
		Assert.assertNotNull( atendimentos );
		Assert.assertEquals( 2, atendimentos.getTotalElements() );
	}
	

	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/atendimentos.sql"
	})
	public void listarAtendimentosPorFiltrosDeveRetornar3()
	{
		final Page<Atendimento> atendimentos = this.atendimentoServico.listarAtendimentosPorFiltros( "1000,1001,1003", null );
		
		Assert.assertNotNull( atendimentos );
		Assert.assertEquals( 3, atendimentos.getTotalElements());
	}
	
	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/atendimentos.sql"
	})
	public void listUsersByFiltersDeveRetornarTodos()
	{
		final Page<Atendimento> atendimentos = this.atendimentoServico.listarAtendimentosPorFiltros( null, null );
		
		Assert.assertNotNull( atendimentos );
		Assert.assertEquals( 4, atendimentos.getTotalElements() );
	}
}