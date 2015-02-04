package br.com.convergencia.emendas.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import br.com.convergencia.emendas.model.Empenho;
import br.com.convergencia.emendas.model.Pagamento;

public interface PagamentoRepository extends JpaRepository<Pagamento, Integer> {
	
	public List<Pagamento> findByEmpenho(Empenho empenho);
	
	@Modifying
    @Query("DELETE FROM Pagamento WHERE id = ?1")
    public void delete(Integer id);
	
}
