package br.com.eits.boot.application.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * @author rodrigo
 */
@Controller
public class NavigationController
{
	/*-------------------------------------------------------------------
	 * 		 					CONTROLLERS
	 *-------------------------------------------------------------------*/
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/")
	public ModelAndView centralAssociado()
	{
		return new ModelAndView( "modules/central-associado/index" );
	}
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/administrativo")
	public ModelAndView administrativo()
	{
		return new ModelAndView( "modules/administrativo/index" );
	}

	/**
	 * 
	 */
	@RequestMapping(value = "/autenticacao")
	public ModelAndView autenticacao()
	{
		return new ModelAndView( "modules/autenticacao/index" );
	}
}
