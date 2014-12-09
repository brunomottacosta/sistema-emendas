package br.com.convergencia.emendas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/* PATH INICIAL DO SISTEMA */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "index";
	}	
	
	/* PAGINA DE LISTAS AUXILIARES PARA EMENDAS */
	@RequestMapping(value = "listas", method = RequestMethod.GET)
	public String listasAuxiliares() {
		
		return "listas-auxiliares";
	}
}
