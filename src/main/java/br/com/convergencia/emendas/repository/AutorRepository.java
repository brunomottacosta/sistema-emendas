package br.com.convergencia.emendas.repository;

import org.springframework.data.repository.CrudRepository;

import br.com.convergencia.emendas.model.Autor;

public interface AutorRepository extends CrudRepository<Autor, Integer> {

}
