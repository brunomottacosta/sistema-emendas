package br.com.convergencia.emendas.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import br.com.convergencia.emendas.model.Empenho;
import br.com.convergencia.emendas.model.IndicacaoEmenda;

public interface EmpenhoRepository extends JpaRepository<Empenho, Integer> {
	
	public List<Empenho> findByIndicacao(IndicacaoEmenda indicacao);
	
	@Modifying
    @Query("DELETE FROM Empenho WHERE id = ?1")
    public void delete(Integer id);
	
}
