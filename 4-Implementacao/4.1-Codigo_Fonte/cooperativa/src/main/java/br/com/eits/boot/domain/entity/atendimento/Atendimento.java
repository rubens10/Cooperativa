package br.com.eits.boot.domain.entity.atendimento;

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
@Table(name = "\"atendimento\"")
@EqualsAndHashCode(callSuper=true)
@DataTransferObject(javascript = "Atendimento")
public class Atendimento extends AbstractEntity implements Serializable
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
	@NotNull
	@Column(nullable = false)
	@Enumerated(EnumType.ORDINAL)
	private Assunto assunto;
	/**
	 * 
	 */
	@NotNull
	@Column(nullable = false)
	@Enumerated(EnumType.ORDINAL)
	private Situacao situacao;
	/**
	 * 
	 */
	@ManyToOne
	@JoinColumn(name="associado_id")
	private Associado associado;
	/**
	 * 
	 */
	@ManyToOne
	@JoinColumn(name="funcionario_id")
	private Funcionario funcionario;
	/**
	 * 
	 */
	@NotNull
	@NotBlank
	@Column(name = "mensagem", nullable = false, length = 500)
	private String mensagem;
	/**
	 * 
	 */
	@Column(name = "observacao_interna", length = 500)
	private String observacaoInterna;
	/**
	 * 
	 */
	@Column(name = "data_previsao")
	private Calendar dataPrevisao;
	/**
	 * 
	 */
	@Column(name = "data_conclusao")
	private Calendar dataConclusao;
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
	public Atendimento()
	{
	}

	/**
	 * 
	 * @param id
	 */
	public Atendimento ( Long id )
	{
		super( id );
	}
	
	/**
	 * 
	 * @param id
	 * @param mensagem
	 * @param observacao_interna
	 * @param dataPrevisao
	 * @param dataConclusao
	 * @param ativo
	 */
	public Atendimento( Long id, String mensagem, String observacaoInterna, Calendar dataPrevisao, Calendar dataConclusao, Assunto assunto, Situacao situacao, Boolean ativo)
	{
		super( id );
		this.mensagem = mensagem;
		this.observacaoInterna = observacaoInterna;
		this.dataPrevisao = dataPrevisao;
		this.dataConclusao = dataConclusao;
		this.assunto = assunto;
		this.situacao = situacao;
		this.ativo = ativo;
	}

	/*-------------------------------------------------------------------
	 *							BEHAVIORS
	 *-------------------------------------------------------------------*/
	

}