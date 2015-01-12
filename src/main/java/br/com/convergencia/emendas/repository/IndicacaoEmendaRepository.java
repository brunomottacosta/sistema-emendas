package br.com.convergencia.emendas.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.convergencia.emendas.model.Emenda;
import br.com.convergencia.emendas.model.IndicacaoEmenda;
import br.com.convergencia.emendas.model.Objeto;

public interface IndicacaoEmendaRepository extends JpaRepository<IndicacaoEmenda, Integer> {
	
	List<IndicacaoEmenda> findByEmenda(Emenda emenda);
	
	List<IndicacaoEmenda> findByObjeto(Objeto objeto);
	
}
