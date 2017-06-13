package br.com.eits.boot.test.domain.entity;

import org.junit.Assert;
import org.junit.Test;

import br.com.eits.boot.domain.entity.Funcionario;
import br.com.eits.boot.test.domain.AbstractUnitTests;

/**
 * 
 * @author Rubens Tavares Lopes
 */
public class FuncionarioTestes extends AbstractUnitTests
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
	public void funcionarioAtivo()
	{
		final Funcionario funcionario = new Funcionario();
		funcionario.setNome("Funcionario Teste Ativo");
		funcionario.setAtivo( true );
		
		Assert.assertNotNull( funcionario.getNome() );
		Assert.assertTrue( funcionario.isAtivo() );
	}
	/**
     * 
     */
	@Test
	public void funcionarioInativo()
	{
		final Funcionario funcionario = new Funcionario();
		funcionario.setNome("Funcionario Teste Inativo");
		funcionario.setAtivo( false );
		
		Assert.assertNotNull( funcionario.getNome() );
		Assert.assertFalse( funcionario.isAtivo() );
	}
}
