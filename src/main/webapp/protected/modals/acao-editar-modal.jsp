<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- MODAL PARA EDITAR AUTOR -->
<div class="modal fade" id="edit_acao_modal" tabindex="-1" role="dialog"  aria-hidden="true">

	<div class="modal-dialog">

		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				
				<div id="col-error-editar">
					<h4 class="modal-title">Ação - Alteração</h4>
				</div>
			</div>
			
			<div class="modal-body">

				<form action="editar" method="POST" role="form" id="form_edita_acao">									
					
					<input type="hidden" name="id" id="acao_id_edit"> 
								
					<div class="form-group">			
						<label>Nome</label>				
						<input type="text" id="acao_nome_edit" name="nome" class="form-control">					
					</div>
					
					<div class="form-group">
						<label>Programa</label>
						<select id="acao_prog_edit" data-live-search="true"
						class="form-control drop-pesquisa selectpicker" name="idPrograma">										
							<c:forEach items="${programas}" var="prog_var" >
								<option value="${prog_var.id}">
									${prog_var.nome}
								</option>
							</c:forEach>
						</select> 
					</div>
											
					<div class="form-group">			
						<button id="edita_acao" class="btn btn-info btn-block" type="button">
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
	$("#edita_acao").click( function() {
		// serializa em array o form
		var form_acao_edita = $("#form_edita_acao").serializeArray();		
		// valida se todos os dados estao preenchidos
		$.each(form_acao_edita, function(pos, obj) {
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
			if (pos == (form_acao_edita.length - 1)) {
				$("#form_edita_acao").submit();
			}
		});				
	});

	$("#col-error-editar").click( function() {			
		$("#col-error-editar").hide("fade", 100, function() {
			$("#col-error-editar")
			.html('<h4 class="modal-title">Ação - Alteração</h4>')
			.show("fade", 350);					
		});				
	});
});	
	
</script>