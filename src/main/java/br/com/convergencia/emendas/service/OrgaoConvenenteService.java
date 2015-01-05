package br.com.convergencia.emendas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.convergencia.emendas.model.OrgaoConvenente;
import br.com.convergencia.emendas.repository.OrgaoConvenenteRepository;

@Service
public class OrgaoConvenenteService {

	@Autowired
	private OrgaoConvenenteRepository orgaoConvenenteRepository;

	@Transactional
	public void save(OrgaoConvenente orgaoConvenente) {
		orgaoConvenenteRepository.save(orgaoConvenente);
	}

	@Transactional
	public void update(OrgaoConvenente orgaoConvenente) {
		orgaoConvenenteRepository.save(orgaoConvenente);
	}

	@Transactional
	public void delete(OrgaoConvenente orgaoConvenente) {
		orgaoConvenenteRepository.delete(orgaoConvenente);
	}

	@Transactional
	public List<OrgaoConvenente> listAll() {
		return (List<OrgaoConvenente>) orgaoConvenenteRepository.findAll();
	}

	@Transactional
	public OrgaoConvenente getOrgaoConvenente(Integer id) {
		return orgaoConvenenteRepository.findOne(id);
	}
}
