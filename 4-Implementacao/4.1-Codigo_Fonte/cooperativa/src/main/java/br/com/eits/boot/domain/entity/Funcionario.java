package br.com.eits.boot.domain.entity;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.directwebremoting.annotations.DataTransferObject;
import org.hibernate.annotations.Type;
//import org.hibernate.envers.Audited;
import org.hibernate.validator.constraints.NotBlank;

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
@Table(name = "\"funcionario\"")
@EqualsAndHashCode(callSuper=true)
@DataTransferObject(javascript = "Funcionario")
public class Funcionario extends AbstractEntity implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4052986759552589018L;

	/*-------------------------------------------------------------------
	 *				 		     ATTRIBUTES
	 *-------------------------------------------------------------------*/
		 
	// Basic
	@NotNull
	@NotBlank
	@Column(name = "nome", nullable = false, length = 100)
	private String nome;
	/**
	 * 
	 */
	@NotNull
	@NotBlank
	@Column(name = "rg", nullable = false, length = 20)
	private String rg;
	/**
	 * 
	 */
	@NotNull
	@NotBlank
	@Column(name = "cpf", nullable = false, length = 11)
	private String cpf;
	/**
	 * 
	 */
	@Column(name = "data_nascimento")
	/*@Type(type="date")*/
	private Calendar dataNascimento;
	/**
	 * 
	 */
	@NotNull
	@Column(name = "telefone", length = 20)
	private String telefone;
	/**
	 * 
	 */
	@NotNull
	@Column(name = "celular", length = 20)
	private String celular;
	/**
	 * 
	 */
	@NotNull
	@Column(name = "ativo", nullable = false)
	private Boolean ativo;

	/*-------------------------------------------------------------------
	 * 		 					CONSTRUCTORS
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 */
	public Funcionario()
	{
	}

	/**
	 * 
	 * @param id
	 */
	public Funcionario ( Long id )
	{
		super( id );
	}
	
	/**
	 * 
	 * @param id
	 * @param nome
	 * @param rg
	 * @param cpf
	 * @param dataNascimento
	 * @param telefone
	 * @param celular
	 * @param cep
	 * @param logradouro
	 * @param numero
	 * @param bairro
	 * @param complemento
	 * @param dataCadastro
	 * @param ativo
	 */
	public Funcionario( Long id, String nome, String rg, String cpf, Calendar dataNascimento, String telefone, String celular, Boolean ativo)
	{
		super( id );
		this.nome = nome;
		this.rg = rg;
		this.cpf = cpf;
		this.dataNascimento = dataNascimento;
		this.telefone = telefone;
		this.celular = celular;
		this.ativo = ativo;
	}

	/*-------------------------------------------------------------------
	 *							BEHAVIORS
	 *-------------------------------------------------------------------*/
	
}