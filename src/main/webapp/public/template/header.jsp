<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-nav">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">#</a>
		</div>
		
		<div class="collapse navbar-collapse" id="main-nav">
		
			<ul class="nav navbar-nav">
	       		<li>
					<a href="/sistema/protected/index" class="fa-lg">
						<i class="glyphicon glyphicon-home"></i>
					</a>
				</li>
				<li>
					<a href="/sistema/protected/emenda/pesquisa" class="fa-lg">
						<i class="glyphicon glyphicon-search"></i>
					</a>
				</li>		
				<li class="dropdown">
					<a href="#" class="dropdown-toggle fa-lg" data-toggle="dropdown" role="button" aria-expanded="false">
						<i class="glyphicon glyphicon-folder-open"></i>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/sistema/protected/autor/lista">Autores</a></li>
						<li class="divider"></li>
						<li><a href="/sistema/protected/orgao-concedente/lista">Concedentes</a></li>
						<li><a href="/sistema/protected/orgao-convenente/lista">Convenentes</a></li>
						<li class="divider"></li>
						<li><a href="/sistema/protected/programa/lista">Programas</a></li>					
						<li><a href="/sistema/protected/acao/lista">Ações</a></li>
						<li><a href="/sistema/protected/objeto/lista">Objetos</a></li>
					</ul>
				</li>			
			</ul>
			
			<p class="navbar-text">${user.nome}</p>
	
			<a class="btn-off navbar-btn navbar-right" href="<c:url value='/logout' />" style="margin-right: 2em">
				<i class="fa fa-power-off fa-lg"></i>
			</a>
			
		</div>
				
	</div>
</nav>



