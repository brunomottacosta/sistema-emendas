<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="jumbotron">

<div class="container">

<!-- MAIN MENU -->
<nav class="navbar navbar-inverse">

	<div class="container-fluid">

		<div class="navbar-header">
			<a class="navbar-brand" href="#">
			<span class="glyphicon glyphicon-home"></span></a>
		</div>

		<!-- AQUI VAI OS ITENS DO MENU -->
		<ul class="nav navbar-nav">

			<li>
			
				<a href="/emendas/emenda/lista"> 
					Emendas
				</a>				
				
			</li>
			<li class="dropdown">
			
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
					Listas Auxiliares
					<span class="caret"></span>
				</a>
				
				<ul class="dropdown-menu" role="menu">
					
					<li><a href="/emendas/autor/lista">Autores</a></li>
					<li class="divider"></li>
					
				</ul>
				
			</li>				

		</ul>

		<ul class="nav navbar-nav navbar-right">
			<li class="divider"></li>
			<li><a class="nav-brand" href="logout">Logout</a></li>
		</ul>

	</div>

</nav>

</div>

</div>

