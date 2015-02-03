package br.com.convergencia.emendas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.convergencia.emendas.model.users.User;
import br.com.convergencia.emendas.repository.UserRepository;

@Service
public class UserService {
	
@Autowired private UserRepository userRepository;
	
	@Transactional
	public void save(User user) {
		userRepository.save(user);		
	}
	
	@Transactional
	public void update(User user) {
		userRepository.save(user);
	}
	
	@Transactional
	public void delete(User user) {
		userRepository.delete(user.getUsername());
	}
	
	@Transactional
	public List<User> listAll() {
		return (List<User>) userRepository.findAll();
	}
	
	@Transactional
	public User getUser(String id) {
		return userRepository.findOne(id);
	}
	
}
