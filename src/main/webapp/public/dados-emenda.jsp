<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div>

	<div class="container">
	
		<div class="row">
			<div class="col-md-12">
				<form action="../editar" method="post" id="form_nova_emenda" role="form">	
					<input type="hidden" value="${emenda.id}" name="id">			
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label class="control-label">Numero</label> 
								<input type="text" name="numero" id="num_emenda" class="form-control"
								value="${emenda.numero}"> 
							</div>
							<div class="form-group">
								<label class="control-label">Data</label>
								<fmt:formatDate value="${emenda.ano}" var="ano_fmt" pattern="dd/MM/yyyy"/> 
								<input type="date" name="data" id="data_emenda" class="form-control" 
								onkeypress="return dateMask(this, event);"maxlength="10" value="${ano_fmt}"> 
							</div>
							<div class="form-group">
								<label class="control-label">Valor</label>	
								<fmt:formatNumber value="${emenda.valor}" var="valor_fmt"  minFractionDigits="2"  />							
								<input type="text" name="valor" id="valor_emenda" class="form-control money" 
								value="${valor_fmt}" maxlength="20"> 
							</div>												
							<button id="salvar_emenda" class="btn btn-primary"><i class="fa fa-floppy-o"></i> ALTERAR</button>
						</div>
					</div>		
				</form>			
			</div>
		</div>
		
	</div>
	
</div>

<script>

//salvar
$(document).ready( function() {
	$("#salvar_emenda").click( function() {
		$("#form_nova_emenda").submit();
	});	
});

</script>