package br.com.convergencia.emendas.controller;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.convergencia.emendas.model.Emenda;
import br.com.convergencia.emendas.model.IndicacaoEmenda;
import br.com.convergencia.emendas.service.EmendaService;
import br.com.convergencia.emendas.service.IndicacaoEmendaService;

@Controller
@RequestMapping(value = "emenda/indicacao/")
public class IndicacaoEmendaController {
	
	private static final Logger logger = LoggerFactory.getLogger(IndicacaoEmendaController.class);
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	// Injeções de Dependencia //
	// ~~~~~~~~~~~~~~~~~~~~~~~~//

	@Autowired private IndicacaoEmendaService indicacaoEService;
	@Autowired private EmendaService emendaService;
		
	// ~~~~~~~~~~~~~~~~~~~~//
	//   Métodos Mapeados  //
	// ~~~~~~~~~~~~~~~~~~~~//
	
	@RequestMapping(value = "{id}", method = RequestMethod.GET)
	public String listAll(@PathVariable Integer id, Model model) {
		
		Emenda emenda = emendaService.getEmenda(id);
		
		model.addAttribute("emenda", emenda);
		model.addAttribute("indicacoes", indicacaoEService.findByEmenda(emenda));
		
		return "indicacao-emenda";
	}
	
	@RequestMapping(value = "salvar", method = RequestMethod.POST)
	public String salvar(@RequestParam String nome) {
		
		IndicacaoEmenda indicacao = new IndicacaoEmenda();
		
		indicacaoEService.save(indicacao);
		
		logger.info("## SALVANDO NOVA INDICACAO ##");
		return "redirect:lista";
	}
	
	@RequestMapping(value = "editar", method = RequestMethod.POST)
	public String editar(@RequestParam String nome, @RequestParam Integer id) {
		
		IndicacaoEmenda indicacao = indicacaoEService.getIndicacaoEmenda(id);
		
		indicacaoEService.update(indicacao);
		
		logger.info("## EDITANDO INDICACAO ID: " + indicacao.getId() + " ##");		
		return "redirect:lista";
	}
	
	@RequestMapping(value = "remover", method = RequestMethod.POST)
	public void remover(Integer id, HttpServletResponse response) {
		IndicacaoEmenda indicacao =  indicacaoEService.getIndicacaoEmenda(id);
		indicacaoEService.delete(indicacao);
		
		logger.info("## REMOVENDO INDICACAO ID: " + indicacao.getId() + " ##");
		response.setStatus(200);
	}	
}
