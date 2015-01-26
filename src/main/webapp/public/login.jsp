<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="pt-BR">

<head>
	
	<title>Anyone</title>
	
	<!-- CSS -->
	<link href="<c:url value='/resources/bootstrap/css/new-bootstrap.css' />" rel="stylesheet"/>
	<link href="<c:url value='/resources/css/login.css' />" rel="stylesheet"/>
	<link href="<c:url value='/resources/css/font-awesome.min.css' />" rel="stylesheet"/>
	
	<!-- SCRIPT -->
	<script src="<c:url value='/resources/js/jquery.min.js' />"></script>
	<script src="<c:url value='/resources/js/default.js' />" ></script>
        
</head>
    
<body>

	<!-- HOME PAGE -->	
	<div class="fullsize background-login"></div>	
    	
    <div class="container">
    	
    	<div class="row" style="height: 7.5em">
	    	<div class=" col-md-8 col-md-offset-2">	
				<c:if test="${!empty error}">
					<div class="alert alert-danger opaco-error" role="alert">
						<strong>Falha ao logar!</strong> Login ou senha incorretos.
					</div>
				</c:if>
			</div>	
		</div>
    		
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="login-panel panel panel-default opaco-panel"> 
                    <div class="panel-body">
                    	<div class="row">
                    		<div class="col-xs-6" style="border-right: 1px solid #EEE; min-height: 15em">                    			
                    			<h5 style="color: #FFF;font-weight: bold;">
                    				Gerenciador de Emendas
                  				</h5>
                  				<h6 style="color: #DDD">
                  					por Convergência <i class="fa fa-copyright"></i>
                  				</h6>
                  				<hr />                    		
                    			<p style="color: #444">
                    				Sistema responsável por melhorar a forma de se trabalhar com emendas do governo,
                    				com geração de relatórios e buscas dinâmicas por filtros. 
            
                    			</p>
                    		</div>                    		
                    		<div class="col-xs-6">
                    			<form name="loginForm" class="form-signin"	action="<c:url value='j_spring_security_check' />" method='POST'>
									<input id="login" type="text" class="form-control" name="j_username" value="" placeholder="username">
									<input id="password" type="password" class="form-control" name="j_password" placeholder="password">
		                            <input type="submit" class="btn btn-primary btn-lg btn-block" value="Entrar">
		                        </form>                    		
                    		</div>                    		
                    	</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
</body>
 </html>   