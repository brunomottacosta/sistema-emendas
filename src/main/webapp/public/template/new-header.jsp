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
			<i class="fa fa-home"></i> 
			<a href="#">Home</a>
		</li>
		
		<li class="launcher">
			<i class="fa fa-list-alt"></i> 
			<a href="/sistema/emenda/pesquisa">Emendas</a>
		</li>
		
		<li class="launcher dropdown hover">
			<i class="fa fa-folder-open-o"></i>
			<a href="#">Listas</a>					
			<ul class="dropdown-menu">
				<li>
					<a href="/sistema/autor/lista">Autores</a>
				</li>
				<li>
					<a href="/sistema/orgao-concedente/lista">Órgãos Condedentes</a>
				</li>
			</ul>
		</li>		
		
		<li class="launcher">
			<i class="fa fa-cog"></i> 
			<a href="#">Configurações</a>
		</li>
		
	</ul>						
	
</section>

<!-- BARRA SUPERIOR -->

<section id="tools">

	<ul class="breadcrumb" id="breadcrumb">
	
		<li>
			<a href="#">Lorem</a>
		</li>
		
		<li class="active">
			<a href="#">ipsum</a>
		</li>
		
	</ul>
	
</section>