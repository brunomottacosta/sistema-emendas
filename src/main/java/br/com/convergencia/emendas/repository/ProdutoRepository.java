package br.com.convergencia.emendas.repository;

import org.springframework.data.repository.CrudRepository;

import br.com.convergencia.emendas.model.Produto;

public interface ProdutoRepository extends CrudRepository<Produto, Integer> {

}
