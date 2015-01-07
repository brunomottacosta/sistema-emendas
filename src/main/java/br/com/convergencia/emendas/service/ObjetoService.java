package br.com.convergencia.emendas.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.convergencia.emendas.model.Objeto;
import br.com.convergencia.emendas.repository.ObjetoRepository;

@Service
public class ObjetoService {
	
	@Autowired private ObjetoRepository objetoRepository;
	
	@Transactional
	public void save(Objeto objeto) {
		objetoRepository.save(objeto);
	}
	
	@Transactional
	public void update(Objeto objeto) {
		objetoRepository.save(objeto);
	}
	
	@Transactional
	public void delete(Objeto objeto) {
		objetoRepository.delete(objeto);
	}
	
	@Transactional
	public List<Objeto> listAll() {
		return (List<Objeto>) objetoRepository.findAll();
	}
	
	@Transactional
	public Objeto getObjeto(Integer id) {
		return objetoRepository.findOne(id);
	}
	
	@Transactional
	public List<Objeto> findByEmenda(Integer emendaId) {
		
		List<Objeto> objetos = listAll();
		List<Objeto> objetosByEmenda = new ArrayList<Objeto>();
		
		if (emendaId != 0 && emendaId != null) {
			for (Objeto obj : objetos) {
				if (obj.getAcao().getId() == emendaId) {
					objetosByEmenda.add(obj);
				}
			}
		}
		
		return objetosByEmenda;
	}
	
	@Transactional
	public List<Objeto> findByAcao(Integer acaoId) {
		
		List<Objeto> objetos = listAll();
		List<Objeto> objetosByAcao = new ArrayList<Objeto>();
		
		if (acaoId != 0 && acaoId != null) {
			for (Objeto obj : objetos) {
				if (obj.getAcao().getId() == acaoId) {
					objetosByAcao.add(obj);
				}
			}
		}
		
		return objetosByAcao;
	}	
}
