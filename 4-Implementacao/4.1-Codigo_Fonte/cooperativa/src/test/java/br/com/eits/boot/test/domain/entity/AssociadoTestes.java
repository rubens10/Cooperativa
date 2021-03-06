package br.com.eits.boot.test.domain.entity;

import org.junit.Assert;
import org.junit.Test;

import br.com.eits.boot.domain.entity.Associado;
import br.com.eits.boot.test.domain.AbstractUnitTests;

/**
 * 
 * @author Rubens Tavares Lopes
 */
public class AssociadoTestes extends AbstractUnitTests
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
	public void associadoAtivo()
	{
		final Associado associado = new Associado();
		associado.setNome("Teste Ativo");
		associado.setAtivo(true);
		
		Assert.assertNotNull( associado.getNome() );
		Assert.assertTrue( associado.getAtivo() );
	}
	/**
     * 
     */
	@Test
	public void associadoInativo()
	{
		final Associado associado = new Associado();
		associado.setNome("Teste Inativo");
		associado.setAtivo(false);
		
		Assert.assertNotNull( associado.getNome() );
		Assert.assertFalse( associado.getAtivo() );
	}
	/**
     * 
     */
	@Test
	public void associado2Ativo()
	{
		final Associado associado = new Associado();
		associado.setNome("Teste Ativo");
		associado.setAtivo(true);
		
		Assert.assertNotNull( associado.getNome() );
		Assert.assertTrue( associado.getAtivo() );
	}
}
