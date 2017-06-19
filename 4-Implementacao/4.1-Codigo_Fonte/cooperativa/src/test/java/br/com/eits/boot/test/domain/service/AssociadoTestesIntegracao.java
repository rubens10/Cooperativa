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

import br.com.eits.boot.domain.entity.Associado;
import br.com.eits.boot.domain.service.AssociadoServico;
import br.com.eits.boot.test.domain.AbstractIntegrationTests;

/**
 * 
 * @author Rubens Tavares Lopes
 */
public class AssociadoTestesIntegracao extends AbstractIntegrationTests
{
	/*-------------------------------------------------------------------
	 *				 		     ATTRIBUTES
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 */
	@Autowired
	private AssociadoServico associadoServico;
	
	/*-------------------------------------------------------------------
	 *				 		      TESTS
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 */
	@Test(expected=AccessDeniedException.class)
	@WithUserDetails("abc@testes.com")
	@Sql({
		"/dataset/associados.sql"
	})
	public void salvarAssociadoDeveFalhar() 
	{
		this.associadoServico.inserirAssociado( new Associado(), Long.parseLong( "1" ) );
		Assert.fail("Deveria retornar erro de acesso negado");
	}
	
	/**
	 * 
	 */
	@Test
	@WithUserDetails("admin@email.com")
	@Sql({
		"/dataset/associados.sql"
	})
	public void inserirAssociadoDevePassar()
	{	
		Associado associado = new Associado( null, "Fulano de Tal", "99999", "18912881051", null, "99 3030-2020", "99 9899-9998", "85856000", "Av. Teste", "500", "Parque II", "Apt. 1A", true );
		associado = this.associadoServico.inserirAssociado( associado, Long.parseLong( "1" ) );

		Assert.assertNotNull( associado );
		Assert.assertNotNull( associado.getId() );
		Assert.assertNotNull( associado.getCreated() );
		Assert.assertFalse( associado.getAtivo().equals( false ) );
	}
	
	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/associados.sql"
	})
	public void buscarAssociadoPorIdDevePassar()
	{
		final Associado associado = this.associadoServico.buscarAssociadoPorId( 1000L );
	
		Assert.assertNotNull( associado );
		Assert.assertNotNull( associado.getId() );
		Assert.assertNotNull( associado.getCreated() );
		Assert.assertEquals( "Teste da Silva", associado.getNome() );
		Assert.assertEquals( "50864151012", associado.getCpf() );
	}
	
	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/associados.sql"
	})
	public void listarAssociadosPorFiltrosDeveRetornar1()
	{
		final Page<Associado> associados = this.associadoServico.listarAssociadosPorFiltros( "Silva", null );
		
		Assert.assertNotNull( associados );
		Assert.assertEquals( 1, associados.getTotalElements());
	}
	
	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/associados.sql"
	})
	public void listarAssociadosPorFiltrosDeveRetornar2()
	{
		final Page<Associado> associados = this.associadoServico.listarAssociadosPorFiltros( "Lima", null );
		
		Assert.assertNotNull( associados );
		Assert.assertEquals( 2, associados.getTotalElements() );
	}
	

	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/associados.sql"
	})
	public void listarAssociadosPorFiltrosDeveRetornar3()
	{
		final Page<Associado> associados = this.associadoServico.listarAssociadosPorFiltros( "1000,1002,Souza", null );
		
		Assert.assertNotNull( associados );
		Assert.assertEquals( 3, associados.getTotalElements());
	}
	
	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/associados.sql"
	})
	public void listUsersByFiltersDeveRetornarTodos()
	{
		final Page<Associado> associados = this.associadoServico.listarAssociadosPorFiltros( null, null );
		
		Assert.assertNotNull( associados );
		Assert.assertEquals( 4, associados.getTotalElements() );
	}
}