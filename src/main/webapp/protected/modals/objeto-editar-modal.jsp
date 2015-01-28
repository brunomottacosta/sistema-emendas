<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- MODAL PARA EDITAR OBJETO -->
<div class="modal fade" id="edit_objeto_modal" tabindex="-1" role="dialog"  aria-hidden="true">

	<div class="modal-dialog">

		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				
				<div id="col-error-editar">					
				<h4 class="modal-title">Objeto - Alteração</h4>
				</div>

			</div>
			
			<div class="modal-body">

				<form action="editar" method="POST" role="form" id="form_edita_objeto">									
					
					<input type="hidden" name="id" id="objeto_id_edit"> 
								
					<div class="form-group">
						<label>Nome</label>							
						<input type="text" id="objeto_nome_edit" name="nome" class="form-control">		
					</div>
					
					<div class="form-group">
						<label class="control-label">Programa</label> 
						<select id="objeto_programa_edit" 
						data-live-search="true"
						class="form-control selectpicker" 
						name="idPrograma">			
							<c:forEach items="${programas}" var="programa_var" >
								<option value="${programa_var.id}">${programa_var.nome}</option>
							</c:forEach>
						</select> 
					</div>
					
					<div class="form-group">
						<label class="control-label">Ação</label> 
						<select id="objeto_acao_edit" 
						data-live-search="true"
						class="form-control selectpicker" 
						name="idAcao">
							<!-- LISTA DE ACOES POR PROGRAMA -->	
						</select> 
					</div>	
											
					<div class="form-group">			
						<button id="edita_objeto" class="btn btn-primary btn-block" type="button">
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
	$("#edita_objeto").click( function() {
		// serializa em array o form
		var form_objeto_editar = $("#form_edita_objeto").serializeArray();		
		// valida se todos os dados estao preenchidos
		$.each(form_objeto_editar, function(pos, obj) {
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
			if (pos == (form_objeto_editar.length - 1)) {
				$("#form_edita_objeto").submit();
			}
		});				
	});

	$("#col-error-editar").click( function() {			
		$("#col-error-editar").hide("fade", 100, function() {
			$("#col-error-editar")
			.html('<h4 class="modal-title">Objeto - Alteração</h4>')
			.show("fade", 350);					
		});				
	});
});	

//inicia combobox para selecionar acao
(function acoes() {
	var id = $("#objeto_programa_edit").val();
	$.ajax({
		type: "GET",
		url: "../acao/lista/programa/" + id,
		success: function(json) {
			$.each(json, function(pos, obj) {
				$("#objeto_acao_edit")
				.append("<option value='" + obj.id + "'>" + obj.nome + "</option>")
				.selectpicker("refresh");
			});
		}
	});	
})();

// troca a lista do combobox de acao de acordo com o programa
$("#objeto_programa_edit").on("change", function() {
	$("#objeto_acao_edit").empty();
	var id = $("#objeto_programa_edit").val();
	$.ajax({
		type: "GET",
		url: "../acao/lista/programa/" + id,
		success: function(json) {
			if (json.length == 0) {
				$("#objeto_acao_edit").selectpicker("refresh");
			} else {
				$.each(json, function(pos, obj) {				
					$("#objeto_acao_edit")
					.append("<option value='" + obj.id + "'>" + obj.nome + "</option>")
					.selectpicker("refresh");
				});				
			}
		}
	});	
});

</script>