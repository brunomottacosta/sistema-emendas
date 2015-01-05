package br.com.convergencia.emendas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.convergencia.emendas.model.IndicacaoEmenda;
import br.com.convergencia.emendas.repository.IndicacaoEmendaRepository;

@Service
public class IndicacaoEmendaService {
	
	@Autowired private IndicacaoEmendaRepository indicacaoEmendaRepository;
	
	@Transactional
	public void save(IndicacaoEmenda indicacaoEmenda) {
		indicacaoEmendaRepository.save(indicacaoEmenda);
	}
	
	@Transactional
	public void update(IndicacaoEmenda indicacaoEmenda) {
		indicacaoEmendaRepository.save(indicacaoEmenda);
	}
	
	@Transactional
	public void delete(IndicacaoEmenda indicacaoEmenda) {
		indicacaoEmendaRepository.delete(indicacaoEmenda);
	}
	
	@Transactional
	public List<IndicacaoEmenda> listAll() {
		return (List<IndicacaoEmenda>) indicacaoEmendaRepository.findAll();
	}
	
	@Transactional
	public IndicacaoEmenda getIndicacaoEmenda(Integer id) {
		return indicacaoEmendaRepository.findOne(id);
	}
}
