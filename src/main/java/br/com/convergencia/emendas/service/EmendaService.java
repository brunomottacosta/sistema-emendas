package br.com.convergencia.emendas.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
	public List<Emenda> listByFiltro(Map<String, String> filtros) {
		
		logger.info("## EXECUTANDO BUSCA AVANCADA ##");
		
		List<Emenda> lista = emendaRepository.findAll();
		List<Emenda> exclusao = new ArrayList<Emenda>();
		
		for (Emenda e : lista) {
			
			if (!filtros.get("ano").equals("") && e.getAno() != null) {
				if (!filtros.get("ano").equals(e.getAno().toString())) {
					exclusao.add(e);
				}
			} 
			
			if (!filtros.get("numero").equals("") && e.getNumero() != null) {
				if (!e.getNumero().toString().contains(filtros.get("numero"))) {
					exclusao.add(e);
				}				
			} 
			
			if (!filtros.get("funcional").equals("") && !e.getFuncionalProgramatica().isEmpty()) {			
				if (!e.getFuncionalProgramatica().contains(filtros.get("funcional"))) {
					exclusao.add(e);
				}
			}
			
			if (!filtros.get("modalidade").equals("0")) {
				if (!filtros.get("modalidade").equals(e.getModalidadeDeAplicacao().getId().toString())) {
					exclusao.add(e);
				}
			}
			
			if (!filtros.get("gnd").equals("0")) {
				if (!filtros.get("gnd").equals(e.getGnd().getId().toString())) {
					exclusao.add(e);
				}
			}
			
			if (!filtros.get("tipo").equals("0")) {
				if (!filtros.get("tipo").equals(e.getTipoEmenda().getId().toString())) {
					exclusao.add(e);
				}
			}
			
			if (!filtros.get("autor").equals("0") && e.getAutor() != null) {
				if (Integer.parseInt(filtros.get("autor")) != e.getAutor().getId()) {
					exclusao.add(e);
				}
			}
			
			if (!filtros.get("orgao").equals("0") && e.getOrgaoConcedente() != null) {
				if (Integer.parseInt(filtros.get("orgao")) != e.getOrgaoConcedente().getId()) {
					exclusao.add(e);
				}
			}
			
			if (!filtros.get("programa").equals("0") && e.getPrograma() != null) {
				if (Integer.parseInt(filtros.get("programa")) != e.getPrograma().getId()) {
					exclusao.add(e);
				}
			}
		}
		
		lista.removeAll(exclusao);
		
		return lista;
	}
}
