package br.com.eits.boot.test.domain.service;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.access.AccessDeniedException;
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
	private UsuarioServico usuarioServico;
	
	/*-------------------------------------------------------------------
	 *				 		      TESTS
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 */
	@Test(expected=AccessDeniedException.class)
	@WithUserDetails("abc@testes.com")
	@Sql({
		"/dataset/usuarios.sql"
	})
	public void salvarUsuarioDeveFalhar() 
	{
		this.usuarioServico.inserirUsuario( new Usuario() );
		Assert.fail("Deveria retornar erro de acesso negado");
	}
	
	/**
	 * 
	 */
	@Test
	@WithUserDetails("admin@email.com")
	@Sql({
		"/dataset/usuarios.sql"
	})
	public void inserirUsuarioDevePassar()
	{
		Usuario user = new Usuario( null, "test@user.com", "user", true, UsuarioPerfil.ATENDENTE );
		user = this.usuarioServico.inserirUsuario( user );

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
		"/dataset/usuarios.sql"
	})
	public void buscarUsuarioPorIdDevePassar()
	{
		final Usuario user = this.usuarioServico.buscarUsuarioPorId( 9999L );
	
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
		"/dataset/usuarios.sql"
	})
	public void listarUsuariosPorFiltrosDeveRetornar1()
	{
		final Page<Usuario> usuarios = this.usuarioServico.listarUsuariosPorFiltros( "abc", null );
		
		Assert.assertNotNull( usuarios );
		Assert.assertEquals( 1, usuarios.getTotalElements());
	}
	
	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/usuarios.sql"
	})
	public void listarUsuariosPorFiltrosDeveRetornar2()
	{
		final Page<Usuario> usuarios = this.usuarioServico.listarUsuariosPorFiltros( "user", null );
		
		Assert.assertNotNull( usuarios );
		Assert.assertEquals( 2, usuarios.getTotalElements() );
	}
	

	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/usuarios.sql"
	})
	public void listarUsuariosPorFiltrosDeveRetornar3()
	{
		final Page<Usuario> usuarios = this.usuarioServico.listarUsuariosPorFiltros( "1000,1001,abc", null );
		
		Assert.assertNotNull( usuarios );
		Assert.assertEquals( 3, usuarios.getTotalElements());
	}
	
	/**
	 * 
	 */
	@Test
	@Sql({
		"/dataset/usuarios.sql"
	})
	public void listUsersByFiltersDeveRetornarTodos()
	{
		final Page<Usuario> usuarios = this.usuarioServico.listarUsuariosPorFiltros( null, null );
		
		Assert.assertNotNull( usuarios );
		Assert.assertEquals( 4, usuarios.getTotalElements() );
	}
}