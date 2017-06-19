package br.com.eits.boot.domain.entity.atendimento;

import org.directwebremoting.annotations.DataTransferObject;

/**
 * @author Rubens Tavares Lopes
 */
@DataTransferObject(type = "enum")
public enum Assunto
{
	/*-------------------------------------------------------------------
	 *				 		     ENUMS
	 *-------------------------------------------------------------------*/
	CONSULTORIA, // 0
	ORCAMENTO_DE_COMPRA, // 1
	INSUMOS; // 2
	
	public static final String CONSULTORIA_VALOR 		= "CONSULTORIA";
	public static final String ORCAMENTO_DE_COMPRA_VALOR 	= "ORÇAMENTO DE COMPRA";
	public static final String INSUMOS_VALOR			= "INSUMOS";
}