package br.com.convergencia.emendas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.convergencia.emendas.model.Empenho;
import br.com.convergencia.emendas.model.IndicacaoEmenda;
import br.com.convergencia.emendas.repository.EmpenhoRepository;

@Service
public class EmpenhoService {	
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	// Injeções de Dependencia //
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	
	@Autowired private EmpenhoRepository empenhoRepository;
	
	// ~~~~~~~~~~~~~~~~~~~~//
	//   Métodos Mapeados  //
	// ~~~~~~~~~~~~~~~~~~~~//
	
	@Transactional
	public void save(Empenho empenho) {
		empenhoRepository.save(empenho);
	}
	
	@Transactional
	public void update(Empenho empenho) {
		empenhoRepository.save(empenho);
	}
	
	@Transactional
	public void delete(Empenho empenho) {
		empenhoRepository.delete(empenho.getId());
	}
	
	@Transactional
	public List<Empenho> listAll() {
		return (List<Empenho>) empenhoRepository.findAll();
	}
	
	@Transactional
	public Empenho getEmpenho(Integer id) {
		return empenhoRepository.findOne(id);
	}
	
	@Transactional
	public List<Empenho> listByIndicacao(IndicacaoEmenda indicacao) {
		return empenhoRepository.findByIndicacaoEmenda(indicacao);
	}
	
}
