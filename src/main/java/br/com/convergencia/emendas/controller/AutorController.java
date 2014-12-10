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

import br.com.convergencia.emendas.model.Autor;
import br.com.convergencia.emendas.service.AutorService;

@Controller
public class AutorController {
	
	private static final Logger logger = LoggerFactory.getLogger(AutorController.class);
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	// Injeções de Dependencia //
	// ~~~~~~~~~~~~~~~~~~~~~~~~//

	@Autowired private AutorService autorService;
		
	// ~~~~~~~~~~~~~~~~~~~~//
	//   Métodos Mapeados  //
	// ~~~~~~~~~~~~~~~~~~~~//
	
	@RequestMapping(value = "autor/lista", method = RequestMethod.GET)
	public String listAll(Model model) {
		model.addAttribute("autores", autorService.listAll());
		
		return "lista-autor";
	}
	
	@RequestMapping(value = "autor/salvar", method = RequestMethod.POST)
	public String salvar(@RequestParam String nome) {
		
		Autor autor = new Autor();
		autor.setNome(nome);
		
		autorService.save(autor);
		
		logger.info("## SALVANDO NOVO AUTOR ##");
		return "redirect:lista";
	}
	
	@RequestMapping(value = "autor/editar", method = RequestMethod.POST)
	public String editar(@RequestParam String nome, @RequestParam Integer id) {
		
		Autor autor = autorService.getAutor(id);
		autor.setNome(nome);
		
		autorService.update(autor);
		
		logger.info("## EDITANDO AUTOR ## ID: " + autor.getId());		
		return "redirect:lista";
	}
	
	@RequestMapping(value = "autor/remover", method = RequestMethod.POST)
	public void remover(Integer id, HttpServletResponse response) {
		Autor autor =  autorService.getAutor(id);
		autorService.delete(autor);
		
		logger.info("## REMOVENDO AUTOR ## ID: " + autor.getId());
		response.setStatus(200);
	}	
}
