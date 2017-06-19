package br.com.eits.boot.domain.entity.atendimento;

import org.directwebremoting.annotations.DataTransferObject;

/**
 * @author Rubens Tavares Lopes
 */
@DataTransferObject(type = "enum")
public enum Situacao
{
	/*-------------------------------------------------------------------
	 *				 		     ENUMS
	 *-------------------------------------------------------------------*/
	NOVO, // 0
	EM_ANDAMENTO, // 1
	PENDENTE, // 2
	AGUARDANDO_ACEITE, // 3
	FINALIZADO; // 4

	public static final String NOVO_VALOR 				= "NOVO";
	public static final String EMANDAMENTO_VALOR 		= "EM ANDAMENTO";
	public static final String PENDENTE_VALOR			= "PENDENTE";
	public static final String AGUARDANDO_ACEITE_VALOR	= "AGUARDANDO ACEITE";
	public static final String FINALIZADO_VALOR			= "FINALIZADO";
}