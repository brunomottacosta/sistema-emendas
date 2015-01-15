package br.com.convergencia.emendas.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.convergencia.emendas.model.Acao;
import br.com.convergencia.emendas.repository.AcaoRepository;

@Service
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
		acaoRepository.delete(acao.getId());
	}
	
	@Transactional
	public List<Acao> listAll() {
		return (List<Acao>) acaoRepository.findAll();
	}
	
	@Transactional
	public Acao getAcao(Integer id) {
		return acaoRepository.findOne(id);
	}
	
	@Transactional
	public List<Acao> findByPrograma(Integer programaId) {
		
		List<Acao> acoes = listAll();
		List<Acao> acoesByPrograma = new ArrayList<Acao>();
		
		if (programaId != 0 && programaId != null) {
			acoesByPrograma = acoes.stream().filter(a -> a.getPrograma().getId() == programaId).collect(Collectors.toList());			
		}		
		
		return acoesByPrograma;
	}
	
	
}
