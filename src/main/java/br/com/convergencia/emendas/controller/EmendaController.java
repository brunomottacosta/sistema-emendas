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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.convergencia.emendas.enums.GND;
import br.com.convergencia.emendas.enums.ModalidadeDeAplicacao;
import br.com.convergencia.emendas.enums.TipoEmenda;
import br.com.convergencia.emendas.model.Emenda;
import br.com.convergencia.emendas.service.AcaoService;
import br.com.convergencia.emendas.service.AutorService;
import br.com.convergencia.emendas.service.EmendaService;
import br.com.convergencia.emendas.service.IndicacaoEmendaService;
import br.com.convergencia.emendas.service.ObjetoService;
import br.com.convergencia.emendas.service.OrgaoConcedenteService;
import br.com.convergencia.emendas.service.ProgramaService;
import br.com.convergencia.emendas.util.ConversorUtil;
import br.com.convergencia.emendas.wrapper.EmendaWrapper;

@Controller
@RequestMapping(value = "protected/emenda/")
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
	@Autowired private IndicacaoEmendaService indicacaoEService;
	
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
			@RequestParam String idObjeto) {	
		
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
			RedirectAttributes redirectAttrs,
			@RequestParam Integer numero,
			@RequestParam Integer ano,
			@RequestParam String valor, 
			@RequestParam Integer[] gnd,
			@RequestParam Integer[] modalidade,
			@RequestParam Integer tipoEmenda,
			@RequestParam String funcional,
			@RequestParam Integer idAutor,
			@RequestParam Integer idOrgaoConced,
			@RequestParam Integer idPrograma,
			@RequestParam Integer idAcao) {
		
		Emenda emenda = new Emenda();
		
		/** VERIFICA SE OS DADOS SAO VALIDOS, CASO NAO SEJAM, RETORNA ERRO **/
		if (numero == null 	   || ano == null    		 || valor.isEmpty()    ||
			gnd.length == 0    || modalidade.length == 0 ||	tipoEmenda == 0    ||
			funcional.isEmpty()|| idAutor == 0   		 || idOrgaoConced == 0 ||
			idPrograma == 0    || idAcao == 0) {
			
			redirectAttrs.addFlashAttribute("error", "true");
			
			logger.info("## DADOS NÃO VÁLIDOS ##");		
			return "redirect:novo";
			
		/** CASO NAO OCORRA ERRO NA VALIDACAO, EXECUTA O RESTO DO CODIGO PARA SALVAR **/
		} else {
			
			String execucao = "";					
			
			/** SETA ATRIBUTOS **/
			emenda.setNumero(numero);
			emenda.setAno(ano);
			emenda.setFuncionalProgramatica(funcional);
			emenda.setValor(new BigDecimal(conversor.mascaraApenasNumero(valor)));
			emenda.setTipoEmenda(TipoEmenda.getTipoEmendaById(tipoEmenda));
			emenda.setAutor(autorService.getAutor(idAutor));
			emenda.setOrgaoConcedente(orgaoConcedenteService.getOrgaoConcedente(idOrgaoConced));
			emenda.setPrograma(programaService.getPrograma(idPrograma));
			emenda.setAcao(acaoService.getAcao(idAcao));		
			
			/** RECEBE ARRAY DO ENUM E ADICIONA A CLASSE UMA STRING CONTENDO OS IDS **/
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
				/** SETA NO GND E NAO NA LISTA GNDS**/
				/** GNDS SERA UM ATRIBUTO TRANSIENT, QUE NAO APARECERA NO BANCO **/
				/** NA HORA QUE A CLASSE É BUSCADA, GNDS SERÁ SETADA DE ACORDO COM A STRING EM GND **/
				emenda.setGnd(gndEmenda);
			}
			
			/** RECEBE ARRAY DO ENUM E ADICIONA A CLASSE UMA STRING CONTENDO OS IDS **/
			if (modalidade.length > 0) {
				String modAppEmenda = "";			
				if (modalidade.length == 1) {
					modAppEmenda = modalidade[0].toString();
				} else if (modalidade.length > 1) {			
					for (Integer i : modalidade) {
						if (modAppEmenda.isEmpty()) {
							modAppEmenda = i.toString();
						} else {
							modAppEmenda = modAppEmenda + "_" + i.toString();						
						}
					}			
				}
				/** SETA EM MODALIDADE DE APLICACAO E NAO NA LISTA MODALIDADES **/
				/** MODALIDADES SERA UM ATRIBUTO TRANSIENT, QUE NAO APARECERA NO BANCO **/
				/** NA HORA QUE A CLASSE É BUSCADA, MODALIDADES SERÁ SETADA DE ACORDO COM A STRING EM MODALIDADE DE APLICACAO **/
				emenda.setModalidadeDeAplicacao(modAppEmenda);
			}
			
			/** SALVA PREVIAMENTE **/
			emendaService.save(emenda);	
			
			execucao = "SALVANDO";
			
			logger.info("## " + execucao + " EMENDA ID: " + emenda.getId() + " ##");		
			return "redirect:novo";
		}		
	}
	
	/** EDITAR E SALVAR EMENDA **/
	@RequestMapping(value = "editar", method = RequestMethod.POST)
	public String editar(
			RedirectAttributes redirectAttrs,
			@RequestParam Integer id,
			@RequestParam Integer numero,
			@RequestParam Integer ano,
			@RequestParam String valor, 
			@RequestParam Integer[] gnd,
			@RequestParam Integer[] modalidade,
			@RequestParam Integer tipoEmenda,
			@RequestParam String funcional,
			@RequestParam Integer idAutor,
			@RequestParam Integer idOrgaoConced,
			@RequestParam Integer idPrograma,
			@RequestParam Integer idAcao) {
		
		Emenda emenda = emendaService.getEmenda(id);
		
		/** VERIFICA SE OS DADOS SAO VALIDOS, CASO NAO SEJAM, RETORNA ERRO **/
		if (numero == null 	   || ano == null    	 || valor.isEmpty()    ||
			gnd[0] == 0        || modalidade[0] == 0 ||	tipoEmenda == 0    ||
			funcional.isEmpty()|| idAutor == 0   	 || idOrgaoConced == 0 ||
			idPrograma == 0    || idAcao == 0) {
			
			redirectAttrs.addFlashAttribute("error", "true");
			
			logger.info("## DADOS NÃO VÁLIDOS ##");		
			return "redirect:novo";
			
		/** CASO NAO OCORRA ERRO NA VALIDACAO, EXECUTA O RESTO DO CODIGO PARA SALVAR **/
		} else {
			
			String execucao = "";					
			
			/** SETA ATRIBUTOS **/
			emenda.setNumero(numero);
			emenda.setAno(ano);
			emenda.setFuncionalProgramatica(funcional);
			emenda.setValor(new BigDecimal(conversor.mascaraApenasNumero(valor)));
			emenda.setTipoEmenda(TipoEmenda.getTipoEmendaById(tipoEmenda));
			emenda.setAutor(autorService.getAutor(idAutor));
			emenda.setOrgaoConcedente(orgaoConcedenteService.getOrgaoConcedente(idOrgaoConced));
			emenda.setPrograma(programaService.getPrograma(idPrograma));
			emenda.setAcao(acaoService.getAcao(idAcao));		
			
			/** RECEBE ARRAY DO ENUM E ADICIONA A CLASSE UMA STRING CONTENDO OS IDS **/
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
				/** SETA NO GND E NAO NA LISTA GNDS**/
				/** GNDS SERA UM ATRIBUTO TRANSIENT, QUE NAO APARECERA NO BANCO **/
				/** NA HORA QUE A CLASSE É BUSCADA, GNDS SERÁ SETADA DE ACORDO COM A STRING EM GND **/
				emenda.setGnd(gndEmenda);
			}
			
			/** RECEBE ARRAY DO ENUM E ADICIONA A CLASSE UMA STRING CONTENDO OS IDS **/
			if (modalidade.length > 0) {
				String modAppEmenda = "";			
				if (modalidade.length == 1) {
					modAppEmenda = modalidade[0].toString();
				} else if (modalidade.length > 1) {			
					for (Integer i : modalidade) {
						if (modAppEmenda.isEmpty()) {
							modAppEmenda = i.toString();
						} else {
							modAppEmenda = modAppEmenda + "_" + i.toString();						
						}
					}			
				}
				/** SETA EM MODALIDADE DE APLICACAO E NAO NA LISTA MODALIDADES **/
				/** MODALIDADES SERA UM ATRIBUTO TRANSIENT, QUE NAO APARECERA NO BANCO **/
				/** NA HORA QUE A CLASSE É BUSCADA, MODALIDADES SERÁ SETADA DE ACORDO COM A STRING EM MODALIDADE DE APLICACAO **/
				emenda.setModalidadeDeAplicacao(modAppEmenda);
			}
			
			/** SALVA PREVIAMENTE **/
			emendaService.save(emenda);	
			
			execucao = "SALVANDO";
			
			logger.info("## " + execucao + " EMENDA ID: " + emenda.getId() + " ##");		
			return "redirect:/protected/emenda/visualizar/" + emenda.getId();
		}
	}	
	
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
	
	/** VER EMENDA **/
	@RequestMapping(value = "visualizar/{id}", method = RequestMethod.GET)
	public String selecionar(@PathVariable Integer id, Model model) {
		
		Emenda emenda = emendaService.getEmenda(id);
		
		model.addAttribute("emenda", emenda);		
		
		/** LISTAS AUXILIARES **/
		model.addAttribute("indicacoes", indicacaoEService.findByEmenda(emenda));
		
		return "ver-emenda";
	}	
	
	/** IR PARA PAGINA DE EDICAO **/
	@RequestMapping(value = "edicao/{id}", method = RequestMethod.GET)
	public String irParaEditar(@PathVariable Integer id, Model model) {
		
		Emenda emenda = emendaService.getEmenda(id);
		
		model.addAttribute("emenda", emenda);
		
		/** LISTAS AUXILIARES **/
		model.addAttribute("modalidadeDeAplicacao", Arrays.asList(ModalidadeDeAplicacao.values()));
		model.addAttribute("gnd", Arrays.asList(GND.values()));
		model.addAttribute("tipoEmenda", Arrays.asList(TipoEmenda.values()));
		model.addAttribute("programas", programaService.listAll());
		model.addAttribute("autores", autorService.listAll());
		model.addAttribute("orgaos", orgaoConcedenteService.listAll());
		
		return "edicao-emenda";		
	}
	
	/** REMOVER EMENDA **/
	@RequestMapping(value = "remover", method = RequestMethod.POST)
	public void remover(Integer id, HttpServletResponse response) {

		Emenda emenda = emendaService.getEmenda(id);		
	
		/** REMOVE A EMENDA APOS REMOVER TODAS AS RELAÇÕES **/
		emendaService.delete(emenda);
		logger.info("## REMOVENDO EMENDA ID: " + emenda.getId() + " ##");		

		response.setStatus(200);
	}	
}
