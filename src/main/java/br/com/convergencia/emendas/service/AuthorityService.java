package br.com.convergencia.emendas.service;

import org.springframework.stereotype.Service;

import br.com.convergencia.emendas.model.users.Authority;
import br.com.convergencia.emendas.repository.AuthorityRepository;

@Service
public class AuthorityService {

	private AuthorityRepository authorityRepository;
	
	public Authority getAuthority(String role) {
		return authorityRepository.findOne(role);
	}
	
}
