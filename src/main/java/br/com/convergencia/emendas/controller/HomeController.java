package br.com.convergencia.emendas.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
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
		
		HttpSession session = request.getSession(true);
		session.setAttribute("system_date", date.format(DateTimeFormatter.ofPattern("dd/MM/yyyy")));
		
		return "index";
	}
	
}
