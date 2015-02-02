package br.com.convergencia.emendas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.convergencia.emendas.service.EmpenhoService;
import br.com.convergencia.emendas.service.IndicacaoEmendaService;
import br.com.convergencia.emendas.util.ConversorUtil;

@Controller
@RequestMapping(value = "protected/empenho/")
public class EmpenhoController {

	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	// Injeções de Dependencia //
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	
	@Autowired private ConversorUtil conversor;
	@Autowired private EmpenhoService empenhoService;
	@Autowired private IndicacaoEmendaService indicacaoEService;
	
	// ~~~~~~~~~~~~~~~~~~~~//
	//   Métodos Mapeados  //
	// ~~~~~~~~~~~~~~~~~~~~//
	
	@RequestMapping(value = "lista", method = RequestMethod.GET)
	public String listAll(Model model) {
		
		model.addAttribute("empenhos", empenhoService.listAll());
		
		return "lista-empenho";
	}
	
}
