<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- MODAL PARA EDITAR AUTOR -->
<div class="modal fade" id="edit_autor_modal" tabindex="-1" role="dialog"  aria-hidden="true">

	<div class="modal-dialog">

		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				
				<div id="col-error-editar">
					<h4 class="modal-title">
						Autor - Alteração
					</h4>
				</div>
				
			</div>
			
			<div class="modal-body">

				<form action="editar" method="POST" role="form" id="form_edita_autor">									
					
					<input type="hidden" name="id" id="autor_id_edit"> 
								
					<div class="form-group">
						<label class="control-label">Nome</label>
						<input type="text" id="autor_nome_edit" name="nome" class="form-control">	
					</div>						
					
					<div class="form-group">			
						<button id="edita_autor" class="btn btn-info btn-block" type="button">
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
	$("#edita_autor").click( function() {
		// serializa em array o form
		var form_autor_editar = $("#form_edita_autor").serializeArray();		
		// valida se todos os dados estao preenchidos
		$.each(form_autor_editar, function(pos, obj) {
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
			if(pos == (form_autor_editar.length - 1)) {
				$("#form_edita_autor").submit();
			}
		});				
	});

	$("#col-error-editar").click( function() {			
		$("#col-error-editar").hide("fade", 100, function() {
			$("#col-error-editar")
			.html('<h4 class="modal-title">Autor - Alteração</h4>')
			.show("fade", 350);					
		});				
	});
});
	
</script>