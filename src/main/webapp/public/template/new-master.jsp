<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!Doctype html>
<html lang="pt-BR">

	<head>
	
        <title>Anyone</title>
        
        <!-- CSS -->
        <link href="<c:url value='/resources/bootstrap/css/bootstrap.min.css' />" rel="stylesheet"/>
        <link href="<c:url value='/resources/data-table/css/jquery.dataTables.bootstrap.css' />" rel="stylesheet"/>
        <link href="<c:url value='/resources/data-table/css/jquery.dataTables.tools.css' />" rel="stylesheet"/>
       	<link href="<c:url value='/resources/bootstrap/bootstrap-select/css/bootstrap-select.min.css' />" rel="stylesheet"/>
        <link href="<c:url value='/resources/css/font-awesome.min.css' />" rel="stylesheet"/>
        <link href="<c:url value='/resources/css/default.css' />" rel="stylesheet"/>
        <link href="<c:url value='/resources/css/stick-botton.css' />" rel="stylesheet"/>
        <link href="<c:url value='/resources/css/style.css' />" rel="stylesheet"/>
        
        <!-- SCRIPT -->
        <script src="<c:url value='/resources/js/jquery.min.js' />"></script>
        <script src="<c:url value='/resources/js/jquery-ui.min.js' />"></script>
        <script src="<c:url value='/resources/js/default.js' />" ></script>
        <script src="<c:url value='/resources/bootstrap/bootstrap-select/js/bootstrap-select.min.js' />" ></script>
        <script src="<c:url value='/resources/js/jquery.maskMoney.min.js' />" ></script>
        <script src="<c:url value='/resources/js/jquery.mask.js' />" ></script>
        <script src="<c:url value='/resources/js/my-mask-money.js' />" ></script>
        <script src="<c:url value='/resources/data-table/js/jquery.dataTables.js' />" ></script>
        <script src="<c:url value='/resources/data-table/js/jquery.dataTables.bootstrap.js' />" ></script>
        <script src="<c:url value='/resources/data-table/js/jquery.dataTables.tools.js' />" ></script>
        <script src="<c:url value='/resources/data-table/js/jquery.dataTables.tools.bootstrap.js' />" ></script>
        <script src="<c:url value='/resources/js/validation.js' />" ></script>
        <script src="<c:url value='/resources/js/js.js' />" ></script>
        
    </head>
    
    <body class="main page">    	
	
		<!-- NAVBAR -->
		<div class="navbar navbar-default" id="navbar">
		
<!-- 			<a class="navbar-brand" href="index"> <i class="fa fa-android"></i> -->
<!-- 				Application -->
<!-- 			</a> -->
			
			<ul class="nav navbar-nav pull-right">
			
				<li>
				 	<a href="#">12/12/2012</a>
				</li>
				
				<li class="dropdown">
				
					<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
						<i class="fa fa-user"></i> <strong>Bruno Costa</strong>
						<b class="caret"></b>
					</a>
					
					<ul class="dropdown-menu logout">
						<li>
							<a href="#">
								Logout <i class="fa fa-fw fa-power-off"></i>
							</a>
						</li>
					</ul>
					
				</li>
				
			</ul>
			
		</div>

		<div id="wrapper">
			
			<!-- INSERT DO HEADER -->
			<tiles:insertAttribute name="header" />     
 		
			<div id="content">
 				
 				<!-- INSERT DO BODY -->
				<tiles:insertAttribute name="body" />  
	     
	   	 	</div> 
	   	    
	   	    <!-- INSERT DO FOOTER -->  
        	<tiles:insertAttribute name="footer" />
			
		</div>
	
	</body>
	
</html>	