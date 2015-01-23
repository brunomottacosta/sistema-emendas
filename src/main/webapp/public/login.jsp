<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="pt-BR">

<head>
	
	<title>Anyone</title>
	
	<!-- CSS -->
	<link href="<c:url value='/resources/bootstrap/css/bootstrap.min.css' />" rel="stylesheet"/>
	<link href="<c:url value='/resources/css/login.css' />" rel="stylesheet"/>
	
	<!-- SCRIPT -->
	<script src="<c:url value='/resources/js/jquery.min.js' />"></script>
	<script src="<c:url value='/resources/js/default.js' />" ></script>
        
</head>
    
<body style="background-color: #000;">

	<!-- HOME PAGE -->	
	<div class="fullsize darker background-login"></div>	
    	
    <div class="container">
    	
    	<div class="row" style="height: 7.5em">
	    	<div class=" col-md-4 col-md-offset-4">	
				<c:if test="${!empty error}">
					<div class="alert alert-danger" role="alert">
						<strong>Falha ao logar!</strong> Login ou senha incorretos.
					</div>
				</c:if>
			</div>	
		</div>
    		
        <div class="row">
        
            <div class="col-md-4 col-md-offset-4">
            
                <div class="login-panel panel panel-default">                             
                    
                    <div class="panel-body">                   
                    	
                        <form name='loginForm' class="form-signin"	action="<c:url value='j_spring_security_check' />" method='POST'>

							<input id="login" type="text" class="form-control" name="j_username" value="" placeholder="username">
							
							<input id="password" type="password" class="form-control" name="j_password" placeholder="password">

                            <input type="submit" class="btn btn-info btn-lg btn-block" value="Entrar">
                            
                        </form>
                        
                    </div>
                    
                </div>
                
            </div>
            
        </div>
        
    </div>
	
</body>
 </html>   