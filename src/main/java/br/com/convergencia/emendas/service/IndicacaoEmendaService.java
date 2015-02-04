package br.com.convergencia.emendas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.convergencia.emendas.model.Emenda;
import br.com.convergencia.emendas.model.IndicacaoEmenda;
import br.com.convergencia.emendas.model.Objeto;
import br.com.convergencia.emendas.repository.IndicacaoEmendaRepository;

@Service
public class IndicacaoEmendaService {
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	// Injeções de Dependencia //
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	
	@Autowired private IndicacaoEmendaRepository indicacaoERepository;
	
	// ~~~~~~~~~~~~~~~~~~~~//
	//   Métodos Mapeados  //
	// ~~~~~~~~~~~~~~~~~~~~//
	
	@Transactional
	public void save(IndicacaoEmenda indicacaoEmenda) {
		indicacaoERepository.save(indicacaoEmenda);
	}
	
	@Transactional
	public void update(IndicacaoEmenda indicacaoEmenda) {
		indicacaoERepository.save(indicacaoEmenda);
	}
	
	@Transactional
	public void delete(IndicacaoEmenda indicacaoEmenda) {
		indicacaoERepository.delete(indicacaoEmenda.getId());
	}
	
	@Transactional
	public IndicacaoEmenda getIndicacaoEmenda(Integer id) {
		return indicacaoERepository.findOne(id);
	}
	
	@Transactional
	public List<IndicacaoEmenda> listAll() {
		return (List<IndicacaoEmenda>) indicacaoERepository.findAll();
	}
		
	@Transactional
	public List<IndicacaoEmenda> findByEmenda(Emenda emenda) {
		return indicacaoERepository.findByEmenda(emenda);
	}
	
	@Transactional
	public List<IndicacaoEmenda> findByObjeto(Objeto objeto) {
		return indicacaoERepository.findByObjeto(objeto);
	}
}
