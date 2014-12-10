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

import br.com.convergencia.emendas.model.OrgaoConcedente;
import br.com.convergencia.emendas.service.OrgaoConcedenteService;

@Controller
public class OrgaoConcedenteController {
		
	private static final Logger logger = LoggerFactory.getLogger(OrgaoConcedenteController.class);
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	// Inje��es de Dependencia //
	// ~~~~~~~~~~~~~~~~~~~~~~~~//

	@Autowired private OrgaoConcedenteService orgaoConcedenteService;
		
	// ~~~~~~~~~~~~~~~~~~~~//
	//   M�todos Mapeados  //
	// ~~~~~~~~~~~~~~~~~~~~//
	
	@RequestMapping(value = "orgao-concedente/lista", method = RequestMethod.GET)
	public String listAll(Model model) {
		
		model.addAttribute("orgaos", orgaoConcedenteService.listAll());
		
		return "lista-orgao-concedente";
	}
	
	@RequestMapping(value = "orgao-concedente/salvar", method = RequestMethod.POST)
	public String salvar(@RequestParam String nome) {
		
		OrgaoConcedente orgao = new OrgaoConcedente();
		orgao.setNome(nome);
		
		orgaoConcedenteService.save(orgao);
		
		logger.info("## SALVANDO NOVO ORGAO CONCEDENTE ##");
		return "redirect:lista";
	}
	
	@RequestMapping(value = "orgao-concedente/editar", method = RequestMethod.POST)
	public String editar(@RequestParam String nome, @RequestParam Integer id) {
		
		OrgaoConcedente orgao = orgaoConcedenteService.getOrgaoConcedente(id);
		orgao.setNome(nome);
		
		orgaoConcedenteService.update(orgao);
		
		logger.info("## EDITANDO ORGAO CONCEDENTE ID: " + orgao.getId() + " ##");		
		return "redirect:lista";
	}
	
	@RequestMapping(value = "orgao-concedente/remover", method = RequestMethod.POST)
	public void remover(Integer id, HttpServletResponse response) {
		OrgaoConcedente orgao =  orgaoConcedenteService.getOrgaoConcedente(id);
		orgaoConcedenteService.delete(orgao);
		
		logger.info("## REMOVENDO ORGAO CONCEDENTE ID: " + orgao.getId() + " ##");
		response.setStatus(200);
	}	
	
}
