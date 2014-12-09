package br.com.convergencia.emendas.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.convergencia.emendas.enums.GND;
import br.com.convergencia.emendas.enums.ModalidadeDeAplicacao;
import br.com.convergencia.emendas.model.Emenda;
import br.com.convergencia.emendas.service.EmendaService;
import br.com.convergencia.emendas.util.ConversorUtil;
import br.com.convergencia.emendas.wrapper.EmendaWrapper;

@Controller
public class EmendaController {
	
	private static final Logger logger = LoggerFactory.getLogger(EmendaController.class);
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	// Injeções de Dependencia //
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	
	@Autowired private ConversorUtil conversor;
	@Autowired private EmendaService emendaService;
	
	// ~~~~~~~~~~~~~~~~~~~~//
	//   Métodos Mapeados  //
	// ~~~~~~~~~~~~~~~~~~~~//
	
	/** INICIO PAGINA EMENDAS **/
	@RequestMapping(value = "emenda/pesquisa")
	public String inicio(Model model) {	
		
		/** LISTAS AUXILIARES **/
		model.addAttribute("modalidadeDeAplicacao", Arrays.asList(ModalidadeDeAplicacao.values()));
		model.addAttribute("gnd", Arrays.asList(GND.values()));
		
		return "lista-emenda";
	}
	
	/** METODO PARA LISTAR TUDO **/
	@RequestMapping(value = "emenda/listar", method = RequestMethod.GET)
	public @ResponseBody List<EmendaWrapper> listar() {
		
		/** CRIA LISTA DE EMENDAS E DO ENVELOPE PARA EMENDAS **/
		List<Emenda> emendas =  emendaService.listAll();
		List<EmendaWrapper> wrapper = new ArrayList<EmendaWrapper>();
		
		/** PASSA ATRIBUTOS DE EMENDA PARA O SEU ENVELOPE E ADICIONA NA LISTA **/
		for(Emenda e : emendas) {
			EmendaWrapper ew = new EmendaWrapper();
			ew.setAllAtributtes(e);
			
			wrapper.add(ew);
		}
			
		return wrapper;
	}
	
	/** METODO PARA PESQUISA **/
	@RequestMapping(value = "emenda/buscar", method = RequestMethod.GET)
	public @ResponseBody List<EmendaWrapper> buscar(
			@RequestParam Integer numero,
			@RequestParam Integer ano,
			@RequestParam Integer idModalidade,
			@RequestParam Integer idGND) {
		
		Emenda emenda = new Emenda();
		
		if(numero != null) {
			emenda.setNumero(numero);			
		} else {
			emenda.setNumero(0);
		}
		if(ano != null) {
			emenda.setAno(ano);
		} else {
			emenda.setAno(0);
		}
		if(idModalidade != null) {
			emenda.setModalidadeDeAplicacao(ModalidadeDeAplicacao.getModalidadeDeAplicacaoById(idModalidade));
		} else {
			emenda.setModalidadeDeAplicacao(ModalidadeDeAplicacao.getModalidadeDeAplicacaoById(0));;
		}
		if(idGND != null) {
			emenda.setGnd(GND.getGNDById(idGND));
		} else {
			emenda.setGnd(GND.getGNDById(0));
		}
		
		/** CRIA LISTA DE EMENDAS E DO ENVELOPE PARA EMENDAS **/
		List<Emenda> emendas =  emendaService.listByFiltro(emenda);
		List<EmendaWrapper> wrapper = new ArrayList<EmendaWrapper>();
		
		/** PASSA ATRIBUTOS DE EMENDA PARA O SEU ENVELOPE E ADICIONA NA LISTA **/
		for(Emenda e : emendas) {
			EmendaWrapper ew = new EmendaWrapper();
			ew.setAllAtributtes(e);
			
			wrapper.add(ew);
		}
		
		return wrapper;
	}
	
	/** IR PARA CRIAR NOVO **/
	@RequestMapping(value = "emenda/lista/novo")
	public String novo(Model model) {
		
		/** LISTAS AUXILIARES **/
		model.addAttribute("modalidadeDeAplicacao", Arrays.asList(ModalidadeDeAplicacao.values()));
		model.addAttribute("gnd", Arrays.asList(GND.values()));
		
		return "dados-emenda";
	}
	
	@RequestMapping(value = "emenda/lista/{id}", method = RequestMethod.GET)
	public String selecionar(@PathVariable Integer id, Model model) {
		Emenda emenda = emendaService.getEmenda(id);		
		model.addAttribute("emenda", emenda);
		
		return "dados-emenda";
	}
	
	@RequestMapping(value = "emenda/salvar", method = RequestMethod.POST)
	public String salvar(
			@RequestParam Integer modo,
			@RequestParam Integer id,
			@RequestParam Integer numero,
			@RequestParam Integer ano,
			@RequestParam String valor,
			@RequestParam Integer gnd,
			@RequestParam Integer modApp) {
		
		Emenda emenda = new Emenda();
		
		if (modo == 1) {							
			
			emenda.setNumero(numero);
			emenda.setAno(ano);
			emenda.setValor(new BigDecimal(conversor.mascaraApenasNumero(valor)));
			emenda.setModalidadeDeAplicacao(ModalidadeDeAplicacao.getModalidadeDeAplicacaoById(modApp));
			emenda.setGnd(GND.getGNDById(gnd));
			
		} else if (modo == 2) {
			
			emenda = emendaService.getEmenda(id);
			
			emenda.setNumero(numero);
			emenda.setAno(ano);
			emenda.setValor(new BigDecimal(conversor.mascaraApenasNumero(valor)));
			emenda.setModalidadeDeAplicacao(ModalidadeDeAplicacao.getModalidadeDeAplicacaoById(modApp));
			emenda.setGnd(GND.getGNDById(gnd));
		}
		
		
		emendaService.save(emenda);	
		
		logger.info("## SALVANDO EMENDA ##" + emenda.getId());
		return "redirect:lista";
	}
	
	@RequestMapping(value = "emenda/editar", method = RequestMethod.POST)
	public String editar(
			@RequestParam Integer id, 
			@RequestParam Integer numero, 
			@RequestParam Integer ano, 
			@RequestParam String valor) {
		
		Emenda emenda = emendaService.getEmenda(id);
		
		emenda.setNumero(numero);
		emenda.setAno(ano);
		emenda.setValor(new BigDecimal(conversor.mascaraApenasNumero(valor)));
		
		emendaService.update(emenda);
		
		logger.info("## EDITANDO EMENDA ##" + emenda.getId());
		return "redirect:lista";
	}
	
	@RequestMapping(value = "emenda/remover", method = RequestMethod.POST)
	public void remover(Integer id, HttpServletResponse response) {
		Emenda emenda = emendaService.getEmenda(id);
		emendaService.delete(emenda);
		
		logger.info("## REMOVENDO EMENDA ## ID:" + emenda.getId());
		response.setStatus(200);
	}	
	
}
