package br.com.convergencia.emendas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import br.com.convergencia.emendas.model.OrgaoConcedente;
import br.com.convergencia.emendas.repository.OrgaoConcedenteRepository;

public class OrgaoConcedenteService {

	@Autowired
	private OrgaoConcedenteRepository orgaoConcedenteRepository;

	@Transactional
	public void save(OrgaoConcedente orgaoConcedente) {
		orgaoConcedenteRepository.save(orgaoConcedente);
	}

	@Transactional
	public void update(OrgaoConcedente orgaoConcedente) {
		orgaoConcedenteRepository.save(orgaoConcedente);
	}

	@Transactional
	public void delete(OrgaoConcedente orgaoConcedente) {
		orgaoConcedenteRepository.delete(orgaoConcedente);
	}

	@Transactional
	public List<OrgaoConcedente> listAll() {
		return (List<OrgaoConcedente>) orgaoConcedenteRepository.findAll();
	}

	@Transactional
	public OrgaoConcedente getOrgaoConcedente(Integer id) {
		return orgaoConcedenteRepository.findOne(id);
	}
}
