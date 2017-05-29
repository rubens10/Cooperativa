package br.com.eits.boot.test.domain.entity;

import org.junit.Assert;
import org.junit.Test;

import br.com.eits.boot.domain.entity.conta.Usuario;
import br.com.eits.boot.domain.entity.conta.UsuarioPerfil;
import br.com.eits.boot.test.domain.AbstractUnitTests;

/**
 * 
 * @author Rubens Tavares Lopes
 */
public class UsuarioTestes extends AbstractUnitTests
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
	public void autorizacaoAdministradorDevePassar()
	{
		final Usuario user = new Usuario();
		user.setPerfil( UsuarioPerfil.ADMINISTRADOR );
		
		Assert.assertNotNull( user.getAuthorities() );
		Assert.assertTrue( user.getAuthorities().contains( UsuarioPerfil.ADMINISTRADOR ) );
		Assert.assertTrue( user.getAuthorities().contains( UsuarioPerfil.COMERCIAL ) );
		Assert.assertTrue( user.getAuthorities().contains( UsuarioPerfil.FINANCEIRO ) );
		Assert.assertTrue( user.getAuthorities().contains( UsuarioPerfil.ASSOCIADO ) );
		Assert.assertTrue( user.getAuthorities().contains( UsuarioPerfil.ATENDENTE ) );
	}
	/**
     * 
     */
	@Test
	public void atendenteAcessandoFinanceiro()
	{
		final Usuario user = new Usuario();
		user.setPerfil( UsuarioPerfil.ATENDENTE );
		
		Assert.assertNotNull( user.getAuthorities() );
		Assert.assertFalse( user.getAuthorities().contains( UsuarioPerfil.FINANCEIRO ) );
	}
	/**
     * 
     */
	@Test
	public void associadoAcessandoAssociado()
	{
		final Usuario user = new Usuario();
		user.setPerfil( UsuarioPerfil.ASSOCIADO );
		
		Assert.assertNotNull( user.getAuthorities() );
		Assert.assertTrue( user.getAuthorities().contains( UsuarioPerfil.ASSOCIADO ) );
	}
}
