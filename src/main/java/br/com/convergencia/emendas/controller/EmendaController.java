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
import br.com.convergencia.emendas.enums.TipoEmenda;
import br.com.convergencia.emendas.model.Emenda;
import br.com.convergencia.emendas.service.AutorService;
import br.com.convergencia.emendas.service.EmendaService;
import br.com.convergencia.emendas.service.OrgaoConcedenteService;
import br.com.convergencia.emendas.util.ConversorUtil;
import br.com.convergencia.emendas.wrapper.EmendaWrapper;

@Controller
@RequestMapping(value = "emenda/")
public class EmendaController {
	
	private static final Logger logger = LoggerFactory.getLogger(EmendaController.class);
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	// Injeções de Dependencia //
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	
	@Autowired private ConversorUtil conversor;
	@Autowired private EmendaService emendaService;
	@Autowired private AutorService autorService;
	@Autowired private OrgaoConcedenteService orgaoConcedenteService;
	
	// ~~~~~~~~~~~~~~~~~~~~//
	//   Métodos Mapeados  //
	// ~~~~~~~~~~~~~~~~~~~~//
	
	/** INICIO PAGINA PESQUISA EMENDAS **/
	@RequestMapping(value = "pesquisa")
	public String inicio(Model model) {	
		
		/** LISTAS AUXILIARES **/
		model.addAttribute("modalidadeDeAplicacao", Arrays.asList(ModalidadeDeAplicacao.values()));
		model.addAttribute("gnd", Arrays.asList(GND.values()));
		model.addAttribute("tipoEmenda", Arrays.asList(TipoEmenda.values()));
		model.addAttribute("autores", autorService.listAll());
		model.addAttribute("orgaos", orgaoConcedenteService.listAll());
		
		return "lista-emenda";
	}
	
	/** METODO PARA LISTAR TUDO **/
	@RequestMapping(value = "listar", method = RequestMethod.GET)
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
	
	/** METODO PARA PESQUISAR ATRAVES DE FILTROS **/
	@RequestMapping(value = "buscar", method = RequestMethod.GET)
	public @ResponseBody List<EmendaWrapper> buscar(
			@RequestParam Integer numero,
			@RequestParam Integer ano,
			@RequestParam String funcProg,
			@RequestParam Integer idModalidade,
			@RequestParam Integer idGND,
			@RequestParam Integer idTipoEmenda,
			@RequestParam Integer idOrgaoConced,
			@RequestParam Integer idAutor) {
		
		Emenda emenda = new Emenda();	
		
		/** SETA VALORES DO FILTRO PARA BUSCAR **/
		if (numero != null) {
			emenda.setNumero(numero);		
		}		
		if (ano != null) {
			emenda.setAno(ano);
		} 	
		if (idModalidade != null) {
			emenda.setModalidadeDeAplicacao(ModalidadeDeAplicacao.getModalidadeDeAplicacaoById(idModalidade));
		} 
		if (idGND != null) {
			emenda.setGnd(GND.getGNDById(idGND));
		}
		if (idTipoEmenda != null) {
			emenda.setTipoEmenda(TipoEmenda.getTipoEmendaById(idTipoEmenda));
		}
		if (idOrgaoConced != null && idOrgaoConced != 0) {
			emenda.setOrgaoConcedente(orgaoConcedenteService.getOrgaoConcedente(idOrgaoConced));
		}
		if (idAutor != null && idAutor != 0) {
			emenda.setAutor(autorService.getAutor(idAutor));
		}
			
		emenda.setFuncionalProgramatica(funcProg); //STRINGS NAO PRECISAM DE CONDICAO
		
		/** CRIA LISTA DE OBJETOS BUSCADOS **/
		List<Emenda> emendas =  emendaService.listByFiltro(emenda);
		List<EmendaWrapper> wrapper = new ArrayList<EmendaWrapper>();
		
		/** PASSA ATRIBUTOS DO OBJETO PARA O SEU ENVELOPE E ADICIONA NA LISTA PARA JSON **/
		for(Emenda e : emendas) {
			EmendaWrapper ew = new EmendaWrapper();
			ew.setAllAtributtes(e);
			
			wrapper.add(ew);
		}
		
		/** RETORNA A LISTA EM FORMATO JSON PARA UTILIZAR NO JAVASCRIPT **/
		return wrapper;
	}
	
	/** IR PARA CRIAR NOVO **/
	@RequestMapping(value = "registro/novo", method = RequestMethod.GET)
	public String novo(Model model) {
		
		Emenda emenda = new Emenda();
		
		model.addAttribute("emenda", emenda);
		model.addAttribute("modo", 1);
		
		/** LISTAS AUXILIARES **/
		model.addAttribute("modalidadeDeAplicacao", Arrays.asList(ModalidadeDeAplicacao.values()));
		model.addAttribute("gnd", Arrays.asList(GND.values()));
		model.addAttribute("tipoEmenda", Arrays.asList(TipoEmenda.values()));
		model.addAttribute("autores", autorService.listAll());
		model.addAttribute("orgaos", orgaoConcedenteService.listAll());
				
		return "dados-emenda";
	}
	
	/** IR PARA EDITAR ATUAL **/
	@RequestMapping(value = "registro/editar/{id}", method = RequestMethod.GET)
	public String selecionar(@PathVariable Integer id, Model model) {
		
		Emenda emenda = emendaService.getEmenda(id);
		
		model.addAttribute("emenda", emenda);
		model.addAttribute("modo", 2);
		
		/** LISTAS AUXILIARES **/
		model.addAttribute("modalidadeDeAplicacao", Arrays.asList(ModalidadeDeAplicacao.values()));
		model.addAttribute("gnd", Arrays.asList(GND.values()));		
		model.addAttribute("tipoEmenda", Arrays.asList(TipoEmenda.values()));
		model.addAttribute("autores", autorService.listAll());
		model.addAttribute("orgaos", orgaoConcedenteService.listAll());
		
		return "dados-emenda";
	}
	
	/** SALVAR NOVA EMENDA E IR PARA PAGINA DE PESQUISA AO COMPLETAR **/
	@RequestMapping(value = "registro/salvar", method = RequestMethod.POST)
	public String salvar(
			@RequestParam Integer modo,
			@RequestParam Integer id,
			@RequestParam Integer numero,
			@RequestParam Integer ano,
			@RequestParam String valor, 
			@RequestParam Integer gnd,
			@RequestParam Integer modApp,
			@RequestParam Integer tipoEmenda,
			@RequestParam String funcProg,
			@RequestParam Integer idAutor,
			@RequestParam Integer idOrgaoConced) {
		
		Emenda emenda = new Emenda();
		
		String execucao = "";
		
		/** SE MODO = 1, ENTAO SALVA NOVO **/
		if (modo == 1) {							
			
			emenda.setNumero(numero);
			emenda.setAno(ano);
			emenda.setFuncionalProgramatica(funcProg);
			emenda.setValor(new BigDecimal(conversor.mascaraApenasNumero(valor)));
			emenda.setModalidadeDeAplicacao(ModalidadeDeAplicacao.getModalidadeDeAplicacaoById(modApp));
			emenda.setGnd(GND.getGNDById(gnd));
			emenda.setTipoEmenda(TipoEmenda.getTipoEmendaById(tipoEmenda));
			emenda.setAutor(autorService.getAutor(idAutor));
			emenda.setOrgaoConcedente(orgaoConcedenteService.getOrgaoConcedente(idOrgaoConced));
			
			execucao = "SALVANDO";			
		} 
		
		/** SE MODO = 2, ENTAO EDITA ATUAL **/
		else if (modo == 2) {
			
			emenda = emendaService.getEmenda(id);
			
			emenda.setNumero(numero);
			emenda.setAno(ano);
			emenda.setFuncionalProgramatica(funcProg);
			emenda.setValor(new BigDecimal(conversor.mascaraApenasNumero(valor)));
			emenda.setModalidadeDeAplicacao(ModalidadeDeAplicacao.getModalidadeDeAplicacaoById(modApp));
			emenda.setGnd(GND.getGNDById(gnd));
			emenda.setTipoEmenda(TipoEmenda.getTipoEmendaById(tipoEmenda));
			emenda.setAutor(autorService.getAutor(idAutor));
			emenda.setOrgaoConcedente(orgaoConcedenteService.getOrgaoConcedente(idOrgaoConced));
			
			execucao = "EDITANDO";
		}
		
		
		emendaService.save(emenda);	
		
		logger.info("## " + execucao + " EMENDA ID: " + emenda.getId() + " ##");		
		return "redirect:novo";
	}
	
	@RequestMapping(value = "registro/remover", method = RequestMethod.POST)
	public void remover(Integer id, HttpServletResponse response) {
		Emenda emenda = emendaService.getEmenda(id);
		emendaService.delete(emenda);
		
		logger.info("## REMOVENDO EMENDA ID: " + emenda.getId() + " ##");		
		response.setStatus(200);
	}	
	
}
