<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container-fluid">
					
	<div class="row">
		
		<div class="col-md-6">
		
			<form action="../editar" method="POST" role="form" id="form_novo_orgao_convenente">									
				
				<div class="form-group">			
					<button id="salvar_orgao_convenente" class="btn btn-info" type="submit">
						<i class="fa fa-floppy-o"></i> SALVAR
					</button>
				</div>
				
				<input type="hidden" id="orgao_convenente_id" name="id" value="${convenente.id}"> 				
							
				<div class="form-group">
					<label class="control-label">Orgão Convenente</label>
					<input type="text" id="orgao_convenente_nome" name="nome" class="form-control" value="${convenente.nome}">
				</div>
				
				<div class="form-group">
					<label class="control-label">CNPJ</label>
					<input type="text" id="orgao_convenente_cnpj" name="cnpj" class="form-control cnpj" value="${convenente.cnpj}">
				</div>
				
			</form>
			
		</div>
		
	</div>
		
</div>

<!-- SCRIPTS -->
<script type="text/javascript">


</script>