<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="pt-BR">

<head>
	
	<title>Administrador</title>
	
	<!-- CSS -->
	<link href="<c:url value='/resources/bootstrap/css/new-bootstrap.css' />" rel="stylesheet"/>
	<link href="<c:url value='/resources/css/font-awesome.min.css' />" rel="stylesheet"/>
	<link href="<c:url value='/resources/css/admin.css' />" rel="stylesheet"/>
	<link href="<c:url value='/resources/css/style.css' />" rel="stylesheet"/>
    <link href="<c:url value='/resources/css/stick-botton.css' />" rel="stylesheet"/>
	<link href="<c:url value='/resources/css/transparence.css' />" rel="stylesheet"/>
	
	<!-- SCRIPT -->
	<script src="<c:url value='/resources/js/jquery.min.js' />"></script>
	<script src="<c:url value='/resources/bootstrap/js/bootstrap.min.js' />" ></script>
        
</head>
    
<body>

	<!-- ADMIN PAINEL -->	
	<div class="fullsize background-admin"></div>	
    
    <div class="container">
    
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
							<a href="/sistema/admin/usuario" class="fa-lg">
								<i class="fa fa-users"></i>
							</a>
						</li>
					</ul>
							
				</div>
			
			</div>
			
		</nav>  
    	
    </div>
    
    <div class="container">
    
    	<tiles:insertAttribute name="body" />
    	
    </div>	
	
</body>

 </html>   