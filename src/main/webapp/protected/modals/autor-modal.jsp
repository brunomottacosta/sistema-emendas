<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<!-- MODAL PARA NOVO AUTOR -->
<div class="modal fade" id="new_autor_modal" tabindex="-1" role="dialog"  aria-hidden="true">

	<div class="modal-dialog">

		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				
				<div id="col-error-salvar">
					<h4 class="modal-title">Autor - Novo</h4>					
				</div>
				
			</div>
			
			<div class="modal-body">

				<form action="salvar" method="POST" role="form" id="form_novo_autor">									
								
					<div class="form-group">						
						<label class="control-label">Nome</label>
						<input type="text" id="autor_nome" name="nome" class="form-control">					
					</div>						
					<div class="form-group">			
						<button id="salvar_autor" class="btn btn-info btn-block" type="button">
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
	$("#salvar_autor").click( function() {
		// serializa em array o form
		var form_autor_salvar = $("#form_novo_autor").serializeArray();		
		// valida se todos os dados estao preenchidos
		$.each(form_autor_salvar, function(pos, obj) {
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
			if(pos == form_autor_salvar.length) {
				$("#form_novo_autor").submit();
			}
		});				
	});

	$("#col-error-salvar").click( function() {			
		$("#col-error-salvar").hide("fade", 100, function() {
			$("#col-error-salvar")
			.html('<h4 class="modal-title">Autor - Novo</h4>')
			.show("fade", 350);					
		});				
	});
});

	
	
</script>