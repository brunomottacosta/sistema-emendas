package br.com.convergencia.emendas.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import br.com.convergencia.emendas.service.AcaoService;
import br.com.convergencia.emendas.service.AutorService;
import br.com.convergencia.emendas.service.EmendaService;
import br.com.convergencia.emendas.service.ObjetoService;
import br.com.convergencia.emendas.service.OrgaoConcedenteService;
import br.com.convergencia.emendas.service.ProgramaService;
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
	@Autowired private ProgramaService programaService;
	@Autowired private AcaoService acaoService;
	@Autowired private OrgaoConcedenteService orgaoConcedenteService;
	@Autowired private ObjetoService objetoService;
	
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
		model.addAttribute("programas", programaService.listAll());
		model.addAttribute("acoes", acaoService.listAll());
		model.addAttribute("objetos", objetoService.listAll());
		
		return "pesquisa-emenda";
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
			/** PARAMETROS NECESSARIOS **/
			@RequestParam String numero,
			@RequestParam String ano,
			@RequestParam String funcProg,
			@RequestParam String idModalidade,
			@RequestParam String idGND,
			@RequestParam String idTipoEmenda,
			@RequestParam String idOrgaoConced,
			@RequestParam String idAutor,
			@RequestParam String idPrograma,
			@RequestParam String idAcao,
			@RequestParam String idObjeto,
			@RequestParam String valor) {	
		
		/** SETA VALORES DO FILTRO PARA BUSCAR **/
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("numero", numero);
		map.put("ano", ano);
		map.put("funcional", funcProg);
		map.put("modalidade", idModalidade);
		map.put("gnd", idGND);
		map.put("tipo", idTipoEmenda);
		map.put("orgao", idOrgaoConced);
		map.put("autor", idAutor);
		map.put("programa", idPrograma);
		map.put("acao", idAcao);
		map.put("objeto", idObjeto);
		map.put("valor", valor);				
		
		/** CRIA LISTA DE OBJETOS BUSCADOS **/		
		List<Emenda> emendas =  emendaService.listByFiltro(map);
		
		/** LISTA AUXILIAR "WRAPPER", TODOS OS ATRIBUTOS SAO PASSADOS PARA STRING PARA FACILITAR A LEITURA NO JSON **/
		List<EmendaWrapper> wrapper = new ArrayList<EmendaWrapper>();
		
		/** PASSA ATRIBUTOS DO OBJETO PARA O SEU "WRAPPER" E ADICIONA NA LISTA PARA JSON **/
		for (Emenda e : emendas) {
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
		model.addAttribute("programas", programaService.listAll());
		model.addAttribute("autores", autorService.listAll());
		model.addAttribute("orgaos", orgaoConcedenteService.listAll());
				
		return "cadastro-emenda";
	}	
	
	/** SALVAR NOVA EMENDA **/
	@RequestMapping(value = "registro/salvar", method = RequestMethod.POST)
	public String salvar(
			@RequestParam Integer numero,
			@RequestParam Integer ano,
			@RequestParam String valor, 
			@RequestParam Integer[] gnd,
			@RequestParam Integer[] modApp,
			@RequestParam Integer tipoEmenda,
			@RequestParam String funcProg,
			@RequestParam Integer idAutor,
			@RequestParam Integer idOrgaoConced,
			@RequestParam Integer idPrograma,
			@RequestParam Integer idAcao) {
		
		Emenda emenda = new Emenda();
		
		String execucao = "";					
		
		/** SETA ATRIBUTOS **/
		emenda.setNumero(numero);
		emenda.setAno(ano);
		emenda.setFuncionalProgramatica(funcProg);
		emenda.setValor(new BigDecimal(conversor.mascaraApenasNumero(valor)));
		emenda.setTipoEmenda(TipoEmenda.getTipoEmendaById(tipoEmenda));
		emenda.setAutor(autorService.getAutor(idAutor));
		emenda.setOrgaoConcedente(orgaoConcedenteService.getOrgaoConcedente(idOrgaoConced));
		emenda.setPrograma(programaService.getPrograma(idPrograma));
		emenda.setAcao(acaoService.getAcao(idAcao));		
	
		/** PARA RELACAO N X M, CONFERE O ARRAY RECEBIDO **/
		/** VALIDA E ADICIONA A LISTA DE OBJETOS "M" **/
		if (gnd.length > 0) {				
			String gndEmenda = "";			
			if (gnd.length == 1) {
				gndEmenda = gnd[0].toString();
			} else if (gnd.length > 1) {		
				for (Integer i : gnd) {
					if (gndEmenda.isEmpty()) {
						gndEmenda = i.toString();
					} else {
						gndEmenda = gndEmenda + "_" + i.toString();						
					}
				} 				
			}
			emenda.setGnd(gndEmenda);
		}
		
		if (modApp.length > 0) {
			String modAppEmenda = "";			
			if (modApp.length == 1) {
				modAppEmenda = modApp[0].toString();
			} else if (modApp.length > 1) {			
				for (Integer i : modApp) {
					if (modAppEmenda.isEmpty()) {
						modAppEmenda = i.toString();
					} else {
						modAppEmenda = modAppEmenda + "_" + i.toString();						
					}
				}			
			}
			emenda.setModalidadeDeAplicacao(modAppEmenda);
		}
		
		/** SALVA PREVIAMENTE **/
		emendaService.save(emenda);	
		
		execucao = "SALVANDO";
		
		logger.info("## " + execucao + " EMENDA ID: " + emenda.getId() + " ##");		
		return "redirect:novo";
	}
	
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
	
	/** VER EMENDA **/
	@RequestMapping(value = "visualizar/{id}", method = RequestMethod.GET)
	public String selecionar(@PathVariable Integer id, Model model) {
		
		Emenda emenda = emendaService.getEmenda(id);
		
		model.addAttribute("emenda", emenda);
		
		/** LISTAS AUXILIARES **/
		model.addAttribute("objetosDaEmenda", objetoService.findByEmenda(id));
		
		return "ver-emenda";
	}	
	
	/** LISTA AUXILIAR **/
	@RequestMapping(value = "lista", method = RequestMethod.GET)
	public String lista(Model model) {
		model.addAttribute("emendas", emendaService.listAll());
		
		return "lista-emenda";
	}
	
	/** REMOVER EMENDA **/
	@RequestMapping(value = "remover", method = RequestMethod.POST)
	public void remover(Integer id, HttpServletResponse response) {
		
		/** BUSCA PELO ID E CRIA LISTA VAZIA DE ACOES**/
		Emenda emenda = emendaService.getEmenda(id);
//		List<Acao> acoesByEmenda = new ArrayList<Acao>();
//		
//		/** SE EMENDA TIVER UM PROGRAMA, BUSCA AS ACOES DESSA EMENDA E PREENCHE A LISTA**/
//		if (emenda.getPrograma() != null) {
//			acoesByEmenda = acaoService.findByEmendaId(id);
//		}
//		
//		/** SE A LISTA BUSCADA AINDA ESTIVER VAZIA N FAZ NADA **/
//		if (!acoesByEmenda.isEmpty()) {
//			int n = acoesByEmenda.size();
//			
//			/** REMOVE A RELAÇAO DA ACAO COM A EMENDA **/
//			try {
//				for (Acao a : acoesByEmenda) {
//					a.setEmenda(null);				
//					acaoService.save(a);				
//				}				
//			} catch (Exception e) {
//				logger.info("## ERRO AO DELETAR EMENDA ##");
//			}
//			logger.info("## ACOES DA EMENDA REMOVIDAS... TOTAL DE " + n + " ACOES ##");
//		}
		
	
		/** REMOVE A EMENDA APOS REMOVER TODAS AS RELAÇÕES **/
		emendaService.delete(emenda);
		logger.info("## REMOVENDO EMENDA ID: " + emenda.getId() + " ##");		

		response.setStatus(200);
	}	
}
