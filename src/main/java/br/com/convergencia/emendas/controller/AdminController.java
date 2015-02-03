package br.com.convergencia.emendas.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.convergencia.emendas.model.users.Authority;
import br.com.convergencia.emendas.model.users.User;
import br.com.convergencia.emendas.service.AuthorityService;
import br.com.convergencia.emendas.service.UserService;

@Controller
@RequestMapping(value = "admin/")
public class AdminController {

	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	// Injeções de Dependencia //
	// ~~~~~~~~~~~~~~~~~~~~~~~~//

	@Autowired private UserService userService;
	@Autowired private AuthorityService authorityService;
	
	// ~~~~~~~~~~~~~~~~~~~~//
	//   Métodos Mapeados  //
	// ~~~~~~~~~~~~~~~~~~~~//
	
	@RequestMapping(value = "usuario", method = RequestMethod.GET)
	public String criarNovoUsuario(Model model) {
		
		return "formulario-usuario";
	}
	
	@RequestMapping(value = "salvar", method = RequestMethod.POST)
	public String salvarNovoUsuario(
			RedirectAttributes redirect,
			@RequestParam String username,
			@RequestParam String password,
			@RequestParam String nome) {
		
		User usuario = new User();
		
		if (!username.isEmpty() && !password.isEmpty() && !nome.isEmpty()) {
			
			usuario = userService.getUser(username);
			
			if (usuario.getUsername() == null) {						
				userService.save(usuario);
				
				usuario.setUsername(username);
				usuario.setPassword(password);
				usuario.setNome(nome);
				usuario.setEnable(true);
				
				List<Authority> authorities = new ArrayList<Authority>();
				authorities.add(authorityService.getAuthority("ROLE_USER"));
				
				usuario.setAuthorities(authorities);
				
			} else {				
				
				redirect.addFlashAttribute("error", "Usuario já existente. Tente outro username.");				
				return "redirect:/admin/usuario";	
			}
			
		} else {
			
			redirect.addFlashAttribute("error", "Preencha todos os campos.");
			
			return "redirect:/admin/usuario";
		}
		
		return "redirect:/admin/index";
	}
	
}
