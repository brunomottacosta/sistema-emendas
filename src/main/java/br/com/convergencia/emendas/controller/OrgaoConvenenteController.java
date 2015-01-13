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

import br.com.convergencia.emendas.model.OrgaoConvenente;
import br.com.convergencia.emendas.service.OrgaoConvenenteService;

@Controller
@RequestMapping(value = "protected/orgao-convenente/")
public class OrgaoConvenenteController {
		
	private static final Logger logger = LoggerFactory.getLogger(OrgaoConvenenteController.class);
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	// Injeções de Dependencia //
	// ~~~~~~~~~~~~~~~~~~~~~~~~//

	@Autowired private OrgaoConvenenteService orgaoConvenenteService;
		
	// ~~~~~~~~~~~~~~~~~~~~//
	//   Métodos Mapeados  //
	// ~~~~~~~~~~~~~~~~~~~~//
	
	@RequestMapping(value = "lista", method = RequestMethod.GET)
	public String listAll(Model model) {
		
		model.addAttribute("convenentes", orgaoConvenenteService.listAll());
		
		return "lista-orgao-convenente";
	}
	
	@RequestMapping(value = "novo")
	public String novo() {
		return "orgao-convenente-novo";
	}
	
	@RequestMapping(value = "alteracao/{id}")
	public String alteracao(@PathVariable Integer id, Model model) {
		
		model.addAttribute("convenente", orgaoConvenenteService.getOrgaoConvenente(id));
		
		return "orgao-convenente-editar";
	}
	
	@RequestMapping(value = "salvar", method = RequestMethod.POST)
	public String salvar(
			@RequestParam String nome,
			@RequestParam String cnpj) {
		
		OrgaoConvenente orgao = new OrgaoConvenente();
		orgao.setNome(nome);
		orgao.setCnpj(cnpj);
		
		orgaoConvenenteService.save(orgao);
		
		logger.info("## SALVANDO NOVO ORGAO CONVENENTE ##");
		return "redirect:lista";
	}
	
	@RequestMapping(value = "salvarEmIndicacao", method = RequestMethod.POST)
	public String salvarEmIndicacao(
			@RequestParam Integer emenda,
			@RequestParam String nome,
			@RequestParam String cnpj) {		
		
		OrgaoConvenente orgao = new OrgaoConvenente();
		orgao.setNome(nome);
		orgao.setCnpj(cnpj);
		
		orgaoConvenenteService.save(orgao);
		
		logger.info("## SALVANDO NOVO ORGAO CONVENENTE ##");
		return "redirect:/emenda/indicacao/" + emenda + "/" + 0;
	}
	
	@RequestMapping(value = "editar", method = RequestMethod.POST)
	public String editar(
			@RequestParam String nome,
			@RequestParam String cnpj,
			@RequestParam Integer id) {
		
		OrgaoConvenente orgao = orgaoConvenenteService.getOrgaoConvenente(id);
		orgao.setNome(nome);
		orgao.setCnpj(cnpj);
		
		orgaoConvenenteService.update(orgao);
		
		logger.info("## EDITANDO ORGAO CONVENENTE ID: " + orgao.getId() + " ##");		
		return "redirect:lista";
	}
	
	@RequestMapping(value = "remover", method = RequestMethod.POST)
	public void remover(Integer id, HttpServletResponse response) {
		OrgaoConvenente orgao =  orgaoConvenenteService.getOrgaoConvenente(id);
		orgaoConvenenteService.delete(orgao);
		
		logger.info("## REMOVENDO ORGAO CONVENENTE ID: " + orgao.getId() + " ##");
		response.setStatus(200);
	}	
	
}
