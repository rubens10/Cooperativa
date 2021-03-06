package br.com.eits.boot.domain.service;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import br.com.eits.boot.domain.entity.conta.Usuario;
import br.com.eits.boot.domain.entity.conta.UsuarioPerfil;
import br.com.eits.boot.domain.repository.IUsuarioRepositorio;
import br.com.eits.common.application.i18n.MessageSourceHolder;

/**
 * 
 * @author Rubens Tavares Lopes
 */
@Service
@RemoteProxy
@Transactional
public class UsuarioServico
{
	/*-------------------------------------------------------------------
	 *				 		     ATTRIBUTES
	 *-------------------------------------------------------------------*/
	/**
	 * Password encoder
	 */
	@Autowired
	private PasswordEncoder passwordEncoder;

	//Repositories
	/**
	 * 
	 */
	@Autowired
	private IUsuarioRepositorio usuarioRepositorio;

	/*-------------------------------------------------------------------
	 *				 		     SERVICES
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 * @param user
	 * @return
	 */
	@PreAuthorize("hasAnyAuthority('"+UsuarioPerfil.ADMINISTRADOR_VALOR+"','"+UsuarioPerfil.COMERCIAL_VALOR+"')")
	public Usuario inserirUsuario( Usuario usuario )
	{
		usuario.setSenha( this.passwordEncoder.encode(usuario.getSenha()) );
		usuario.setAtivo( true );
		return this.usuarioRepositorio.save( usuario );
	}
	/**
	 * 
	 * @param user
	 * @return
	 */
	@PreAuthorize("hasAnyAuthority('"+UsuarioPerfil.ADMINISTRADOR_VALOR+"','"+UsuarioPerfil.COMERCIAL_VALOR+"')")
	public Usuario alterarUsuario( Usuario usuario )
	{
		usuario.setSenha( this.passwordEncoder.encode(usuario.getSenha()) );
		return this.usuarioRepositorio.save( usuario );
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	@PreAuthorize("hasAnyAuthority('"+UsuarioPerfil.ADMINISTRADOR_VALOR+"','"+UsuarioPerfil.COMERCIAL_VALOR+"')")
	public Usuario removerUsuario( long id )
	{
		final Usuario usuario = this.usuarioRepositorio.findOne( id );
		usuario.setAtivo( false );
	
		return this.usuarioRepositorio.save( usuario );
	}
	/**
	 * 
	 * @param id
	 * @return
	 */
	@Transactional(readOnly=true)
	public Usuario buscarUsuarioPorId( long id )
	{
		final Usuario usuario = this.usuarioRepositorio.findOne( id );
		Assert.notNull( usuario, MessageSourceHolder.getMessage("repository.notFoundById", id) );
		return usuario;
	}

	/**
	 * 
	 * @param id
	 * @return
	 */
	@Transactional(readOnly=true)
	public Page<Usuario> buscarPorEmail( String filter, PageRequest pageable )
	{
		return this.usuarioRepositorio.listByFilters( filter, pageable );
	}
	
	/**
	 * 
	 * @param pageable
	 * @param filter
	 * @return
	 */
	@Transactional(readOnly=true)
	public Page<Usuario> buscarUsuariosPorFiltros( String filter, PageRequest pageable )
	{
		return this.usuarioRepositorio.listByFilters( filter, pageable );
	}

	/**
	 * 
	 * @param pageable
	 * @param filters
	 * @return
	 */
	@Transactional(readOnly=true)
	public Page<Usuario> listarUsuariosPorFiltros( String filter, PageRequest pageable )
	{
		return this.usuarioRepositorio.listByFilters( filter, pageable );
	}
}