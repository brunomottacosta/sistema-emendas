<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="panel panel-transparence" >
 	
	<div class="panel-heading">
		<h4><i class="fa fa-cogs"></i> Painel do Administrador</h4>
	</div>
  		
	<div class="panel-body">
  		
		<div class="row">
		
			<div class="col-xs-12">
			
				<h5>Adicionar novo usuário</h5>
				
				<hr />
				
				<form action="salvar" method="POST" role="form">
					
					<div class="row">
					
						<div class="col-xs-4">
							
							<div class="form-group">
					
								<label>Login <span class="text-danger">*</span></label>
								<input class="form-control" type="text" name="username" value="">
							
							</div>
							<div class="form-group">
					
								<label>Senha <span class="text-danger">*</span></label>
								<input class="form-control" type="password" name="password" value="">
							
							</div>
							<div class="form-group">
					
								<label>Nome <span class="text-danger">*</span></label>
								<input class="form-control" type="text" name="nome_n">
							
							</div>
						
						</div>
						
					</div>
					
				</form>
			
			</div>
			
		</div>
  			
	</div>
  		
</div>
