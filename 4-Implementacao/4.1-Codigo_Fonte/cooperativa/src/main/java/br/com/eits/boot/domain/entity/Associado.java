package br.com.eits.boot.domain.entity;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
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

import br.com.eits.boot.domain.entity.endereco.Cidade;
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
@Table(name = "\"associado\"")
@EqualsAndHashCode(callSuper=true)
@DataTransferObject(javascript = "Associado")
public class Associado extends AbstractEntity implements Serializable
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
	@CPF(message="CPF informado é inválido")
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
	@Column(name = "cep", length = 8)
	private String cep;
	/**
	 * 
	 */
	@NotNull
	@Column(name = "logradouro", length = 50)
	private String logradouro;
	/**
	 * 
	 */
	@NotNull
	@Column(name = "numero", length = 5)
	private String numero;
	/**
	 * 
	 */
	@NotNull
	@Column(name = "bairro", length = 20)
	private String bairro;
	/**
	 * 
	 */
	@Column(name = "complemento", length = 50)
	private String complemento;
	/**
	 * 
	 */
	@ManyToOne
	@JoinColumn(name = "cidade_id", nullable = false)
	private Cidade cidade;
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
	public Associado()
	{
	}

	/**
	 * 
	 * @param id
	 */
	public Associado ( Long id )
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
	public Associado( Long id, String nome, String rg, String cpf, Calendar dataNascimento, String telefone, String celular, String cep, String logradouro, String numero, String bairro, String complemento, Boolean ativo)
	{
		super( id );
		this.nome = nome;
		this.rg = rg;
		this.cpf = cpf;
		this.dataNascimento = dataNascimento;
		this.telefone = telefone;
		this.celular = celular;
		this.cep = cep;
		this.logradouro = logradouro;
		this.numero = numero;
		this.bairro = bairro;
		this.complemento = complemento;
		this.ativo = ativo;
	}

	/*-------------------------------------------------------------------
	 *							BEHAVIORS
	 *-------------------------------------------------------------------*/
	

}