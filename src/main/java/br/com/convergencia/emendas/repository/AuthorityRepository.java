package br.com.convergencia.emendas.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.convergencia.emendas.model.users.Authority;

public interface AuthorityRepository extends JpaRepository<Authority, String>{

}
