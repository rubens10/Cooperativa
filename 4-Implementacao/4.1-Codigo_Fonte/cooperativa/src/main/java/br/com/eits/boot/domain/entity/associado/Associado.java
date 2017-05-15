package br.com.eits.boot.domain.entity.associado;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.directwebremoting.annotations.DataTransferObject;
import org.hibernate.envers.Audited;
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
@Audited
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
	@Column(nullable = false, length = 100)
	private String nome;
	/**
	 * 
	 */
	@NotNull
	@NotBlank
	@Column(nullable = false, length = 15)
	private String rg;
	/**
	 * 
	 */
	@NotNull
	@NotBlank
	@Column(nullable = false, length = 11)
	private String cpf;
	/**
	 * 
	 */
	private Calendar dataNascimento;
	/**
	 * 
	 */
	@Column(length = 20)
	private String telefone;
	/**
	 * 
	 */
	@Column(length = 20)
	private String celular;
	/**
	 * 
	 */
	@Column(length = 8)
	private String cep;
	/**
	 * 
	 */
	@Column(length = 50)
	private String logradouro;
	/**
	 * 
	 */
	@Column(length = 5)
	private String numero;
	/**
	 * 
	 */
	@Column(length = 20)
	private String bairro;
	/**
	 * 
	 */
	@Column(length = 50)
	private String complemento;
	/**
	 * 
	 */
	@NotNull
	@Column(nullable = false, length = 20)
	private Calendar dataCadastro;
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
	 * @param ativo;
	 */
	public Associado( Long id, String nome, String rg, String cpf, Calendar dataNascimento, String telefone, String celular, String cep, String logradouro, String numero, String bairro, String complemento, Calendar dataCadastro, Boolean ativo)
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
		this.dataCadastro = dataCadastro;
		this.ativo = ativo;
	}

	/*-------------------------------------------------------------------
	 *							BEHAVIORS
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 */
	@Transient
	public boolean isAtivo()
	{
		return this.ativo;
	}

	/*-------------------------------------------------------------------
	 *						GETTERS AND SETTERS
	 *-------------------------------------------------------------------*/
	
	@Transient
	public String getNome()
	{
		return this.nome;
	}

	@Transient
	public String getRg()
	{
		return this.rg;
	}

	@Transient
	public String getCpf()
	{
		return this.cpf;
	}

	@Transient
	public Calendar getDataNascimento()
	{
		return this.dataNascimento;
	}

	@Transient
	public String getTelefone()
	{
		return this.telefone;
	}

	@Transient
	public String getCelular()
	{
		return this.celular;
	}

	@Transient
	public String getCep()
	{
		return this.cep;
	}	
	
	@Transient
	public String getLogradouro()
	{
		return this.logradouro;
	}

	@Transient
	public String getNumero()
	{
		return this.numero;
	}

	@Transient
	public String getBairro()
	{
		return this.bairro;
	}

	@Transient
	public String getComplemento()
	{
		return this.complemento;
	}

	@Transient
	public Calendar getDataCadastro()
	{
		return this.dataCadastro;
	}
	
	@Transient
	public void setNome(String nome)
	{
		this.nome = nome;
	}

	@Transient
	public void setRg(String rg)
	{
		this.rg = rg;
	}

	@Transient
	public void setCpf(String cpf)
	{
		this.cpf = cpf;
	}

	@Transient
	public void setDataNascimento(Calendar dataNascimento)
	{
		this.dataNascimento = dataNascimento;
	}

	@Transient
	public void setTelefone(String telefone)
	{
		this.telefone = telefone;
	}

	@Transient
	public void setCelular(String celular)
	{
		this.celular = celular;
	}

	@Transient
	public void setCep(String cep)
	{
		this.cep = cep;
	}	
	
	@Transient
	public void setLogradouro(String logradouro)
	{
		this.logradouro = logradouro;
	}

	@Transient
	public void setNumero(String numero)
	{
		this.numero = numero;
	}

	@Transient
	public void setBairro(String bairro)
	{
		this.bairro = bairro;
	}

	@Transient
	public void setComplemento(String complemento)
	{
		this.complemento = complemento;
	}

	@Transient
	public void setDataCadastro(Calendar dataCadastro)
	{
		this.dataCadastro = dataCadastro;
	}
}