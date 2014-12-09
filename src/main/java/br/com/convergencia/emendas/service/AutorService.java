package br.com.convergencia.emendas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.convergencia.emendas.model.Autor;
import br.com.convergencia.emendas.repository.AutorRepository;

@Service
public class AutorService {
	
	@Autowired private AutorRepository autorRepository;
	
	@Transactional
	public void save(Autor autor) {
		autorRepository.save(autor);
	}
	
	@Transactional
	public void update(Autor autor) {
		autorRepository.save(autor);
	}
	
	@Transactional
	public void delete(Autor autor) {
		autorRepository.delete(autor);
	}
	
	@Transactional
	public List<Autor> listAll() {
		return (List<Autor>) autorRepository.findAll();
	}
	
	@Transactional
	public Autor getAutor(Integer id) {
		return autorRepository.findOne(id);
	}
}
