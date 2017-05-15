package br.com.eits.boot.test.domain.entity.conta;

import org.junit.Assert;
import org.junit.Test;

import br.com.eits.boot.domain.entity.conta.Usuario;
import br.com.eits.boot.domain.entity.conta.UsuarioPerfil;
import br.com.eits.boot.test.domain.AbstractUnitTests;

/**
 * 
 * @author rodrigo@eits.com.br
 * @since 09/05/2013
 * @version 1.0
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
	public void getAuthoritiesMustPass()
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
}