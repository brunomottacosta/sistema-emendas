<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- MODAL PARA NOVO AUTOR -->
<div class="modal fade" id="new_acao_modal" tabindex="-1" role="dialog"  aria-hidden="true">

	<div class="modal-dialog">

		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				
				<div id="col-error-salvar">
					<h4 class="modal-title">Ação - Novo</h4>
				</div>

			</div>
			
			<div class="modal-body">

				<form action="salvar" method="POST" role="form" id="form_novo_acao">									
								
					<div class="form-group">						
						<label>Nome</label>
						<input type="text" id="acao_nome" name="nome" class="form-control">					
					</div>
					
					<div class="form-group">
						<label>Programa</label>
						<select id="acao_prog" data-live-search="true"
						class="form-control drop-pesquisa selectpicker" name="idPrograma">										
							<option value="0">Selecione</option>
							<c:forEach items="${programas}" var="prog_var" >
								<option value="${prog_var.id}">
									${prog_var.nome}
								</option>
							</c:forEach>
						</select> 
					</div>
											
					<div class="form-group">			
						<button id="salvar_acao" class="btn btn-primary btn-block" type="button">
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
	$("#salvar_acao").click( function() {
		// serializa em array o form
		var form_acao_salvar = $("#form_novo_acao").serializeArray();		
		// valida se todos os dados estao preenchidos
		$.each(form_acao_salvar, function(pos, obj) {
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
			if (pos == (form_acao_salvar.length - 1)) {
				$("#form_novo_acao").submit();
			}
		});				
	});

	$("#col-error-salvar").click( function() {			
		$("#col-error-salvar").hide("fade", 100, function() {
			$("#col-error-salvar")
			.html('<h4 class="modal-title">Ação - Novo</h4>')
			.show("fade", 350);					
		});				
	});
});	

</script>