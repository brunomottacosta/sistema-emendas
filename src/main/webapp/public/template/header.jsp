<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="jumbotron">

<div class="container">

<!-- MAIN MENU -->
<nav class="navbar navbar-inverse">

	<div class="container-fluid">

		<div class="navbar-header">
			<a class="navbar-brand" href="/emendas">
			<span class="glyphicon glyphicon-home"></span></a>
		</div>

		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

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

	</div>

</nav>

</div>

</div>

