package br.com.convergencia.emendas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import br.com.convergencia.emendas.model.Programa;
import br.com.convergencia.emendas.repository.ProgramaRepository;

public class ProgramaService {
	
	@Autowired private ProgramaRepository programaRepository;
	
	@Transactional
	public void save(Programa programa) {
		programaRepository.save(programa);
	}
	
	@Transactional
	public void update(Programa programa) {
		programaRepository.save(programa);
	}
	
	@Transactional
	public void delete(Programa programa) {
		programaRepository.delete(programa);
	}
	
	@Transactional
	public List<Programa> listAll() {
		return (List<Programa>) programaRepository.findAll();
	}
	
	@Transactional
	public Programa getPrograma(Integer id) {
		return programaRepository.findOne(id);
	}
}
