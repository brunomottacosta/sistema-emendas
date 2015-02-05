package br.com.convergencia.emendas.controller;

import java.math.BigDecimal;
import java.util.Date;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.convergencia.emendas.model.Empenho;
import br.com.convergencia.emendas.model.IndicacaoEmenda;
import br.com.convergencia.emendas.service.EmpenhoService;
import br.com.convergencia.emendas.service.IndicacaoEmendaService;
import br.com.convergencia.emendas.util.ConversorUtil;

@Controller
@RequestMapping(value = "protected/emenda/empenho/")
public class EmpenhoController {

	private static final Logger logger = LoggerFactory.getLogger(IndicacaoEmendaController.class);
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	// Injeções de Dependencia //
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	
	@Autowired private ConversorUtil conversor;
	@Autowired private EmpenhoService empenhoService;
	@Autowired private IndicacaoEmendaService indicacaoEService;
	
	// ~~~~~~~~~~~~~~~~~~~~//
	//   Métodos Mapeados  //
	// ~~~~~~~~~~~~~~~~~~~~//
	
	@RequestMapping(value = "{id}", method = RequestMethod.GET)
	public String listAll(@PathVariable Integer id, Model model) {
		
		IndicacaoEmenda indicacao = indicacaoEService.getIndicacaoEmenda(id);
		
		model.addAttribute("indicacao", indicacao);
		model.addAttribute("empenhos", empenhoService.listAll());
		
		/* ATRIBUTOS INDIVIDUAIS */
		model.addAttribute("valorDisponivel", indicacaoEService.calculaValorDisponivel(indicacao));
		model.addAttribute("valorUtilizado", indicacaoEService.calcularValorUtilizado(indicacao));		
		
		return "lista-empenho";
	}
	
	/** SALVAR INDICACAO **/
	@RequestMapping(value = "salvar", method = RequestMethod.POST)
	public String salvar(
			RedirectAttributes redirectAttrs,
			@RequestParam Integer indicacao,
			@RequestParam Date dataDoEmpenho,
			@RequestParam Integer numeroDoEmpenho,
			@RequestParam String ptres,
			@RequestParam String valorDoEmpenho) {
		
		IndicacaoEmenda i = indicacaoEService.getIndicacaoEmenda(indicacao);
		Empenho empenho = new Empenho();
		
		/** VALIDA SE VALOR ESTÁ VAZIO, CASO ESTEJA, RETORNA ERRO PARA TELA **/
		if (dataDoEmpenho != null && numeroDoEmpenho != null && ptres != null && !valorDoEmpenho.isEmpty()) {
			/** CONVERTE PARA DB O VALOR RECEBIDO **/
			Double db = conversor.mascaraApenasNumero(valorDoEmpenho);
			/** SE O VALOR FOR MAIOR QUE 0, CONTINUA, SE NÃO, RETORNA ERRO **/
			if (db > 0) {				
				/** SE O VALOR FOR MENOR QUE O DISPONÍVEL, CONTINUA, SE NÃO, RETORNA ERRO **/
				if (conversor.mascaraApenasNumero(valorDoEmpenho) <= indicacaoEService.calculaValorDisponivel(i).doubleValue()) {
					empenho.setIndicacao(i);
					empenho.setPtres(ptres);
					empenho.setNumeroDoEmpenho(numeroDoEmpenho);
					empenho.setDataDoEmpenho(dataDoEmpenho);
					empenho.setValorDoEmpenho(new BigDecimal(conversor.mascaraApenasNumero(valorDoEmpenho)));
					
					logger.info("## SALVANDO NOVO EMPENHO COM INDICACAO ID: " + indicacao + "##");		
					empenhoService.save(empenho);		
					
					return "redirect:/protected/emenda/empenho/" + indicacao;
				} else {
					redirectAttrs.addFlashAttribute("error", "Valor disponível menor que o valor enviado.");
					
					logger.info("## VALOR MENOR QUE O VALOR DISPONIVEL ##");	
					return "redirect:/protected/emenda/empenho/" + indicacao;
				}
			} else {
				redirectAttrs.addFlashAttribute("error", "Valor do empenho tem que ser maior que R$ 0,00.");
				
				logger.info("## VALOR MENOR OU IGUALA ZERO ##");	
				return "redirect:/protected/emenda/empenho/" + indicacao;
			}
		} else {
			redirectAttrs.addFlashAttribute("error", "Preencha todos os campos.");
			
			logger.info("## CAMPOS NÃO PREENCHIDOS OU PREENCHIDOS INCORRETAMENTE ##");	
			return "redirect:/protected/emenda/empenho/" + indicacao;
		}
		
	}
	
	@RequestMapping(value = "remover", method = RequestMethod.POST)
	public void remover(Integer id, HttpServletResponse response) {
		Empenho empenho = empenhoService.getEmpenho(id);
		
		empenhoService.delete(empenho);
		logger.info("## REMOVENDO INDICACAO ID: " + empenho.getId() + " ##");
		response.setStatus(200);
	}	
	
	@RequestMapping(value = "editar", method = RequestMethod.POST)
	public String editar(
			RedirectAttributes redirectAttrs,
			@RequestParam Integer id,
			@RequestParam Integer indicacao,
			@RequestParam Date dataDoEmpenho,
			@RequestParam Integer numeroDoEmpenho,
			@RequestParam String ptres,
			@RequestParam String valorDoEmpenho) {
		
		IndicacaoEmenda i = indicacaoEService.getIndicacaoEmenda(indicacao);
		Empenho empenho = empenhoService.getEmpenho(id);
		
		/** VALIDA SE VALOR ESTÁ VAZIO, CASO ESTEJA, RETORNA ERRO PARA TELA **/
		if (dataDoEmpenho != null && numeroDoEmpenho != null && ptres != null && !valorDoEmpenho.isEmpty()) {
			/** CONVERTE PARA DB O VALOR RECEBIDO **/
			Double db = conversor.mascaraApenasNumero(valorDoEmpenho);
			/** SE O VALOR FOR MAIOR QUE 0, CONTINUA, SE NÃO, RETORNA ERRO **/
			if (db > 0) {				
				/** SE O VALOR FOR MENOR QUE O DISPONÍVEL, CONTINUA, SE NÃO, RETORNA ERRO **/
				if (conversor.mascaraApenasNumero(valorDoEmpenho) <= indicacaoEService.calculaValorDisponivel(i).doubleValue()) {
					empenho.setIndicacao(i);
					empenho.setPtres(ptres);
					empenho.setNumeroDoEmpenho(numeroDoEmpenho);
					empenho.setDataDoEmpenho(dataDoEmpenho);
					empenho.setValorDoEmpenho(new BigDecimal(conversor.mascaraApenasNumero(valorDoEmpenho)));
					
					logger.info("## SALVANDO NOVO EMPENHO COM INDICACAO ID: " + indicacao + "##");		
					empenhoService.save(empenho);		
					
					return "redirect:/protected/emenda/empenho/" + indicacao;
				} else {
					redirectAttrs.addFlashAttribute("error", "Valor disponível menor que o valor enviado.");
					
					logger.info("## VALOR MENOR QUE O VALOR DISPONIVEL ##");	
					return "redirect:/protected/emenda/empenho/" + indicacao;
				}
			} else {
				redirectAttrs.addFlashAttribute("error", "Valor do empenho tem que ser maior que R$ 0,00.");
				
				logger.info("## VALOR MENOR OU IGUALA ZERO ##");	
				return "redirect:/protected/emenda/empenho/" + indicacao;
			}
		} else {
			redirectAttrs.addFlashAttribute("error", "Preencha todos os campos.");
			
			logger.info("## CAMPOS NÃO PREENCHIDOS OU PREENCHIDOS INCORRETAMENTE ##");	
			return "redirect:/protected/emenda/empenho/" + indicacao;
		}
	}
	
}
