package br.com.convergencia.emendas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import br.com.convergencia.emendas.model.Acao;
import br.com.convergencia.emendas.repository.AcaoRepository;

public class AcaoService {
	
	@Autowired private AcaoRepository acaoRepository;
	
	@Transactional
	public void save(Acao acao) {
		acaoRepository.save(acao);
	}
	
	@Transactional
	public void update(Acao acao) {
		acaoRepository.save(acao);
	}
	
	@Transactional
	public void delete(Acao acao) {
		acaoRepository.delete(acao);
	}
	
	@Transactional
	public List<Acao> listAll() {
		return (List<Acao>) acaoRepository.findAll();
	}
	
	@Transactional
	public Acao getAcao(Integer id) {
		return acaoRepository.findOne(id);
	}
}
