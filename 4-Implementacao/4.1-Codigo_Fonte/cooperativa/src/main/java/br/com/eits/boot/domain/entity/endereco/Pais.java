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
@Table(name = "\"pais\"")
@EqualsAndHashCode(callSuper=true)
@DataTransferObject(javascript = "Pais")
public class Pais extends AbstractEntity implements Serializable
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
	@Column(name = "sigla", length = 2)
	private String sigla;
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
	public Pais()
	{
	}

	/**
	 * 
	 * @param id
	 */
	public Pais ( Long id )
	{
		super( id );
	}
	
	/**
	 * 
	 * @param id
	 * @param nome
	 * @param sigla
	 */
	public Pais( Long id, String nome, String sigla)
	{
		super( id );
		this.nome = nome;
		this.sigla = sigla;
	}

	/*-------------------------------------------------------------------
	 *							BEHAVIORS
	 *-------------------------------------------------------------------*/
	

}