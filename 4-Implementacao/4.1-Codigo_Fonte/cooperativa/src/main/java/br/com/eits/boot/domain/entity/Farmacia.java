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
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.validator.constraints.Email;
//import org.hibernate.envers.Audited;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.br.CNPJ;

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
@Table(name = "\"farmacia\"")
@EqualsAndHashCode(callSuper=true)
@DataTransferObject(javascript = "Farmacia")
public class Farmacia extends AbstractEntity implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4052986759552589018L;

	/*-------------------------------------------------------------------
	 *				 		     ATTRIBUTES
	 *-------------------------------------------------------------------*/
	
	/*@CreationTimestamp
	//@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_cadastro")
	private Calendar dataCadastro;

	@UpdateTimestamp
	//@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "data_atualizacao")
	private Calendar dataAtualizacao;*/
	
	// Basic
	@NotNull
	@NotBlank
	@Column(name = "razao_social", nullable = false, length = 100)
	private String razaoSocial;
	/**
	 * 
	 */
	@NotNull
	@NotBlank
	@Column(name = "nome_fantasia", nullable = false, length = 100)
	private String nomeFantasia;
	/**
	 * 
	 */
	@NotNull
	@NotBlank
	@CNPJ(message="CNPJ informado é inválido")
	@Column(name = "cnpj", nullable = false, length = 14)
	private String cnpj;
	/**
	 * 
	 */
	@NotNull
	@NotBlank
	@Column(name = "inscricao_estadual", nullable = false, length = 11)
	private String inscricaoEstadual;
	/**
	 * 
	 */
	@NotNull
	@NotBlank
	@Column(name = "telefone", nullable = false, length = 20)
	private String telefone;
	/**
	 * 
	 */
	@NotNull
	@NotBlank
	@Email(message="E-mail informado é inválido")
	@Column(name = "email", nullable = false, length = 50)
	private String email;
	/**
	 * 
	 */
	@NotNull
	@NotBlank
	@Column(name = "cep", nullable = false, length = 8)
	private String cep;
	/**
	 * 
	 */
	@NotNull
	@NotBlank
	@Column(name = "logradouro", nullable = false, length = 50)
	private String logradouro;
	/**
	 * 
	 */
	@NotNull
	@NotBlank
	@Column(name = "numero", nullable = false, length = 5)
	private String numero;
	/**
	 * 
	 */
	@NotNull
	@NotBlank
	@Column(name = "bairro", nullable = false, length = 20)
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
	@Column(name = "info_complementar", nullable = false, length = 255)
	private String informacaoComplementar;
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
	public Farmacia()
	{
	}

	/**
	 * 
	 * @param id
	 */
	public Farmacia ( Long id )
	{
		super( id );
	}
	
	/**
	 * 
	 * @param id
	 * @param razaoSocial
	 * @param nomeFantasia
	 * @param cnpj
	 * @param inscricaoEstadual
	 * @param telefone
	 * @param email
	 * @param cep
	 * @param logradouro
	 * @param numero
	 * @param bairro
	 * @param complemento
	 * @param cidade
	 * @param informacaoComplementar
	 * @param ativo
	 */          
	public Farmacia( Long id, String razaoSocial, String nomeFantasia, String cnpj, String inscricaoEstadual, String telefone, String email, String cep, String logradouro, String numero, String bairro, String complemento, String informacaoComplementar, Boolean ativo)
	{
		super( id );
		this.razaoSocial = razaoSocial;
		this.nomeFantasia = nomeFantasia;
		this.cnpj = cnpj;
		this.inscricaoEstadual = inscricaoEstadual;
		this.telefone = telefone;
		this.email = email;
		this.cep = cep;
		this.logradouro = logradouro;
		this.numero = numero;
		this.bairro = bairro;
		this.complemento = complemento;
		this.informacaoComplementar = informacaoComplementar;
		this.ativo = ativo;
	}

	/*-------------------------------------------------------------------
	 *							BEHAVIORS
	 *-------------------------------------------------------------------*/
	

}