package br.com.convergencia.emendas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.convergencia.emendas.model.Emenda;
import br.com.convergencia.emendas.repository.EmendaRepository;

@Service
public class EmendaService {
	
	@Autowired private EmendaRepository emendaRepository;
	
	@Transactional
	public void save(Emenda emenda) {
		emendaRepository.save(emenda);
	}
	
	@Transactional
	public void update(Emenda emenda) {
		emendaRepository.save(emenda);
	}
	
	@Transactional
	public void delete(Emenda emenda) {
		emendaRepository.delete(emenda);
	}
	
	@Transactional
	public List<Emenda> listAll() {
		return (List<Emenda>) emendaRepository.findAll();
	}
	
	@Transactional
	public Emenda getEmenda(Integer id) {
		return emendaRepository.findOne(id);
	}
	
	/** BUSCAS AVANCADAS **/
	@Transactional
	public List<Emenda> listByFiltro(Emenda emenda) {
		
		List<Emenda> lista = emendaRepository.buscar(emenda.getNumero());
		
		return lista;
	}
}
