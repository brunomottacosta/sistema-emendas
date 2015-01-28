<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="pt-BR">

<head>
	
	<title>Convergencia</title>
	
	<!-- CSS -->
	<link href="<c:url value='/resources/bootstrap/css/new-bootstrap.css' />" rel="stylesheet"/>
    <link href="<c:url value='/resources/data-table/css/jquery.dataTables.bootstrap.css' />" rel="stylesheet"/>
   	<link href="<c:url value='/resources/bootstrap/bootstrap-select/css/bootstrap-select.min.css' />" rel="stylesheet"/>
    <link href="<c:url value='/resources/css/font-awesome.min.css' />" rel="stylesheet"/>
    <link href="<c:url value='/resources/css/stick-botton.css' />" rel="stylesheet"/>
    <link href="<c:url value='/resources/css/style.css' />" rel="stylesheet"/>
    <link href="<c:url value='/resources/css/transparence.css' />" rel="stylesheet"/>
	
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

	<div class="fullsize background-content"></div>
			
	<div class="container">
	
		<!-- NAVBAR -->
		<tiles:insertAttribute name="header" />    
			
	</div>		
	
	<!-- CONTEUDO RENDERIZA AQUI -->
	<tiles:insertAttribute name="body" />
		

	<tiles:insertAttribute name="footer" />      
        
</body>
    
</html>