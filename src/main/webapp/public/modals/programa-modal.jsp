<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<!-- MODAL PARA NOVO PROGRAMA -->
<div class="modal fade" id="new_programa_modal" tabindex="-1" role="dialog"  aria-hidden="true">

	<div class="modal-dialog">

		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>

				<h4 class="modal-title">Adicionar Programa:</h4>

			</div>
			
			<div class="modal-body">

				<form action="salvar" method="POST" role="form" id="form_novo_programa">									
								
					<div class="form-group">
						<div class="input-group col-md-12">
							<span class="input-group-addon">Nome</span>
							<input type="text" id="programa_nome" name="nome" class="form-control">								
						</div>
					</div>						
					<div class="form-group">			
						<button id="salvar_programa" class="btn btn-info btn-block">
							<i class="fa fa-floppy-o"></i> SALVAR
						</button>
					</div>				

				</form>

			</div>

		</div>

	</div>

</div>

<script>

//salvar

	$(document).ready( function() {
		$("#salvar_programa").click( function() {
			$("#form_novo_programa").submit();
		});
	});
	
</script>