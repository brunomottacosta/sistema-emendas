<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container-fluid">

	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h2 class="text-info">Formulário para Cadastro</h2>
			</div>
		</div>
	</div>
	
	<div class="row" style="margin-bottom: 20px">
		<div class="col-md-12">
			<button id="btn_salvar_emenda" class="btn btn-primary"><i class="fa fa-floppy-o"></i> SALVAR</button>			
			<c:if test="${modo == 1}">
				<a href="novo" class="btn btn-warning pull-right" ><i class="fa fa-close"></i> LIMPAR</a>			
			</c:if>	
			<c:if test="${modo == 2}">
				<a href="../novo" class="btn btn-warning pull-right" ><i class="fa fa-close"></i> LIMPAR</a>			
			</c:if>
		</div>
	</div>
		
	<div class="row">
	
		<div class="col-md-12">		
			
			<!-- ################# -->	
			<!-- FORMULARIO EMENDA -->
			<!-- ################# -->			
					
			<form action="salvar" method="post" id="form_nova_emenda" role="form"
			  data-bv-message="This value is not valid"
		      data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
		      data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
		      data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">				
							
				<div class="row">
					<div class="col-md-3">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">Numero</label> 
									<input type="text" name="numero" id="num_emenda" 
									data-bv-notempty="true"
									class="form-control num-emenda"
                   					required data-bv-notempty-message="Este campo nao pode ser vazio."> 
								</div>							
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">Ano</label>
									<input type="text" name="ano" id="ano_emenda" 
									class="form-control ano-emenda" 									
									data-bv-notempty="true"
									class="form-control num-emenda"
                   					required data-bv-notempty-message="Este campo nao pode ser vazio."> 
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label">Funcional Programática</label> 
							<input type="text" name="funcProg" id="fnc_prog_emenda" 
							class="form-control fnc-prog-emenda"
							data-bv-notempty="true"
							class="form-control num-emenda"
           					required data-bv-notempty-message="Este campo nao pode ser vazio."> 
						</div>						
						<div class="form-group">
							<label class="control-label">Valor</label>													
							<input type="text" name="valor" id="valor_emenda" 
							class="form-control money" maxlength="20"> 
						</div>	
						<div class="form-group">
							<label class="control-label">G.N.D.</label> 
							<select id="gnd_emenda" data-live-search="true"
							class="form-control selectpicker" name="gnd">	
								<c:forEach items="${gnd}" var="gnd_var" >
									<option value="${gnd_var.id}">
										<c:if test="${gnd_var.id == 0}">
											${gnd_var.descricao}
										</c:if>												
										<c:if test="${gnd_var.id >= 1}">
											${gnd_var.numero} - ${gnd_var.descricao}
										</c:if>
									</option>
								</c:forEach>
							</select> 
						</div>								
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Modalidade de Aplicacao</label> 
							<select id="mda_emenda" data-live-search="true"
							class="form-control selectpicker" name="modApp">		
								<c:forEach items="${modalidadeDeAplicacao}" var="mda_var">
									<option value="${mda_var.id}">
										<c:if test="${mda_var.id == 0}">
											${mda_var.descricao}
										</c:if>												
										<c:if test="${mda_var.id >= 1}">
											${mda_var.numero} - ${mda_var.descricao}
										</c:if>
									</option>
								</c:forEach>
							</select> 
						</div>
						<div class="form-group">
							<label class="control-label">Tipo de Emenda</label> 
							<select id="tipo_emenda" 
							data-live-search="true"
							class="form-control selectpicker" 
							name="tipoEmenda">
								<c:forEach items="${tipoEmenda}" var="tipo_var">
									<option value="${tipo_var.id}">${tipo_var.descricao}</option>
								</c:forEach>
							</select> 
						</div>	
						<div class="form-group">
							<label class="control-label">Autor</label> 
							<select id="autor_emenda" 
							data-live-search="true"
							class="form-control selectpicker"
							name="idAutor">
								<c:forEach items="${autores}" var="autor_var" >
									<option value="${autor_var.id}">${autor_var.nome}</option>
								</c:forEach>
							</select> 
						</div>
						<div class="form-group">
							<label class="control-label">Orgão Concedente</label> 
							<select id="org_conced_emenda" 
							data-live-search="true"
							class="form-control selectpicker" 
							name="idOrgaoConced">
								<c:forEach items="${orgaos}" var="org_conced_var" >
									<option value="${org_conced_var.id}">${org_conced_var.nome}</option>
								</c:forEach>
							</select> 
						</div>	
					</div>					
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label">Programa</label> 
							<select id="programa_emenda" 
							data-live-search="true"
							class="form-control selectpicker" 
							name="idPrograma">			
								<c:forEach items="${programas}" var="programa_var" >
									<option value="${programa_var.id}">${programa_var.nome}</option>
								</c:forEach>
							</select> 
						</div>
						<div class="form-group">
							<label class="control-label">Ações</label>												
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="row">
										<div class="col-md-2">
											<a id="select_acao" href="#" class="btn btn-default">
												<i class="fa fa-plus"></i> Incluir
											</a>
										</div>
										<div class="col-md-10">
											<select id="acao_emenda" data-live-search="true" class="form-control selectpicker">
												<!-- LISTA DE ACOES POR PROGRAMA -->
											</select>																		
										</div>
									</div>
								</div>
								<div class="panel-body">
									<table class="table" id="tb_select_acao">							
										<tbody>											
										</tbody>
									</table>	
								</div>								
							</div>
							
						</div>	
					</div>
				</div>							
			</form>
			
			<!-- ##################### -->	
			<!-- FIM FORMULARIO EMENDA -->
			<!-- ##################### -->			
							
		</div>
		
	</div>	
	
</div>	


<!-- ################# -->
<!-- ##### SCRIPTS ### -->
<!-- ################# -->

<script>

// inicia combobox para selecionar acao
(function acoes() {
	var id = $("#programa_emenda").val();
	$.ajax({
		type: "GET",
		url: "../../acao/lista/programa/" + id,
		success: function(json) {
			$.each(json, function(pos, obj) {
				$("#acao_emenda")
				.append("<option value='" + obj.id + "_" + obj.nome +"'>" + obj.nome + "</option>")
				.selectpicker("refresh");
			});
		}
	});	
})();

// troca a lista do combobox de acao de acordo com o programa
$("#programa_emenda").on("change", function() {
	$("#acao_emenda").empty();
	var id = $("#programa_emenda").val();
	$("#tb_select_acao tbody").children("tr").remove();
	$.ajax({
		type: "GET",
		url: "../../acao/lista/programa/" + id,
		success: function(json) {
			if (json.length == 0) {
				$("#acao_emenda").selectpicker("refresh");
			} else {
				$.each(json, function(pos, obj) {				
					$("#acao_emenda")
					.append("<option value='" + obj.id + "_" + obj.nome +"'>" + obj.nome + "</option>")
					.selectpicker("refresh");
				});				
			}
		}
	});	
});

// incluir acao a lista para adicionar
$(document).ready( function() {
	$("#select_acao").click( function() {
		if ($("#acao_emenda").val() != null) {			
			var value = $("#acao_emenda").val();
			var split = value.split("_");
			var id = split[0];
			var title = split[1];
			$("#tb_select_acao tbody")
			.append(
				"<tr id='" + id + "'>" +
				"<td class='add-acao' style='width:95%; border-top: 0px;'>" + title + "</td>" +
				"<td id='ac_" + id + "' style='width:5%; border-top: 0px;'>" +
				"<a href='#' id='" + value + "' onclick='remover(this)'><i class='fa fa-close' style='color:red'></i></a></td>" +
				"</tr>"				
			);
			$('#acao_emenda').find('[value="'+ value +'"]').remove();
			$('#acao_emenda').selectpicker("refresh");
		} 
	});
});

// remover acao da lista para adicionar
function remover(obj) {	
	var split = obj.id.split("_");
	var id = split[0];
	var title = split[1];
	$("#ac_" + id).closest("tr").remove();
	$("#acao_emenda")
	.append("<option value='" + obj.id + "'>" + title + "</option>")
	.selectpicker("refresh");	
}


// salvar
$(document).ready( function() {
	$("#btn_salvar_emenda").click( function() {
		
		var trs = $("#tb_select_acao tbody").children("tr");
		
		$("#form_nova_emenda")
		.append("<select id='select-acoes' name='idAcoes' multiple='multiple' hidden='hidden'></select>");
		
		$.each(trs, function(pos, obj) {
			$("#select-acoes")
			.append("<option value='" + obj.id + "' selected='selected'></option>");
		});
		
		$("#form_nova_emenda").submit();	
	});	 
});

// $(document).ready(function() {
// 	$("#form_nova_emenda").bootstrapValidator();
// });

</script>