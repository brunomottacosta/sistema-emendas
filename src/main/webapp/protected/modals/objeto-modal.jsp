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
				
				<div id="col-error-salvar">
					<h4 class="modal-title">Objeto - Novo</h4>
				</div>				

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
							<option value="0">Selecione</option>			
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
						<button id="salvar_objeto" class="btn btn-info btn-block" type="button">
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
	$("#salvar_objeto").click( function() {
		// serializa em array o form
		var form_objeto_salvar = $("#form_novo_objeto").serializeArray();		
		// valida se todos os dados estao preenchidos
		$.each(form_objeto_salvar, function(pos, obj) {
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
			if (pos == (form_objeto_salvar.length - 1)) {
				$("#form_novo_objeto").submit();
			}
		});				
	});

	$("#col-error-salvar").click( function() {			
		$("#col-error-salvar").hide("fade", 100, function() {
			$("#col-error-salvar")
			.html('<h4 class="modal-title">Objeto - Novo</h4>')
			.show("fade", 350);					
		});				
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