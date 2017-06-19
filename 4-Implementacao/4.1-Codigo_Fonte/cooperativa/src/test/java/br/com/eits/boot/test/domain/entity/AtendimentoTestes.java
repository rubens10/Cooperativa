package br.com.eits.boot.test.domain.entity;

import org.junit.Assert;
import org.junit.Test;

import br.com.eits.boot.domain.entity.atendimento.Atendimento;
import br.com.eits.boot.test.domain.AbstractUnitTests;

/**
 * 
 * @author Rubens Tavares Lopes
 */
public class AtendimentoTestes extends AbstractUnitTests
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
	public void atendimentoAtiva()
	{
		final Atendimento atendimento = new Atendimento();
		atendimento.setMensagem("Mensagem teste");
		atendimento.setAtivo( true );
		
		Assert.assertNotNull( atendimento.getMensagem() );
		Assert.assertTrue( atendimento.getAtivo() );
	}
	/**
     * 
     */
	@Test
	public void atendimentoInativa()
	{
		final Atendimento atendimento = new Atendimento();
		atendimento.setMensagem("Mensagem teste");
		atendimento.setAtivo( false );
		
		Assert.assertNotNull( atendimento.getMensagem() );
		Assert.assertFalse( atendimento.getAtivo() );
	}
	/**
     * 
     */
	@Test
	public void atendimento2Ativa()
	{
		final Atendimento atendimento = new Atendimento();
		atendimento.setMensagem("Mensagem teste");
		atendimento.setAtivo( true );
		
		Assert.assertNotNull( atendimento.getMensagem() );
		Assert.assertTrue( atendimento.getAtivo() );
	}
}
