package br.com.convergencia.emendas.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.convergencia.emendas.model.Emenda;
import br.com.convergencia.emendas.model.IndicacaoEmenda;

public interface IndicacaoEmendaRepository extends JpaRepository<IndicacaoEmenda, Integer> {
	
	List<IndicacaoEmenda> findByEmenda(Emenda emenda);
	
}
