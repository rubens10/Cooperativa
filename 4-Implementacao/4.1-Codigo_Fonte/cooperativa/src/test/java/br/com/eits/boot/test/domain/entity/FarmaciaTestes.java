package br.com.eits.boot.test.domain.entity;

import org.junit.Assert;
import org.junit.Test;

import br.com.eits.boot.domain.entity.Farmacia;
import br.com.eits.boot.test.domain.AbstractUnitTests;

/**
 * 
 * @author Rubens Tavares Lopes
 */
public class FarmaciaTestes extends AbstractUnitTests
{
	/*-------------------------------------------------------------------
	 *                           ATTRIBUTES
	 *-------------------------------------------------------------------*/

	/*-------------------------------------------------------------------
	 *                           TESTS
	 *-------------------------------------------------------------------*/
	/**
     * 
     */
	@Test
	public void farmaciaAtiva()
	{
		final Farmacia farmacia = new Farmacia();
		farmacia.setRazaoSocial("Farmácia Ativa Testes LTDA");
		farmacia.setNomeFantasia("Farmácia Ativa Teste");
		farmacia.setAtivo( true );
		
		Assert.assertNotNull( farmacia.getRazaoSocial() );
		Assert.assertNotNull( farmacia.getNomeFantasia() );
		Assert.assertTrue( farmacia.getAtivo() );
	}
	/**
     * 
     */
	@Test
	public void farmaciaInativa()
	{
		final Farmacia farmacia = new Farmacia();
		farmacia.setRazaoSocial("Farmácia Inativa Testes LTDA");
		farmacia.setNomeFantasia("Farmácia Inativa Teste");
		farmacia.setAtivo( false );
		
		Assert.assertNotNull( farmacia.getRazaoSocial() );
		Assert.assertNotNull( farmacia.getNomeFantasia() );
		Assert.assertFalse( farmacia.getAtivo() );
	}
	/**
     * 
     */
	@Test
	public void farmacia2Ativa()
	{
		final Farmacia farmacia = new Farmacia();
		farmacia.setRazaoSocial("Farmácia 2 Ativa Testes LTDA");
		farmacia.setNomeFantasia("Farmácia 2 Ativa Teste");
		farmacia.setAtivo( true );
		
		Assert.assertNotNull( farmacia.getRazaoSocial() );
		Assert.assertNotNull( farmacia.getNomeFantasia() );
		Assert.assertTrue( farmacia.getAtivo() );
	}
}
