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
import br.com.convergencia.emendas.model.Acao;
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
		model.addAttribute("programas", programaService.listAll());
		model.addAttribute("autores", autorService.listAll());
		model.addAttribute("orgaos", orgaoConcedenteService.listAll());
				
		return "cadastro-emenda";
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
			@RequestParam Integer idOrgaoConced,
			@RequestParam Integer idPrograma,
			@RequestParam Integer[] idAcoes) {
		
		Emenda emenda = new Emenda();
		
		String execucao = "";					
		
		/** seta atributos normais do objeto **/
		emenda.setNumero(numero);
		emenda.setAno(ano);
		emenda.setFuncionalProgramatica(funcProg);
		emenda.setValor(new BigDecimal(conversor.mascaraApenasNumero(valor)));
		emenda.setModalidadeDeAplicacao(ModalidadeDeAplicacao.getModalidadeDeAplicacaoById(modApp));
		emenda.setGnd(GND.getGNDById(gnd));
		emenda.setTipoEmenda(TipoEmenda.getTipoEmendaById(tipoEmenda));
		emenda.setAutor(autorService.getAutor(idAutor));
		emenda.setOrgaoConcedente(orgaoConcedenteService.getOrgaoConcedente(idOrgaoConced));
		emenda.setPrograma(programaService.getPrograma(idPrograma));
		
		/** salva o objeto previamente **/
		emendaService.save(emenda);	
		
		/** para relacao n x m, confere o tamanho do array, **/
		/** valida e adiciona a lista de objetos filhos no pai **/
		if (idAcoes.length != 0) {
			List<Integer> ids = new ArrayList<Integer>(Arrays.asList(idAcoes));
							
			for (Integer i : ids) {					
				Acao a = acaoService.getAcao(i);					
				a.setEmenda(emenda);
				try {
					acaoService.save(a);					
				} catch (Exception e) {
					emendaService.delete(emenda);
				}
			}								
		}			
		
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
		model.addAttribute("objetosDaEmenda", objetoService.findByAllAcoes(acaoService.findByEmendaId(id)));
		model.addAttribute("acoesDaEmenda", acaoService.findByEmendaId(id));
		
		return "ver-emenda";
	}
	
	@RequestMapping(value = "lista", method = RequestMethod.GET)
	public String lista(Model model) {
		model.addAttribute("emendas", emendaService.listAll());
		
		return "lista-emenda";
	}
	
	/** REMOVER EMENDA ATRAVEZ DA LISTA AUXILIAR **/
	@RequestMapping(value = "remover", method = RequestMethod.POST)
	public void remover(Integer id, HttpServletResponse response) {
		
		Emenda emenda = emendaService.getEmenda(id);
		List<Acao> acoesByEmenda = acaoService.findByEmendaId(id);
		
		if (!acoesByEmenda.isEmpty()) {
			int n = acoesByEmenda.size();
			try {
				for (Acao a : acoesByEmenda) {
					a.setEmenda(null);				
					acaoService.save(a);				
				}				
			} catch (Exception e) {
				logger.debug("## ERRO AO DELETAR EMENDA ##");
			}
			logger.debug("## ACOES DA EMENDA REMOVIDAS... TOTAL DE " + n + " ACOES ##");
		}
		
		try {
			emendaService.delete(emenda);			
		} catch (Exception e) {
			logger.debug("## ERRO AO REMOVER EMENDA ID: " + emenda.getId() + " ##");
		}
		
		logger.info("## REMOVENDO EMENDA ID: " + emenda.getId() + " ##");		
		response.setStatus(200);
	}	
}
