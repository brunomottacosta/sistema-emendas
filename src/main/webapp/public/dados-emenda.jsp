<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div>

	<div class="container-fluid">
	
		<div class="row">
			<div class="col-md-12">
				<form action="../salvar" method="post" id="form_nova_emenda" role="form">
					
					<input type="hidden" value="${emenda.id}" name="id">
					<input type="hidden" value="1" name="modo">
								
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label class="control-label">Numero</label> 
								<input type="text" name="numero" id="num_emenda" class="form-control"
								value="${emenda.numero}"> 
							</div>
							<div class="form-group">
								<label class="control-label">Data</label>
								<fmt:formatDate value="${emenda.ano}" var="ano_fmt" pattern="yyyy"/> 
								<input type="date" name="ano" id="data_emenda" class="form-control" 
								value="${ano_fmt}"> 
							</div>
							<div class="form-group">
								<label class="control-label">Valor</label>	
								<fmt:formatNumber value="${emenda.valor}" var="valor_fmt"  minFractionDigits="2"  />							
								<input type="text" name="valor" id="valor_emenda" class="form-control money" 
								value="${valor_fmt}" maxlength="20"> 
							</div>
							<div class="form-group">
								<label class="control-label">G.N.D.</label> 
								<select id="gnd_emenda" class="form-control input-sm form-pesquisa" name="gnd">
									<option value=""></option>
									<c:forEach items="${gnd}" var="gnd_var" >
										<option value="${gnd_var.id}">${gnd_var.numero} - ${gnd_var.descricao}</option>
									</c:forEach>
								</select> 
							</div>								
							<div class="form-group">
								<label class="control-label">Modalidade de Aplicacao</label> 
								<select id="mda_emenda" class="form-control input-sm form-pesquisa" name="modApp">
									<option value=""></option>
									<c:forEach items="${modalidadeDeAplicacao}" var="mda_var">
										<option value="${mda_var.id}">${mda_var.numero} - ${mda_var.descricao}</option>
									</c:forEach>
								</select> 
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