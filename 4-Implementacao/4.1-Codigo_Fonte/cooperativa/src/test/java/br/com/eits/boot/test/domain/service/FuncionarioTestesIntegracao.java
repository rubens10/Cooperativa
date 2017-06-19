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

import br.com.eits.boot.domain.entity.Funcionario;
import br.com.eits.boot.domain.service.FuncionarioServico;
import br.com.eits.boot.test.domain.AbstractIntegrationTests;

/**
 * 
 * @author Rubens Tavares Lopes
 */
public class FuncionarioTestesIntegracao extends AbstractIntegrationTests
{
	/*-------------------------------------------------------------------
	 *				 		     ATTRIBUTES
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 */
	@Autowired
	private FuncionarioServico funcionarioServico;
	
	/*-------------------------------------------------------------------
	 *				 		      TESTS
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 */
	@Test(expected=AccessDeniedException.class)
	@WithUserDetails("abc@testes.com")
	@Sql({
		"/dataset/funcionarios.sql"
	})
	public void salvarFuncionarioDeveFalhar() 
	{
		this.funcionarioServico.inserirFuncionario( new Funcionario() );
		Assert.fail("Deveria retornar erro de acesso negado");
	}
	
	/**
	 * 
	 */
	@Test
	@WithUserDetails("admin@email.com")
	@Sql({
		"/dataset/funcionarios.sql"
	})
	public void inserirFuncionarioDevePassar()
	{	
		Funcionario funcionario = new Funcionario( null, "Fulano de Tal", "5651165", "01230906797", null, "(41) 3030-2525", "(45) 9888-8889", true );
		funcionario = this.funcionarioServico.inserirFuncionario( funcionario );

		Assert.assertNotNull( funcionario );
		Assert.assertNotNull( funcionario.getId() );
		Assert.assertNotNull( funcionario.getCreated() );
	}
	
	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/funcionarios.sql"
	})
	public void buscarFuncionarioPorIdDevePassar()
	{
		final Funcionario funcionario = this.funcionarioServico.buscarFuncionarioPorId( 1002L );
	
		Assert.assertNotNull( funcionario );
		Assert.assertNotNull( funcionario.getId() );
		Assert.assertNotNull( funcionario.getCreated() );
		Assert.assertEquals( "Elias Machado Freitas", funcionario.getNome() );
	}
	
	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/funcionarios.sql"
	})
	public void listarFuncionariosPorFiltrosDeveRetornar1()
	{
		final Page<Funcionario> funcionarios = this.funcionarioServico.listarFuncionariosPorFiltros( "Gustavo", null );
		
		Assert.assertNotNull( funcionarios );
		Assert.assertEquals( 1, funcionarios.getTotalElements());
	}
	
	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/funcionarios.sql"
	})
	public void listarFuncionariosPorFiltrosDeveRetornar2()
	{
		final Page<Funcionario> funcionarios = this.funcionarioServico.listarFuncionariosPorFiltros( "Freitas", null );
		
		Assert.assertNotNull( funcionarios );
		Assert.assertEquals( 2, funcionarios.getTotalElements() );
	}
	

	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/funcionarios.sql"
	})
	public void listarFuncionariosPorFiltrosDeveRetornar3()
	{
		final Page<Funcionario> funcionarios = this.funcionarioServico.listarFuncionariosPorFiltros( "1000,1001,Gonçalves", null );
		
		Assert.assertNotNull( funcionarios );
		Assert.assertEquals( 3, funcionarios.getTotalElements());
	}
	
	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/funcionarios.sql"
	})
	public void listUsersByFiltersDeveRetornarTodos()
	{
		final Page<Funcionario> funcionarios = this.funcionarioServico.listarFuncionariosPorFiltros( null, null );
		
		Assert.assertNotNull( funcionarios );
		Assert.assertEquals( 4, funcionarios.getTotalElements() );
	}
}