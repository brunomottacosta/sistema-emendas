package br.com.convergencia.emendas.repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import br.com.convergencia.emendas.model.Acao;

public interface AcaoRepository extends CrudRepository<Acao, Integer> {
	
	@Modifying
    @Query("DELETE FROM Acao WHERE id = ?1")
    public void delete(Integer id);
	
}
