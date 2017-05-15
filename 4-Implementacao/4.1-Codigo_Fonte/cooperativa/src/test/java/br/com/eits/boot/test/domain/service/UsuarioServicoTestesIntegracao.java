package br.com.eits.boot.test.domain.service;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.context.jdbc.Sql;

import br.com.eits.boot.domain.entity.conta.Usuario;
import br.com.eits.boot.domain.entity.conta.UsuarioPerfil;
import br.com.eits.boot.domain.service.UsuarioServico;
import br.com.eits.boot.test.domain.AbstractIntegrationTests;

/**
 * 
 * @author Rubens Tavares Lopes
 */
public class UsuarioServicoTestesIntegracao extends AbstractIntegrationTests
{
	/*-------------------------------------------------------------------
	 *				 		     ATTRIBUTES
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 */
	@Autowired
	private UsuarioServico accountService;
	
	/*-------------------------------------------------------------------
	 *				 		      TESTS
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 */
	@Test(expected = AuthenticationCredentialsNotFoundException.class)
	public void insertUserMustFail() 
	{
		this.accountService.inserirUsuario( new Usuario() );
	}
	
	/**
	 * 
	 */
	@Test
	@WithUserDetails("admin@email.com")
	@Sql({
		"/dataset/account/users.sql"
	})
	public void inserirUsuarioDevePassar()
	{
		Usuario user = new Usuario( null, "test@user.com", "user", true, UsuarioPerfil.ATENDENTE );
		user = this.accountService.inserirUsuario( user );

		Assert.assertNotNull( user );
		Assert.assertNotNull( user.getId() );
		Assert.assertNotNull( user.getCreated() );
		Assert.assertFalse( user.getSenha().equals( "user" ) );
	}
	
	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/account/users.sql"
	})
	public void findUserByIdMustPass()
	{
		final Usuario user = this.accountService.buscarUsuarioPorId( 9999L );
	
		Assert.assertNotNull( user );
		Assert.assertNotNull( user.getId() );
		Assert.assertNotNull( user.getCreated() );
		Assert.assertEquals( "admin@email.com", user.getEmail() );
	}
	
	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/account/users.sql"
	})
	public void listUsersByFiltersMustReturn2()
	{
		final Page<Usuario> users = this.accountService.listarUsuariosPorFiltros( "user", null );
		
		Assert.assertNotNull( users );
		Assert.assertEquals( 2, users.getTotalElements() );
	}
	
	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/account/users.sql"
	})
	public void listUsersByFiltersMustReturn3()
	{
		final Page<Usuario> users = this.accountService.listarUsuariosPorFiltros( "1000,1001,xó", null );
		
		Assert.assertNotNull( users );
		Assert.assertEquals( 3, users.getTotalElements());
	}
	
	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/account/users.sql"
	})
	public void listUsersByFiltersMustReturn1()
	{
		final Page<Usuario> users = this.accountService.listarUsuariosPorFiltros( "xó", null );
		
		Assert.assertNotNull( users );
		Assert.assertEquals( 1, users.getTotalElements());
	}
	
	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/account/users.sql"
	})
	public void listUsersByFiltersMustReturnAll()
	{
		final Page<Usuario> users = this.accountService.listarUsuariosPorFiltros( null, null );
		
		Assert.assertNotNull( users );
		Assert.assertEquals( 4, users.getTotalElements() );
	}
}