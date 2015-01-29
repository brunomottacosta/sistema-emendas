package br.com.convergencia.emendas.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.convergencia.emendas.model.users.User;
import br.com.convergencia.emendas.repository.UserRepository;

@Controller
public class HomeController {
	
	@Autowired
	private UserRepository userRepository;
	
	
	/* PATH INICIAL DO SISTEMA */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "login";
	}	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() { 

		return "login";
	}
	
	/* ACESSO NEGADO, RETORNA ERRO PARA TELA LOGIN */
	@RequestMapping(value = "/loginError", method = RequestMethod.GET)
	public String loginError(Model model) {
		
		model.addAttribute("error", "true");
		
		return "login";
	}
	
	@RequestMapping(value = "/protected/index", method = RequestMethod.GET)
	public String index(HttpServletRequest request, Model model) {
		
		LocalDate date = LocalDate.now();
		
		// Pega os dados do usuario logado
		UserDetails principal = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = userRepository.findByUsername(principal.getUsername()); 
		
		HttpSession session = request.getSession(true);
		session.setAttribute("system_date", date.format(DateTimeFormatter.ofPattern("dd/MM/yyyy")));
		session.setAttribute("user", user);
		
		return "index";
	}
	
	@RequestMapping(value = "/admin")
	public String acessar(HttpServletRequest request, Model model) {
		
		LocalDate date = LocalDate.now();
		
		// Pega os dados do usuario logado
		UserDetails principal = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User admin = userRepository.findByUsername(principal.getUsername()); 
		
		HttpSession session = request.getSession(true);
		session.setAttribute("system_date", date.format(DateTimeFormatter.ofPattern("dd/MM/yyyy")));
		session.setAttribute("admin", admin);
		
		return "admin-painel";
	}
	
}
