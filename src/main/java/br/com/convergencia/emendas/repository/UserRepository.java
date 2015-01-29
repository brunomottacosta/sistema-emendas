package br.com.convergencia.emendas.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.convergencia.emendas.model.users.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	public User findByUsername(String username);
	
}
