<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	

<nav class="navbar navbar-default ">
	<div class="container-fluid">
	
		<ul class="nav navbar-nav">
       		<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
					<i class="fa fa-bars fa-lg"></i>
				</a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="#">Action</a></li>
					<li><a href="#">Another action</a></li>
					<li><a href="#">Something else here</a></li>
					<li class="divider"></li>
					<li><a href="#">Separated link</a></li>
					<li class="divider"></li>
					<li><a href="#">One more separated link</a></li>
				</ul>
			</li>
			<li>
				<a href="/sistema/protected/emenda/pesquisa" class="fa-lg">Emendas</a>
			</li>					
		</ul>
		
		<ul class="nav navbar-nav navbar-right">
       		<li class="active">
       			<a href="<c:url value='/logout' />"><i class="fa fa-sign-out fa-lg"></i></a>
       		</li>		
		</ul>
				
	</div>
</nav>



