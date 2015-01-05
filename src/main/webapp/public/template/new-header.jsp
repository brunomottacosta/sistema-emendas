<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- BARRA DE FERRAMENTAS LATERAL -->

<section id="sidebar">

	<i class="fa fa-bars fa-2x" id="toggle"></i>
	
	<ul id="dock">
		
		<li class="launcher">
			<i class="fa fa-search"></i> 
			<a href="/sistema/emenda/pesquisa">Pesquisa</a>
		</li>
		
		<li class="launcher">
			<i class="fa fa-plus"></i> 
			<a href="/sistema/emenda/registro/novo">Cadastro</a>
		</li>
		
		<li class="launcher dropdown hover">
			<i class="fa fa-folder-open-o"></i>
			<a href="#">Formulários</a>					
			<ul class="dropdown-menu">
				<li>
					<a href="/sistema/emenda/lista">Emenda</a>
				</li>
				<li>
					<a href="/sistema/autor/lista">Autor</a>
				</li>
				<li>
					<a href="/sistema/orgao-concedente/lista">Orgão Condedente</a>
				</li>
				<li>
					<a href="/sistema/orgao-convenente/lista">Orgão Convenente</a>
				</li>
				<li>
					<a href="/sistema/programa/lista">Programa</a>
				</li>
				<li>
					<a href="/sistema/acao/lista">Ação</a>
				</li>
				<li>
					<a href="/sistema/objeto/lista">Objeto</a>
				</li>
			</ul>
		</li>	
		
	</ul>						
	
</section>

<!-- BARRA FERRAMENTAS SUPERIOR -->

<section id="tools">
	
	<nav class="navbar navbar-default mid-navbar" role="navigation">
  		<div class="container-fluid">
    		<ul class="nav navbar-nav">
    			<li>
    				<a href="#">
    					LINK
    				</a>
    			</li>
    		</ul>
  		</div>
	</nav>

</section>