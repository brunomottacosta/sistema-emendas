<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<!-- MODAL PARA NOVO ORGAO CONCEDENTE -->
<div class="modal fade" id="new_org_conced_modal" tabindex="-1" role="dialog"  aria-hidden="true">

	<div class="modal-dialog">

		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				
				<div id="col-error-salvar">
					<h4 class="modal-title">
						Orgão Concedente - Novo
					</h4>
				</div>				

			</div>
			
			<div class="modal-body">

				<form action="salvar" method="POST" role="form" id="form_novo_orgao">									
								
					<div class="form-group">
						<label class="control-label">Nome</label>
						<input type="text" id="orgao_nome" name="nome" class="form-control">
					</div>						
					<div class="form-group">			
						<button id="salvar_orgao" class="btn btn-info btn-block" type="button">
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
	$("#salvar_orgao").click( function() {
		// serializa em array o form
		var form_orgao_salvar = $("#form_novo_orgao").serializeArray();		
		// valida se todos os dados estao preenchidos
		$.each(form_orgao_salvar, function(pos, obj) {
			if (obj.value <= 0) {
				$("#col-error-salvar").hide("fade", 100, function() {
					$("#col-error-salvar")
					.html('<h4 class="modal-title text-danger">' +
							'Erro! Preencha todos os campos.' +
							'</h4>')
					.show("fade", 350);					
				});				
				return false;		
			}
			if(pos == (form_orgao_salvar.length - 1)) {
				$("#form_novo_orgao").submit();
			}
		});				
	});

	$("#col-error-salvar").click( function() {			
		$("#col-error-salvar").hide("fade", 100, function() {
			$("#col-error-salvar")
			.html('<h4 class="modal-title">Orgão Concedente - Novo</h4>')
			.show("fade", 350);					
		});				
	});
});
	
</script>