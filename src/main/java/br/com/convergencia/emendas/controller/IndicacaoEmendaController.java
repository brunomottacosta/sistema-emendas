package br.com.convergencia.emendas.controller;

import java.math.BigDecimal;

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
import br.com.convergencia.emendas.service.ObjetoService;
import br.com.convergencia.emendas.service.OrgaoConvenenteService;
import br.com.convergencia.emendas.util.ConversorUtil;

@Controller
@RequestMapping(value = "emenda/indicacao/")
public class IndicacaoEmendaController {
	
	private static final Logger logger = LoggerFactory.getLogger(IndicacaoEmendaController.class);
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	// Inje��es de Dependencia //
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	
	@Autowired private ConversorUtil conversor;
	@Autowired private IndicacaoEmendaService indicacaoEService;
	@Autowired private EmendaService emendaService;
	@Autowired private OrgaoConvenenteService convenenteService;
	@Autowired private ObjetoService objetoService;
		
	// ~~~~~~~~~~~~~~~~~~~~//
	//   M�todos Mapeados  //
	// ~~~~~~~~~~~~~~~~~~~~//
	
	@RequestMapping(value = "{id}", method = RequestMethod.GET)
	public String lista(@PathVariable Integer id, Model model) {
		
		Emenda emenda = emendaService.getEmenda(id);
		
		model.addAttribute("emenda", emenda);
		model.addAttribute("convenentes", convenenteService.listAll());
		model.addAttribute("objetos", objetoService.findByAcao(emenda.getAcao().getId()));
		model.addAttribute("indicacoes", indicacaoEService.findByEmenda(emenda));
		
		return "indicacao-emenda";
	}
	
	@RequestMapping(value = "salvar", method = RequestMethod.POST)
	public String salvar(
			@RequestParam Integer emenda,
			@RequestParam Integer convenente,
			@RequestParam Integer objeto,
			@RequestParam String valor) {
		
		IndicacaoEmenda indicacao = new IndicacaoEmenda();
		
		try {
			indicacao.setEmenda(emendaService.getEmenda(emenda));
			indicacao.setConvenente(convenenteService.getOrgaoConvenente(convenente));
			indicacao.setObjeto(objetoService.getObjeto(objeto));
			indicacao.setValorDestinado(new BigDecimal(conversor.mascaraApenasNumero(valor)));			
		} catch (Exception e) {
			logger.info("ERRO AO VALIDAR OS DADOS RECEBIDOS");
		}
		indicacaoEService.save(indicacao);
		
		logger.info("## SALVANDO NOVA INDICACAO ##");
		
		return "redirect:/emenda/indicacao/" + emenda;
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