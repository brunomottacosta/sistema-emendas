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

				<h4 class="modal-title">Objeto - Novo</h4>

			</div>
			
			<div class="modal-body">

				<form action="salvar" method="POST" role="form" id="form_novo_objeto">									
								
					<div class="form-group">						
						<label>Nome</label>
						<input type="text" id="objeto_nome" name="nome" class="form-control">					
					</div>
					
					<div class="form-group">
						<label class="control-label">Programa</label> 
						<select id=objeto_programa 
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
						<select id="objeto_acao" 
						data-live-search="true"
						class="form-control selectpicker" 
						name="idAcao">
							<!-- LISTA DE ACOES POR PROGRAMA -->	
						</select> 
					</div>	
											
					<div class="form-group">			
						<button id="salvar_objeto" class="btn btn-info btn-block">
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
	$("#salvar_objeto").click( function() {
		$("#form_novo_objeto").submit();
	});
});

// inicia combobox para selecionar acao
(function acoes() {
	var id = $("#objeto_programa").val();
	$.ajax({
		type: "GET",
		url: "../acao/lista/programa/" + id,
		success: function(json) {
			$.each(json, function(pos, obj) {
				$("#objeto_acao")
				.append("<option value='" + obj.id + "'>" + obj.nome + "</option>")
				.selectpicker("refresh");
			});
		}
	});	
})();

// troca a lista do combobox de acao de acordo com o programa
$("#objeto_programa").on("change", function() {
	$("#objeto_acao").empty();
	var id = $("#objeto_programa").val();
	$("#tb_select_acao tbody").children("tr").remove();
	$.ajax({
		type: "GET",
		url: "../acao/lista/programa/" + id,
		success: function(json) {
			if (json.length == 0) {
				$("#objeto_acao").selectpicker("refresh");
			} else {
				$.each(json, function(pos, obj) {				
					$("#objeto_acao")
					.append("<option value='" + obj.id + "'>" + obj.nome + "</option>")
					.selectpicker("refresh");
				});				
			}
		}
	});	
});
	
</script>