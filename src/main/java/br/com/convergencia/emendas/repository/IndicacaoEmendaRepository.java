package br.com.convergencia.emendas.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import br.com.convergencia.emendas.model.Emenda;
import br.com.convergencia.emendas.model.IndicacaoEmenda;
import br.com.convergencia.emendas.model.Objeto;

public interface IndicacaoEmendaRepository extends CrudRepository<IndicacaoEmenda, Integer> {
	
	List<IndicacaoEmenda> findByEmenda(Emenda emenda);
	
	List<IndicacaoEmenda> findByObjeto(Objeto objeto);
	
	@Modifying
    @Query("DELETE FROM IndicacaoEmenda WHERE id = ?1")
    public void delete(Integer id);
	
}
