package br.com.convergencia.emendas.controller;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.convergencia.emendas.model.Programa;
import br.com.convergencia.emendas.service.ProgramaService;

@Controller
@RequestMapping(value = "programa/")
public class ProgramaController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProgramaController.class);
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	// Injeções de Dependencia //
	// ~~~~~~~~~~~~~~~~~~~~~~~~//

	@Autowired private ProgramaService programaService;
		
	// ~~~~~~~~~~~~~~~~~~~~//
	//   Métodos Mapeados  //
	// ~~~~~~~~~~~~~~~~~~~~//
	
	@RequestMapping(value = "lista", method = RequestMethod.GET)
	public String listAll(Model model) {
		model.addAttribute("programas", programaService.listAll());
		
		return "lista-programa";
	}
	
	@RequestMapping(value = "salvar", method = RequestMethod.POST)
	public String salvar(@RequestParam String nome) {
		
		Programa programa = new Programa();
		programa.setNome(nome);
		
		programaService.save(programa);
		
		logger.info("## SALVANDO NOVO PROGRAMA ##");
		return "redirect:lista";
	}
	
	@RequestMapping(value = "editar", method = RequestMethod.POST)
	public String editar(@RequestParam String nome, @RequestParam Integer id) {
		
		Programa programa = programaService.getPrograma(id);
		programa.setNome(nome);
		
		programaService.update(programa);
		
		logger.info("## EDITANDO PROGRAMA ID: " + programa.getId() + " ##");		
		return "redirect:lista";
	}
	
	@RequestMapping(value = "remover", method = RequestMethod.POST)
	public void remover(Integer id, HttpServletResponse response) {
		Programa programa =  programaService.getPrograma(id);
		programaService.delete(programa);
		
		logger.info("## REMOVENDO PROGRAMA ID: " + programa.getId() + " ##");
		response.setStatus(200);
	}	
}
