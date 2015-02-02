package br.com.convergencia.emendas.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import br.com.convergencia.emendas.model.Acao;
import br.com.convergencia.emendas.model.Programa;

public interface AcaoRepository extends CrudRepository<Acao, Integer> {
	
	@Modifying
    @Query("DELETE FROM Acao WHERE id = ?1")
    public void delete(Integer id);
	
	public List<Acao> findByPrograma(Programa programa);
	
}
