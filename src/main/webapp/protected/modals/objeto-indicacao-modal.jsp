<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- MODAL PARA NOVO PRODUTO -->
<div class="modal fade" id="new_objeto_modal" tabindex="-1" role="dialog"  aria-hidden="true">

	<div class="modal-dialog">

		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				
				<div id="col-error-obj">
					<h4 class="modal-title">Objeto - Novo</h4>				
				</div>

			</div>
			
			<div class="modal-body">

				<form action="../../objeto/salvarEmIndicacao" method="POST" role="form" id="form_novo_objeto">									
					
					<input type="hidden" value="${emenda.acao.id}" id="acao_id" name="idAcao">
					<input type="hidden" value="${emenda.id}" id="emenda_id" name="idEmenda"> 			
								
					<div class="form-group">						
						<label>Nome</label>
						<input type="text" id="objeto_nome" name="nome" class="form-control">					
					</div>					
											
					<div class="form-group">			
						<button id="salvar_objeto" class="btn btn-info btn-block" type="button">
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

//salvar
$(document).ready( function() {
	$("#salvar_objeto").click( function() {
		// serializa em array o form
		var form_objeto_salvar = $("#form_novo_objeto").serializeArray();		
		// valida se todos os dados estao preenchidos
		$.each(form_objeto_salvar, function(pos, obj) {
			if (obj.value <= 0) {
				$("#col-error-obj").hide("fade", 100, function() {
					$("#col-error-salvar")
					.html('<h4 class="modal-title text-danger">' +
							'Erro! Preencha todos os campos.' +
							'</h4>')
					.show("fade", 350);					
				});				
				return false;		
			}
			if (pos == (form_objeto_salvar.length - 1)) {
				$("#form_novo_objeto").submit();
			}
		});				
	});

	$("#col-error-obj").click( function() {			
		$("#col-error-obj").hide("fade", 100, function() {
			$("#col-error-obj")
			.html('<h4 class="modal-title">Objeto - Novo</h4>')
			.show("fade", 350);					
		});				
	});
});	
	
</script>