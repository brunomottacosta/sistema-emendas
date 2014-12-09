package br.com.convergencia.emendas.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.com.convergencia.emendas.model.Emenda;

public interface EmendaRepository extends JpaRepository<Emenda, Integer> {
	
	@Query("select e from Emenda e where e.numero = :numero")
	public List<Emenda> buscar(@Param("numero") Integer numero);
}
