package br.com.convergencia.emendas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.convergencia.emendas.model.Pagamento;
import br.com.convergencia.emendas.repository.PagamentoRepository;

@Service
public class PagamentoService {
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	// Injeções de Dependencia //
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	
	@Autowired private PagamentoRepository pagamentoRepository;
	
	// ~~~~~~~~~~~~~~~~~~~~//
	//   Métodos Mapeados  //
	// ~~~~~~~~~~~~~~~~~~~~//
	
	@Transactional
	public void save(Pagamento pagamento) {
		pagamentoRepository.save(pagamento);
	}
	
	@Transactional
	public void update(Pagamento pagamento) {
		pagamentoRepository.save(pagamento);
	}
	
	@Transactional
	public void delete(Pagamento pagamento) {
		pagamentoRepository.delete(pagamento.getId());
	}
	
	@Transactional
	public List<Pagamento> listAll() {
		return (List<Pagamento>) pagamentoRepository.findAll();
	}
	
	@Transactional
	public Pagamento getPagamento(Integer id) {
		return pagamentoRepository.findOne(id);
	}
	
}
