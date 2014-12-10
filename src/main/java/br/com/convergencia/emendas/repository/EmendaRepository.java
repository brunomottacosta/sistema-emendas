package br.com.convergencia.emendas.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.convergencia.emendas.model.Emenda;

public interface EmendaRepository extends JpaRepository<Emenda, Integer> {
	

}
