<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- BARRA DE FERRAMENTAS LATERAL -->

<section id="sidebar">

	<i class="fa fa-bars fa-2x" id="toggle" style="cursor: pointer"></i>
	
	<ul id="dock">
		
		<li class="launcher">
			<i class="fa fa-search"></i> 
			<a href="/sistema/protected/emenda/pesquisa">Pesquisa</a>
		</li>
		
		<li class="launcher">
			<i class="fa fa-plus"></i> 
			<a href="/sistema/protected/emenda/registro/novo">Cadastro</a>
		</li>
		
		<li class="launcher dropdown hover">
			<i class="fa fa-folder-open-o"></i>
			<a href="#">Formulários</a>					
			<ul class="dropdown-menu">
				<li>
					<a href="/sistema/protected/emenda/lista">Emenda</a>
				</li>
				<li>
					<a href="/sistema/protected/autor/lista">Autor</a>
				</li>
				<li>
					<a href="/sistema/protected/orgao-concedente/lista">Orgão Condedente</a>
				</li>
				<li>
					<a href="/sistema/protected/orgao-convenente/lista">Orgão Convenente</a>
				</li>
				<li>
					<a href="/sistema/protected/programa/lista">Programa</a>
				</li>
				<li>
					<a href="/sistema/protected/acao/lista">Ação</a>
				</li>
				<li>
					<a href="/sistema/protected/objeto/lista">Objeto</a>
				</li>
			</ul>
		</li>	
		
	</ul>	
					
	
</section>

<!-- BARRA FERRAMENTAS SUPERIOR -->

<section id="tools">
	
	<nav class="navbar navbar-default mid-navbar" role="navigation">
  		
	</nav>

</section>
