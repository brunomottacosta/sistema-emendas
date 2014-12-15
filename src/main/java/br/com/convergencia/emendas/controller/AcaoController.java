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

import br.com.convergencia.emendas.model.Acao;
import br.com.convergencia.emendas.service.AcaoService;
import br.com.convergencia.emendas.service.ProgramaService;

@Controller
@RequestMapping(value = "acao/")
public class AcaoController {
	
	private static final Logger logger = LoggerFactory.getLogger(AcaoController.class);
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	// Injeções de Dependencia //
	// ~~~~~~~~~~~~~~~~~~~~~~~~//

	@Autowired private AcaoService acaoService;
	@Autowired private ProgramaService programaService;
		
	// ~~~~~~~~~~~~~~~~~~~~//
	//   Métodos Mapeados  //
	// ~~~~~~~~~~~~~~~~~~~~//
	
	@RequestMapping(value = "lista", method = RequestMethod.GET)
	public String listAll(Model model) {
		
		model.addAttribute("acoes", acaoService.listAll());
		model.addAttribute("programas", programaService.listAll());
		
		return "lista-acao";
	}
	
	@RequestMapping(value = "salvar", method = RequestMethod.POST)
	public String salvar(
			@RequestParam String nome,
			@RequestParam Integer idPrograma) {
		
		Acao acao = new Acao();		
		
		acao.setNome(nome);	
		if (idPrograma != 0 && idPrograma != null) {
			acao.setPrograma(programaService.getPrograma(idPrograma));
		}
		
		acaoService.save(acao);
		
		logger.info("## SALVANDO NOVO PROGRAMA ##");
		return "redirect:lista";
	}
	
	@RequestMapping(value = "editar", method = RequestMethod.POST)
	public String editar(
			@RequestParam Integer id,
			@RequestParam String nome, 
			@RequestParam Integer idPrograma) {
		
		Acao acao = acaoService.getAcao(id);
		
		acao.setNome(nome);
		if (idPrograma != 0 && idPrograma != null) {
			acao.setPrograma(programaService.getPrograma(idPrograma));
		}
		
		acaoService.update(acao);
		
		logger.info("## EDITANDO PROGRAMA ID: " + acao.getId() + " ##");		
		return "redirect:lista";
	}
	
	@RequestMapping(value = "remover", method = RequestMethod.POST)
	public void remover(Integer id, HttpServletResponse response) {
		Acao acao =  acaoService.getAcao(id);
		acaoService.delete(acao);
		
		logger.info("## REMOVENDO PROGRAMA ID: " + acao.getId() + " ##");
		response.setStatus(200);
	}	
}
