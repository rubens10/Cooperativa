package br.com.eits.boot.domain.entity.endereco;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.directwebremoting.annotations.DataTransferObject;
import org.hibernate.annotations.Type;
//import org.hibernate.envers.Audited;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.br.CPF;

import br.com.eits.boot.domain.entity.Associado;
import br.com.eits.boot.domain.entity.Funcionario;
import br.com.eits.boot.domain.entity.conta.UsuarioPerfil;
import br.com.eits.common.domain.entity.AbstractEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 
 * @since 02/06/2014
 * @version 1.0
 * @category
 */
@Data
@Entity
@Table(name = "\"cidade\"")
@EqualsAndHashCode(callSuper=true)
@DataTransferObject(javascript = "Cidade")
public class Cidade extends AbstractEntity implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4052986759552589018L;

	/*-------------------------------------------------------------------
	 *				 		     ATTRIBUTES
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 */
	@ManyToOne
	@JoinColumn(name = "id_estado", nullable = false)
	private Estado estado;
	/**
	 * 
	 */
	@Column(name = "nome", length = 250)
	private String nome;

	/*-------------------------------------------------------------------
	 * 		 					CONSTRUCTORS
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 */
	public Cidade()
	{
	}

	/**
	 * 
	 * @param id
	 */
	public Cidade ( Long id )
	{
		super( id );
	}
	
	/**
	 * 
	 * @param id
	 * @param nome
	 */
	public Cidade( Long id, String nome)
	{
		super( id );
		this.nome = nome;
	}

	/*-------------------------------------------------------------------
	 *							BEHAVIORS
	 *-------------------------------------------------------------------*/
	

}