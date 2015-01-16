<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- MODAL PARA NOVO PRODUTO -->
<div class="modal fade" id="new_convenente_modal" tabindex="-1" role="dialog"  aria-hidden="true">

	<div class="modal-dialog">

		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>

				<div id="col-error-conv">
					<h4 class="modal-title">
						Orgão Convenente - Novo
					</h4>
				</div>	

			</div>
			
			<div class="modal-body">

				<form action="../../orgao-convenente/salvarEmIndicacao" method="POST" role="form" id="form_novo_orgao_convenente">									
								
					<input type="hidden" name="emenda" value="${emenda.id}"> 			
								
					<div class="form-group">
						<label class="control-label">Orgão Convenente</label>
						<input type="text" id="orgao_convenente_nome" name="nome" class="form-control">
					</div>
					
					<div class="form-group">
						<label class="control-label">CNPJ</label>
						<input type="text" id="orgao_convenente_cnpj" name="cnpj" class="form-control cnpj">
					</div>			
					
					<div class="form-group">			
						<button id="salvar_convenente" class="btn btn-info btn-block" type="button">
							<i class="fa fa-floppy-o"></i> SALVAR
						</button>
					</div>				
					
				</form>

			</div>

		</div>

	</div>

</div>

<script type="text/javascript">

//salvar
$(document).ready( function() {
	$("#salvar_convenente").click( function() {
		// serializa em array o form
		var form_orgao_salvar = $("#form_novo_orgao_convenente").serializeArray();		
		// valida se todos os dados estao preenchidos
		$.each(form_orgao_salvar, function(pos, obj) {
			if (obj.value <= 0) {
				$("#col-error-conv").hide("fade", 100, function() {
					$("#col-error-conv")
					.html('<h4 class="modal-title text-danger">' +
							'Erro! Preencha todos os campos.' +
							'</h4>')
					.show("fade", 350);					
				});				
				return false;		
			}
			if (pos == (form_orgao_salvar.length - 1)) {
				$("#form_novo_orgao_convenente").submit();
			}
		});				
	});

	$("#col-error-conv").click( function() {			
		$("#col-error-conv").hide("fade", 100, function() {
			$("#col-error-conv")
			.html('<h4 class="modal-title">Orgão Convenente - Novo</h4>')
			.show("fade", 350);					
		});				
	});
});
	
</script>