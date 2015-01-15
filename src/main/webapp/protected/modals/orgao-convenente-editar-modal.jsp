<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<!-- MODAL PARA NOVO ORGAO CONCEDENTE -->
<div class="modal fade" id="edit_org_conv_modal" tabindex="-1" role="dialog"  aria-hidden="true">

	<div class="modal-dialog">

		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				
				<div id="col-error-editar">
					<h4 class="modal-title">
						Orgão Convenente - Alteração
					</h4>
				</div>				

			</div>
			
			<div class="modal-body">

				<form action="editar" method="POST" role="form" id="form_editar_orgao_convenente">									
							
					<input type="hidden" id="orgao_convenente_id" name="id" value="${convenente.id}"> 				
							
					<div class="form-group">
						<label class="control-label">Orgão Convenente</label>
						<input type="text" id="orgao_convenente_nome_edit" name="nome" class="form-control">
					</div>
					
					<div class="form-group">
						<label class="control-label">CNPJ</label>
						<input type="text" id="orgao_convenente_cnpj_edit" name="cnpj" class="form-control cnpj">
					</div>
					
					<div class="form-group">			
						<button id="edita_orgao" class="btn btn-info btn-block" type="button">
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
	$("#edita_orgao").click( function() {
		// serializa em array o form
		var form_orgao_editar = $("#form_editar_orgao_convenente").serializeArray();		
		// valida se todos os dados estao preenchidos
		$.each(form_orgao_editar, function(pos, obj) {
			if (obj.value <= 0) {
				$("#col-error-editar").hide("fade", 100, function() {
					$("#col-error-editar")
					.html('<h4 class="modal-title text-danger">' +
							'Erro! Preencha todos os campos.' +
							'</h4>')
					.show("fade", 350);					
				});				
				return false;		
			}
			if (pos == (form_orgao_editar.length - 1)) {
				$("#form_editar_orgao_convenente").submit();
			}
		});				
	});

	$("#col-error-editar").click( function() {			
		$("#col-error-editar").hide("fade", 100, function() {
			$("#col-error-editar")
			.html('<h4 class="modal-title">Orgão Convenente - Novo</h4>')
			.show("fade", 350);					
		});				
	});
});
	
</script>