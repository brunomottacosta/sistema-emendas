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

import br.com.convergencia.emendas.model.Objeto;
import br.com.convergencia.emendas.service.AcaoService;
import br.com.convergencia.emendas.service.ObjetoService;
import br.com.convergencia.emendas.service.ProgramaService;

@Controller
@RequestMapping(value = "objeto/")
public class ObjetoController {
	
	private static final Logger logger = LoggerFactory.getLogger(ObjetoController.class);
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	// Injeções de Dependencia //
	// ~~~~~~~~~~~~~~~~~~~~~~~~//

	@Autowired private ObjetoService objetoService;
	@Autowired private AcaoService acaoService;
	@Autowired private ProgramaService programaService;
		
	// ~~~~~~~~~~~~~~~~~~~~//
	//   Métodos Mapeados  //
	// ~~~~~~~~~~~~~~~~~~~~//
	
	@RequestMapping(value = "lista", method = RequestMethod.GET)
	public String listAll(Model model) {
		
		model.addAttribute("objetos", objetoService.listAll());
		model.addAttribute("acoes", acaoService.listAll());
		model.addAttribute("programas", programaService.listAll());
		
		return "lista-objeto";
	}
	
	@RequestMapping(value = "salvar", method = RequestMethod.POST)
	public String salvar(
			@RequestParam String nome,
			@RequestParam Integer idAcao) {
		
		Objeto objeto = new Objeto();
		
		objeto.setNome(nome);
		objeto.setAcao(acaoService.getAcao(idAcao));
		
		objetoService.save(objeto);
		
		logger.info("## SALVANDO NOVO OBJETO ##");
		return "redirect:lista";
	}
	
	@RequestMapping(value = "salvarEmIndicacao", method = RequestMethod.POST)
	public String salvarEmIndicacao(
			@RequestParam String nome,
			@RequestParam Integer idAcao,
			@RequestParam Integer idEmenda) {
		
		Objeto objeto = new Objeto();
		
		objeto.setNome(nome);
		objeto.setAcao(acaoService.getAcao(idAcao));
		
		objetoService.save(objeto);
		
		logger.info("## SALVANDO NOVO OBJETO ##");
		return "redirect:/emenda/indicacao/" + idEmenda;
	}
	
	@RequestMapping(value = "editar", method = RequestMethod.POST)
	public String editar(
			@RequestParam String nome, 
			@RequestParam Integer id,
			@RequestParam Integer idAcao) {
		
		Objeto objeto = objetoService.getObjeto(id);
		
		objeto.setNome(nome);
		objeto.setAcao(acaoService.getAcao(idAcao));
		
		objetoService.update(objeto);
		
		logger.info("## EDITANDO OBJETO ID: " + objeto.getId() + " ##");		
		return "redirect:lista";
	}
	
	@RequestMapping(value = "remover", method = RequestMethod.POST)
	public void remover(Integer id, HttpServletResponse response) {
		Objeto objeto =  objetoService.getObjeto(id);
		objetoService.delete(objeto);
		
		logger.info("## REMOVENDO OBJETO ID: " + objeto.getId() + " ##");
		response.setStatus(200);
	}	
}
