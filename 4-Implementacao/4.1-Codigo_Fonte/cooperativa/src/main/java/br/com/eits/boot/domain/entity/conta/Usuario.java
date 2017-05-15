package br.com.eits.boot.domain.entity.conta;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.directwebremoting.annotations.DataTransferObject;
import org.hibernate.envers.Audited;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import br.com.eits.common.domain.entity.AbstractEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 
 * @author Rubens Tavares Lopes
 */
@Data
@Entity
@Audited
@Table(name = "\"usuario\"")
@EqualsAndHashCode(callSuper=true)
@DataTransferObject(javascript = "Usuario")
public class Usuario extends AbstractEntity implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4052986759552589018L;

	/*-------------------------------------------------------------------
	 *				 		     ATTRIBUTES
	 *-------------------------------------------------------------------*/
	// Basic
	/**
	 * 
	 */
	@Email
	@NotNull
	@Column(nullable = false, length = 144, unique = true)
	private String email;
	/**
	 * 
	 */
	@NotBlank
	@Length(min = 8)
	@Column(nullable = false, length = 20)
	private String senha;
	/**
	 * 
	 */
	@NotNull
	@Column(nullable = false)
	@Enumerated(EnumType.ORDINAL)
	private UsuarioPerfil perfil;
	/**
	 * 
	 */
	@NotNull
	@Column(nullable = false)
	private Boolean ativo;

	/*-------------------------------------------------------------------
	 * 		 					CONSTRUCTORS
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 */
	public Usuario()
	{
	}

	/**
	 * 
	 * @param id
	 */
	public Usuario ( Long id )
	{
		super( id );
	}
	
	/**
	 * 
	 * @param id
	 * @param email
	 * @param senha
	 * @param ativo
	 * @param perfil
	 */
	public Usuario( Long id, String email, String senha, Boolean ativo, UsuarioPerfil perfil )
	{
		super( id );
		this.email = email;
		this.ativo = ativo;
		this.senha = senha;
		this.perfil = perfil;
	}

	/*-------------------------------------------------------------------
	 *							BEHAVIORS
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 */
	@Transient
	public Set<GrantedAuthority> getAuthorities()
	{
		final Set<GrantedAuthority> authorities = new HashSet<>();

		if ( this.perfil == null )
		{
			return null;
		}
		
		authorities.addAll( this.perfil.getAuthorities() );

		return authorities;
	}

	
	/**
	 * 
	 */
	@Transient
	public boolean isAtivo()
	{
		return !this.ativo;
	}

	/*
	 * (non-Javadoc)
	 * @see
	 * org.springframework.security.core.userdetails.UserDetails#getPassword()
	 
	@Override*/
	@Transient
	public String getSenha()
	{
		return this.senha;
	}
	
	@Transient
	public Long getId()
	{
		return this.id;
	}

	/*
	 * (non-Javadoc)
	 * @see
	 * org.springframework.security.core.userdetails.UserDetails#getUsername()
	@Override*/
	@Transient
	public String getEmail()
	{
		return this.email;
	}

	@Transient
	public void setEmail(String email)
	{
		this.email = email;
	}
	
	@Transient
	public void setSenha(String senha)
	{
		this.senha = senha;
	}
	
	/*-------------------------------------------------------------------
	 *						GETTERS AND SETTERS
	 *-------------------------------------------------------------------*/
}