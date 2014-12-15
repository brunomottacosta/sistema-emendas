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

import br.com.convergencia.emendas.model.Produto;
import br.com.convergencia.emendas.service.AcaoService;
import br.com.convergencia.emendas.service.ProdutoService;

@Controller
@RequestMapping(value = "produto/")
public class ProdutoController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProdutoController.class);
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	// Injeções de Dependencia //
	// ~~~~~~~~~~~~~~~~~~~~~~~~//

	@Autowired private ProdutoService produtoService;
	@Autowired private AcaoService acaoService;
		
	// ~~~~~~~~~~~~~~~~~~~~//
	//   Métodos Mapeados  //
	// ~~~~~~~~~~~~~~~~~~~~//
	
	@RequestMapping(value = "lista", method = RequestMethod.GET)
	public String listAll(Model model) {
		
		model.addAttribute("produtos", produtoService.listAll());
		model.addAttribute("acoes", acaoService.listAll());
		
		return "lista-produto";
	}
	
	@RequestMapping(value = "salvar", method = RequestMethod.POST)
	public String salvar(
			@RequestParam String nome,
			@RequestParam Integer idAcao) {
		
		Produto produto = new Produto();
		
		produto.setNome(nome);
		produto.setAcao(acaoService.getAcao(idAcao));
		
		produtoService.save(produto);
		
		logger.info("## SALVANDO NOVO PRODUTO ##");
		return "redirect:lista";
	}
	
	@RequestMapping(value = "editar", method = RequestMethod.POST)
	public String editar(
			@RequestParam String nome, 
			@RequestParam Integer id,
			@RequestParam Integer idAcao) {
		
		Produto produto = produtoService.getProduto(id);
		
		produto.setNome(nome);
		produto.setAcao(acaoService.getAcao(idAcao));
		
		produtoService.update(produto);
		
		logger.info("## EDITANDO PRODUTO ID: " + produto.getId() + " ##");		
		return "redirect:lista";
	}
	
	@RequestMapping(value = "remover", method = RequestMethod.POST)
	public void remover(Integer id, HttpServletResponse response) {
		Produto produto =  produtoService.getProduto(id);
		produtoService.delete(produto);
		
		logger.info("## REMOVENDO PRODUTO ID: " + produto.getId() + " ##");
		response.setStatus(200);
	}	
}
