<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="pt-BR">
	<head>
	
        <title>Anyone</title>
        
        <!-- CSS -->
        <link href="<c:url value='/resources/bootstrap/css/bootstrap.min.css' />" rel="stylesheet"/>
        <link href="<c:url value='/resources/data-table/css/jquery.dataTables.bootstrap.css' />" rel="stylesheet"/>
        <link href="<c:url value='/resources/css/font-awesome.min.css' />" rel="stylesheet"/>
        <link href="<c:url value='/resources/css/stick-botton.css' />" rel="stylesheet"/>
        <link href="<c:url value='/resources/css/style.css' />" rel="stylesheet"/>
        
        <!-- SCRIPT -->
        <script src="<c:url value='/resources/js/jquery.min.js' />"></script>
        <script src="<c:url value='/resources/js/jquery-ui.min.js' />"></script>
        <script src="<c:url value='/resources/bootstrap/js/bootstrap.min.js' />" ></script>
        <script src="<c:url value='/resources/js/jquery.maskMoney.min.js' />" ></script>
        <script src="<c:url value='/resources/js/my-mask-money.js' />" ></script>
        <script src="<c:url value='/resources/data-table/js/jquery.dataTables.js' />" ></script>
        <script src="<c:url value='/resources/data-table/js/jquery.dataTables.bootstrap.js' />" ></script>
        <script src="<c:url value='/resources/js/js.js' />" ></script>
        
    </head>
    
    <body style="overflow-y: scroll"> 
    
	<div class="container-fluid" style="margin-top: 20px">			

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
		
				<form class="navbar-form navbar-right">
					
					<div class="form-group">
						
						<input class="form-control" type="text" placeholder="Pesquisar"/>
						<button type="button" class="btn btn-danger">
							<i class="fa fa-search"></i>
						</button>
						
					</div>
					
				</form>
		
			</div>

		</nav>

	</div>
	
	<div class="container-fluid">
	
		<div class="row">
			
			<div class="col-xs-2">		
				
				<a class="btn btn-info show-hide" style="margin-bottom: 20px">
					<i class="fa fa-bars fa-2x"></i>
				</a>
				
				<div id="side_menu">
				
					<div class="list-group">
						<a href="#" class="list-group-item">
							<i class="fa fa-th-large"></i> Notícias
						</a>
						<a href="#" class="list-group-item">
							<i class="fa fa-search"></i> Buscar Emenda
						</a>
						<a href="#" class="list-group-item">
							<i class="fa fa-plus"></i> Cadastrar Emenda
						</a>
					</div>				
					
					<div class="list-group">
						<a class="list-group-item logout" href="<c:url value='/logout' />">
							<i class="fa fa-fw fa-power-off"></i> Logout
						</a>
					</div>
						
				</div>				
				
			</div>
			
			<div class="col-xs-10">
				
				<div class="list-group">					
					<!-- CONTEUDO RENDERIZA AQUI -->									
				</div>
				
			</div>
			
		</div>
		
	</div>
	
<script type="text/javascript">

$(".show-hide").click( function() {
	$("#side_menu").toggle("slide", 300);	
});
	
</script>
	
</body>

</html>
