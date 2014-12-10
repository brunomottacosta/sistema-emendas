package br.com.convergencia.emendas.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.convergencia.emendas.model.Emenda;
import br.com.convergencia.emendas.repository.EmendaRepository;

@Service
public class EmendaService {
	
	private static final Logger logger = LoggerFactory.getLogger(EmendaService.class);	
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	// Injeções de Dependencia //
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	
	@Autowired private EmendaRepository emendaRepository;
	
	// ~~~~~~~~~~~~~~~~~~~~//
	//   Métodos Mapeados  //
	// ~~~~~~~~~~~~~~~~~~~~//
	
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
	public List<Emenda> listByFiltro(Emenda filtro) {
		
		logger.info("## EXECUTANDO BUSCA AVANCADA ##");
		
		List<Emenda> lista = emendaRepository.findAll();
		List<Emenda> interno = new ArrayList<Emenda>();
		
		for (Emenda e : lista) {
			
			if (filtro.getAno() != 0) {
				String anoFiltro = filtro.getAno().toString();
				String anoObj = e.getAno().toString();
				if (!anoObj.equals(anoFiltro)) {
					interno.add(e);
				}
			} 
			
			if (filtro.getNumero() != 0) {
				String numFiltro = filtro.getNumero().toString();
				String numObj = e.getNumero().toString();
				if (!numObj.contains(numFiltro)) {
					interno.add(e);
				}				
			} 
			
			if (filtro.getModalidadeDeAplicacao().getId() != 0) {
				if (filtro.getModalidadeDeAplicacao() != e.getModalidadeDeAplicacao()) {
					interno.add(e);
				}
			}
			
			if (filtro.getGnd().getId() != 0) {
				if (filtro.getGnd() != e.getGnd()) {
					interno.add(e);
				}
			}
		}
		
		lista.removeAll(interno);
		
		System.out.println(interno.size());
		
		return lista;
	}
}
