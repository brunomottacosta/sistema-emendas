<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<!-- MODAL PARA EDITAR AUTOR -->
<div class="modal fade" id="edit_autor_modal" tabindex="-1" role="dialog"  aria-hidden="true">

	<div class="modal-dialog modal-sm">

		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>

				<h4 class="modal-title">Autor - Alteração</h4>

			</div>
			
			<div class="modal-body">

				<form action="editar" method="POST" role="form" id="form_edita_autor">									
					
					<input type="hidden" name="id" id="autor_id_edit"> 
								
					<div class="form-group">
						<div class="input-group col-md-12">
							<span class="input-group-addon">Nome</span>
							<input type="text" id="autor_nome_edit" name="nome" class="form-control">								
						</div>
					</div>						
					<div class="form-group">			
						<button id="edita_autor" class="btn btn-info btn-block">
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
	$("#edita_autor").click( function() {
		$("#form_edita_autor").submit();
	});
});
	
</script>