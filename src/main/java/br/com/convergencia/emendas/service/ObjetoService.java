package br.com.convergencia.emendas.service;

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
}
