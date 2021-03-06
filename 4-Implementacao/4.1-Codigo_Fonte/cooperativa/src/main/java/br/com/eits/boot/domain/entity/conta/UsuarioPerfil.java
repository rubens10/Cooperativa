package br.com.eits.boot.domain.entity.conta;

import java.util.HashSet;
import java.util.Set;

import org.directwebremoting.annotations.DataTransferObject;
import org.springframework.security.core.GrantedAuthority;

/**
 * @author Rubens Tavares Lopes
 */
@DataTransferObject(type = "enum")
public enum UsuarioPerfil implements GrantedAuthority
{
	/*-------------------------------------------------------------------
	 *				 		     ENUMS
	 *-------------------------------------------------------------------*/
	ADMINISTRADOR, // 0
	COMERCIAL, // 1
	FINANCEIRO, // 2
	ASSOCIADO, // 3
	ATENDENTE; // 4

	public static final String ADMINISTRADOR_VALOR 	= "ADMINISTRADOR";
	public static final String COMERCIAL_VALOR 		= "COMERCIAL";
	public static final String FINANCEIRO_VALOR		= "FINANCEIRO";
	public static final String ASSOCIADO_VALOR		= "ASSOCIADO";
	public static final String ATENDENTE_VALOR		= "ATENDENTE";
	
	/*
	 * (non-Javadoc)
	 * @see org.springframework.security.core.GrantedAuthority#getAuthority()
	 */
	@Override
	public String getAuthority()
	{
		return this.name();
	}

	/**
	 * @return
	 */
	public Set<GrantedAuthority> getAuthorities()
	{
		final Set<GrantedAuthority> authorities = new HashSet<>();

		authorities.add( this );

		if ( this.equals( UsuarioPerfil.ADMINISTRADOR ) )
		{
			authorities.add( UsuarioPerfil.COMERCIAL );
			authorities.add( UsuarioPerfil.FINANCEIRO );
			authorities.add( UsuarioPerfil.ASSOCIADO );
			authorities.add( UsuarioPerfil.ATENDENTE );
		}

		return authorities;
	}
}