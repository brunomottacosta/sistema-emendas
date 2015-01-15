<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<!-- MODAL PARA EDITAR ORGAO CONCEDENTE -->
<div class="modal fade" id="edit_orgao_modal" tabindex="-1" role="dialog"  aria-hidden="true">

	<div class="modal-dialog">

		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				
				<div id="col-error-editar">
					<h4 class="modal-title">Orgão Concedente - Alteração</h4>
				</div>				

			</div>
			
			<div class="modal-body">

				<form action="editar" method="POST" role="form" id="form_edita_orgao">									
					
					<input type="hidden" name="id" id="orgao_id_edit"> 
								
					<div class="form-group">
						<label class="control-label">Nome</label>
						<input type="text" id="orgao_nome_edit" name="nome" class="form-control">	
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


$(document).ready( function() {
	$("#edita_orgao").click( function() {
		// serializa em array o form
		var form_orgao_editar = $("#form_edita_orgao").serializeArray();		
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
			if (pos == (form_orgao_editar.length -1)) {
				$("#form_edita_orgao").submit();
			}
		});				
	});

	$("#col-error-editar").click( function() {			
		$("#col-error-editar").hide("fade", 100, function() {
			$("#col-error-editar")
			.html('<h4 class="modal-title">Orgão Concedente - Novo</h4>')
			.show("fade", 350);					
		});				
	});
});
	
</script>