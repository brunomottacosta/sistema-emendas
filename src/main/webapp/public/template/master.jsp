<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="pt-BR">

<head>
	
	<title>Convergencia</title>
	
	<!-- CSS -->
	<link href="<c:url value='/resources/bootstrap/css/bootstrap.min.css' />" rel="stylesheet"/>
    <link href="<c:url value='/resources/data-table/css/jquery.dataTables.bootstrap.css' />" rel="stylesheet"/>
   	<link href="<c:url value='/resources/bootstrap/bootstrap-select/css/bootstrap-select.min.css' />" rel="stylesheet"/>
    <link href="<c:url value='/resources/css/font-awesome.min.css' />" rel="stylesheet"/>
    <link href="<c:url value='/resources/css/stick-botton.css' />" rel="stylesheet"/>
    <link href="<c:url value='/resources/css/style.css' />" rel="stylesheet"/>
    <link href="<c:url value='/resources/css/new-style.css' />" rel="stylesheet"/>
	
	<!-- SCRIPT -->
	<script src="<c:url value='/resources/js/jquery.min.js' />"></script>
    <script src="<c:url value='/resources/js/jquery-ui.min.js' />"></script>
    <script src="<c:url value='/resources/bootstrap/js/bootstrap.min.js' />" ></script> 
    <script src="<c:url value='/resources/bootstrap/bootstrap-select/js/bootstrap-select.min.js' />" ></script>
    <script src="<c:url value='/resources/js/jquery.maskMoney.min.js' />" ></script>
    <script src="<c:url value='/resources/js/jquery.mask.js' />" ></script>
    <script src="<c:url value='/resources/js/my-mask-money.js' />" ></script>
    <script src="<c:url value='/resources/js/js.js' />" ></script>
    <script src="<c:url value='/resources/data-table/js/jquery.dataTables.js' />" ></script>
    <script src="<c:url value='/resources/data-table/js/jquery.dataTables.bootstrap.js' />" ></script>
        
</head>
    
<body>

	<div class="container">	
		
	<nav class="navbar navbar-default navbar-fixed-top">
  		<div class="container-fluid">
  			<div class="navbar-header">
			<ul class="nav navbar-nav">
        		<li class="active">
  					<a class="toggle brand" id="toggle_on"> 
						<i class="fa fa-bars fa-2x"></i>
					</a>
					<div class="menu-group not-visible" id="side_menu" style="position: absolute; width: 15em">
						<a href="/sistema/protected/index" class="menu-group-item">
							<i class="fa fa-th-large"></i> Notícias
						</a>
						<a href="/sistema/protected/emenda/pesquisa" class="menu-group-item">
							<i class="fa fa-search"></i> Buscar Emenda
						</a>
						<a href="/sistema/protected/emenda/registro/novo" class="menu-group-item">
							<i class="fa fa-plus"></i> Cadastrar Emenda
						</a>
					</div>					
				</li>				
			</ul>
			</div>		
  		</div>
	</nav>
		
	<div class="row">
	
		<div class="col-xs-12">		
			
			<!-- CONTEUDO RENDERIZA AQUI -->
			<tiles:insertAttribute name="body" /> 		
			
		</div>
		
	</div>
		
</div> 

<tiles:insertAttribute name="footer" />      

<script type="text/javascript">


$("#toggle_on").click( function() {	
	$("#side_menu").toggle("slide",{"direction" : "up"}, 450);		
});

</script>
        
</body>
    
</html>