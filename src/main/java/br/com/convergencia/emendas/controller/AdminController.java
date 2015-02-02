package br.com.convergencia.emendas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "admin/")
public class AdminController {

	@RequestMapping(value = "usuario", method = RequestMethod.GET)
	public String criarNovoUsuario(Model model) {
		
		return "formulario-usuario";
	}
	
}
