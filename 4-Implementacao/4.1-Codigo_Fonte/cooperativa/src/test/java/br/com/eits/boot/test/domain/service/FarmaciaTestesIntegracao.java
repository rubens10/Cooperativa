package br.com.eits.boot.test.domain.service;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.context.jdbc.Sql;

import br.com.eits.boot.domain.entity.Farmacia;
import br.com.eits.boot.domain.service.FarmaciaServico;
import br.com.eits.boot.test.domain.AbstractIntegrationTests;

/**
 * 
 * @author Rubens Tavares Lopes
 */
public class FarmaciaTestesIntegracao extends AbstractIntegrationTests
{
	/*-------------------------------------------------------------------
	 *				 		     ATTRIBUTES
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 */
	@Autowired
	private FarmaciaServico farmaciaServico;
	
	/*-------------------------------------------------------------------
	 *				 		      TESTS
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 */
	@Test(expected=AccessDeniedException.class)
	@WithUserDetails("abc@testes.com")
	@Sql({
		"/dataset/farmacias.sql"
	})
	public void salvarFarmaciaDeveFalhar() 
	{
		this.farmaciaServico.inserirFarmacia( new Farmacia(), 1L );
		Assert.fail("Deveria retornar erro de acesso negado");
	}
	
	/**
	 * 
	 */
	@Test
	@WithUserDetails("admin@email.com")
	@Sql({
		"/dataset/farmacias.sql"
	})
	public void inserirFarmaciaDevePassar()
	{
		Farmacia farmacia = new Farmacia( null, "Farmacia Teste 2 LTDA", "Farmacia Teste 2", "29344154000182", "07805761369", "41 3526-0011", "farmacia@teste2.com", "26050010", "Rua das Casas", "123", "Vila B", "", "", true );
		farmacia = this.farmaciaServico.inserirFarmacia( farmacia, 1L );

		Assert.assertNotNull( farmacia );
		Assert.assertNotNull( farmacia.getId() );
		Assert.assertNotNull( farmacia.getCreated() );
		Assert.assertTrue( farmacia.getCnpj().equals( "29344154000182" ) );
	}
	
	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/farmacias.sql"
	})
	public void buscarFarmaciaPorIdDevePassar()
	{
		final Farmacia farmacia = this.farmaciaServico.buscarFarmaciaPorId( 1002L );
	
		Assert.assertNotNull( farmacia );
		Assert.assertNotNull( farmacia.getId() );
		Assert.assertNotNull( farmacia.getCreated() );
		Assert.assertEquals( "teste@farmaciaatacadao.com.br", farmacia.getEmail() );
	}
	
	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/farmacias.sql"
	})
	public void listarFarmaciasPorFiltrosDeveRetornar1()
	{
		final Page<Farmacia> farmacias = this.farmaciaServico.listarFarmaciasPorFiltros( "XYZ", null );
		
		Assert.assertNotNull( farmacias );
		Assert.assertEquals( 1, farmacias.getTotalElements());
	}
	
	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/farmacias.sql"
	})
	public void listarFarmaciasPorFiltrosDeveRetornar2()
	{
		final Page<Farmacia> farmacias = this.farmaciaServico.listarFarmaciasPorFiltros( "LTDA", null );
		
		Assert.assertNotNull( farmacias );
		Assert.assertEquals( 2, farmacias.getTotalElements() );
	}
	

	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/farmacias.sql"
	})
	public void listarFarmaciasPorFiltrosDeveRetornar3()
	{
		final Page<Farmacia> farmacias = this.farmaciaServico.listarFarmaciasPorFiltros( "1003,LTDA", null );
		
		Assert.assertNotNull( farmacias );
		Assert.assertEquals( 3, farmacias.getTotalElements());
	}
	
	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/farmacias.sql"
	})
	public void listUsersByFiltersDeveRetornarTodos()
	{
		final Page<Farmacia> farmacias = this.farmaciaServico.listarFarmaciasPorFiltros( null, null );
		
		Assert.assertNotNull( farmacias );
		Assert.assertEquals( 4, farmacias.getTotalElements() );
	}
}