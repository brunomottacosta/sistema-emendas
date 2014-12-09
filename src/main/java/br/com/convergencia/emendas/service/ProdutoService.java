package br.com.convergencia.emendas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import br.com.convergencia.emendas.model.Produto;
import br.com.convergencia.emendas.repository.ProdutoRepository;

public class ProdutoService {
	
	@Autowired private ProdutoRepository produtoRepository;
	
	@Transactional
	public void save(Produto produto) {
		produtoRepository.save(produto);
	}
	
	@Transactional
	public void update(Produto produto) {
		produtoRepository.save(produto);
	}
	
	@Transactional
	public void delete(Produto produto) {
		produtoRepository.delete(produto);
	}
	
	@Transactional
	public List<Produto> listAll() {
		return (List<Produto>) produtoRepository.findAll();
	}
	
	@Transactional
	public Produto getProduto(Integer id) {
		return produtoRepository.findOne(id);
	}
}
