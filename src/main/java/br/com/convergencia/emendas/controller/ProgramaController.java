package br.com.convergencia.emendas.controller;

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

import br.com.convergencia.emendas.model.Acao;
import br.com.convergencia.emendas.model.Programa;
import br.com.convergencia.emendas.service.AcaoService;
import br.com.convergencia.emendas.service.ProgramaService;

@Controller
@RequestMapping(value = "programa/")
public class ProgramaController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProgramaController.class);
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	// Injeções de Dependencia //
	// ~~~~~~~~~~~~~~~~~~~~~~~~//

	@Autowired private ProgramaService programaService;
	@Autowired private AcaoService acaoService;
		
	// ~~~~~~~~~~~~~~~~~~~~//
	//   Métodos Mapeados  //
	// ~~~~~~~~~~~~~~~~~~~~//
	
	@RequestMapping(value = "lista", method = RequestMethod.GET)
	public String listAll(Model model) {
		model.addAttribute("programas", programaService.listAll());
		
		return "lista-programa";
	}
	
	@RequestMapping(value = "novo")
	public String novo() {
		return "programa-novo";
	}
	
	@RequestMapping(value = "edicao/{id}", method = RequestMethod.GET)
	public String visualizar(@PathVariable Integer id, Model model) {
		
		Programa p = programaService.getPrograma(id);
		
		model.addAttribute("programa", p);
		
		return "programa-editar";
	}
	
	@RequestMapping(value = "salvar", method = RequestMethod.POST)
	public String salvar(
			@RequestParam String nome,
			@RequestParam String[] acoes) {
		
		Programa programa = new Programa();
		programa.setNome(nome);
		
		programaService.save(programa);
		
		/** para relacao n x m, confere o tamanho do array, **/
		/** valida e adiciona a lista de objetos filhos no pai **/
		if (acoes.length != 0) {
			List<String> acs = new ArrayList<String>(Arrays.asList(acoes));
							
			for (String s : acs) {					
				Acao a = new Acao();		
				a.setNome(s);
				a.setPrograma(programa);
				
				try {
					acaoService.save(a);					
				} catch (Exception e) {
					programaService.delete(programa);
				}
			}								
		}	
		
		logger.info("## SALVANDO NOVO PROGRAMA ##");
		return "redirect:lista";
	}
	
	@RequestMapping(value = "editar", method = RequestMethod.POST)
	public String editar(
			@RequestParam Integer id,
			@RequestParam String nome,
			@RequestParam String[] acoes) {
		
		Programa programa = programaService.getPrograma(id);
		programa.setNome(nome);
		
		programaService.save(programa);
		
		/** para relacao n x m, confere o tamanho do array, **/
		/** valida e adiciona a lista de objetos filhos no pai **/
		if (acoes.length != 0) {
			List<String> acs = new ArrayList<String>(Arrays.asList(acoes));
							
			for (String s : acs) {
				Acao a = new Acao();
				
				/** string passada com nome e id, nesta ordem, separada por "_" **/
				String split[] = s.split("_");
				
				if (!split[1].equals("0")) {
					a = acaoService.getAcao(Integer.parseInt(split[1]));		
					a.setNome(split[0]);
					a.setPrograma(programa);					
				} else {					
					a.setNome(split[0]);
					a.setPrograma(programa);
				}				
				
				try {
					acaoService.save(a);					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}								
		}	
		
		
		logger.info("## EDITANDO PROGRAMA ID: " + programa.getId() + " ##");		
		return "redirect:lista";
	}
	
	@RequestMapping(value = "remover", method = RequestMethod.POST)
	public void remover(Integer id, HttpServletResponse response) {
		Programa programa =  programaService.getPrograma(id);
		programaService.delete(programa);
		
		logger.info("## REMOVENDO PROGRAMA ID: " + programa.getId() + " ##");
		response.setStatus(200);
	}	
}
