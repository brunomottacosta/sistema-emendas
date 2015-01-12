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
					
			<form action="salvar" method="post" id="form_nova_emenda" role="form">				
							
				<div class="row">
					<div class="col-md-4">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">Numero</label> 
									<input type="text" name="numero" id="num_emenda" 
									class="form-control num-emenda">
					                 
								</div>							
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">Ano</label>
									<input type="text" name="ano" id="ano_emenda" 
									class="form-control ano-emenda"> 
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label">Funcional Programática</label> 
							<input type="text" name="funcProg" id="fnc_prog_emenda" 
							class="form-control fnc-prog-emenda"> 
						</div>						
						<div class="form-group">
							<label class="control-label">Valor</label>													
							<input type="text" name="valor" id="valor_emenda" 
							class="form-control money"> 
						</div>	
						<div class="form-group">
							<label class="control-label">G.N.D.</label>
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="row">
										<div class="col-md-2">
											<a id="select_gnd" href="#" class="btn btn-default">
												<i class="fa fa-plus"></i>
											</a>
										</div>
										<div class="col-md-10">  
											<select id="gnd_emenda" data-live-search="true"
											class="form-control selectpicker">	
												<option value="0">Selecione</option>
												<c:forEach items="${gnd}" var="gnd_var" >
													<c:if test="${gnd_var.id >= 1}">
														<option value="${gnd_var.id}_${gnd_var.descricao}">
															${gnd_var.numero} - ${gnd_var.descricao}
														</option>
													</c:if>									
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
								<div class="panel-body">
									<table class="table" id="tb_select_gnd">							
										<tbody>											
										</tbody>
									</table>	
								</div>								
							</div>  
						</div>								
					</div>
					<div class="col-md-4">						
						<div class="form-group">
							<label class="control-label">Tipo de Emenda</label> 
							<select id="tipo_emenda" 
							data-live-search="true"
							class="form-control selectpicker" 
							name="tipoEmenda">
								<c:forEach items="${tipoEmenda}" var="tipo_var">
									<c:if test="${tipo_var.id == 0}">
										<option value="">Selecione</option>
									</c:if>	
									<c:if test="${tipo_var.id >= 1}">
										<option value="${tipo_var.id}">${tipo_var.descricao}</option>
									</c:if>	
								</c:forEach>
							</select> 
						</div>	
						<div class="form-group">
							<label class="control-label">Autor</label> 
							<select id="autor_emenda" 
							data-live-search="true"
							class="form-control selectpicker"
							name="idAutor">
								<option value="0">Selecione</option>
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
								<option value="0">Selecione</option>	
								<c:forEach items="${orgaos}" var="org_conced_var" >
									<option value="${org_conced_var.id}">${org_conced_var.nome}</option>
								</c:forEach>
							</select> 
						</div>
						<div class="form-group">
							<label class="control-label">Modalidade de Aplicacao</label>
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="row">
										<div class="col-md-2">
											<a id="select_modalidade" href="#" class="btn btn-default">
												<i class="fa fa-plus"></i>
											</a>
										</div>
										<div class="col-md-10"> 
											<select id="mda_emenda" data-live-search="true"
											class="form-control selectpicker">		
												<option value="0">Selecione</option>
												<c:forEach items="${modalidadeDeAplicacao}" var="mda_var">
													<c:if test="${mda_var.id >= 1}">
														<option value="${mda_var.id}_${mda_var.descricao}">																								
																${mda_var.numero} - ${mda_var.descricao}
														</option> 
													</c:if>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
								<div class="panel-body">
									<table class="table" id="tb_select_modalidade">							
										<tbody>											
										</tbody>
									</table>	
								</div>								
							</div> 
						</div>	
					</div>					
					<div class="col-md-4">
						<div class="form-group">
							<label class="control-label">Programa</label> 
							<select id="programa_emenda" 
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
							<select id="acao_emenda" 
							data-live-search="true"
							class="form-control selectpicker" 
							name="idAcao">
								<!-- LISTA DE ACOES POR PROGRAMA -->	
							</select> 
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
	if (id == 0) {
		$("#acao_emenda")
		.append("<option value='0'>Selecione o Programa</option>")		
		.selectpicker("refresh");
	} else {
		$.ajax({
			type: "GET",
			url: "../../acao/lista/programa/" + id,
			success: function(json) {
				$.each(json, function(pos, obj) {
					$("#acao_emenda")
					.append("<option value='" + obj.id + "'>" + obj.nome + "</option>")					
					.selectpicker("refresh");
				});
			}
		});	
	}
})();

// troca a lista do combobox de acao de acordo com o programa
$("#programa_emenda").on("change", function() {
	$("#acao_emenda").empty();
	var id = $("#programa_emenda").val();
	$("#tb_select_acao tbody").children("tr").remove();
	if (id == 0) {
		$("#acao_emenda")
		.append("<option value='0'>Selecione o Programa</option>")		
		.selectpicker("refresh");
	} else {
		$.ajax({
			type: "GET",
			url: "../../acao/lista/programa/" + id,
			success: function(json) {
				if (json.length == 0) {
					$("#acao_emenda").selectpicker("refresh");
				} else {
					$.each(json, function(pos, obj) {				
						$("#acao_emenda")
						.append("<option value='" + obj.id + "'>" + obj.nome + "</option>")						
						.selectpicker("refresh");
					});				
				}
			}
		});	
	}
});

// incluir modalidade a lista para adicionar
$(document).ready( function() {
	$("#select_modalidade").click( function() {
		if ($("#mda_emenda").val() != null) {			
			var value = $("#mda_emenda").val();
			var split = value.split("_");
			var id = split[0];
			var title = split[1];
			if (split[0] > 0) {
				$("#tb_select_modalidade tbody")
				.append(
					"<tr id='" + id + "'>" +
					"<td class='add-modalidade' style='width:95%; border-top: 0px;'>" + id + " - " + title + "</td>" +
					"<td id='mod_" + id + "' style='width:5%; border-top: 0px;'>" +
					"<a href='#' id='" + value + "' onclick='removerMod(this)'><i class='fa fa-close' style='color:red'></i></a></td>" +
					"</tr>"				
				);
				$('#mda_emenda').find('[value="'+ value +'"]').remove();
				$('#mda_emenda').selectpicker("refresh");
			}
		} 
	});
});

//incluir gnd a lista para adicionar
$(document).ready( function() {
	$("#select_gnd").click( function() {
		if ($("#gnd_emenda").val() != null) {			
			var value = $("#gnd_emenda").val();
			var split = value.split("_");
			var id = split[0];
			var title = split[1];
			if (split[0] > 0) {
				$("#tb_select_gnd tbody")
				.append(
					"<tr id='" + id + "'>" +
					"<td class='add-gnd' style='width:95%; border-top: 0px;'>" + id + " - " + title + "</td>" +
					"<td id='gnd_" + id + "' style='width:5%; border-top: 0px;'>" +
					"<a href='#' id='" + value + "' onclick='removerGnd(this)'><i class='fa fa-close' style='color:red'></i></a></td>" +
					"</tr>"				
				);
				$('#gnd_emenda').find('[value="'+ value +'"]').remove();
				$('#gnd_emenda').selectpicker("refresh");
			}
		} 
	});
});

// remover modalidade da lista para adicionar
function removerMod(obj) {	
	var split = obj.id.split("_");
	var id = split[0];
	var title = split[1];
	$("#mod_" + id).closest("tr").remove();
	$("#mda_emenda")
	.append("<option value='" + obj.id + "'>" + id + " - " + title + "</option>")
	.selectpicker("refresh");	
}

//remover gnd da lista para adicionar
function removerGnd(obj) {	
	var split = obj.id.split("_");
	var id = split[0];
	var title = split[1];
	$("#gnd_" + id).closest("tr").remove();
	$("#gnd_emenda")
	.append("<option value='" + obj.id + "'>" + id + " - " + title + "</option>")
	.selectpicker("refresh");	
}

// salvar
$(document).ready( function() {
	$("#btn_salvar_emenda").click( function() {

		if ($("#gnd_multi") != null) {
			$("#gnd_multi").remove();
		}
		if ($("#mod_multi") != null) {
			$("#mod_multi").remove();
		}
		
		var trs_gnd = $("#tb_select_gnd tbody").children("tr");
		var trs_modalidade = $("#tb_select_modalidade tbody").children("tr");		
		
		$("#form_nova_emenda")
		.append("<select id='gnd_multi' name='gnd' multiple='multiple' hidden='hidden'>" +
				"<option value='0' selected='selected'></option>" +
				"</select>" +
				"<select id='mod_multi' name='modApp' multiple='multiple' hidden='hidden'>" +
				"<option value='0' selected='selected'></option>" +
				"</select>")
		
		// checa se tem objetos selecionados, se tiver remove o valor default		
		if (trs_gnd.length > 0) {
			$("#gnd_multi").children("option").remove();
		}
		// checa se tem objetos selecionados, se tiver remove o valor default
		if (trs_modalidade.length > 0) {
			$("#mod_multi").children("option").remove();
		}
		// cria <option> para cada objeto selecionado na lista
		$.each(trs_gnd, function(pos, obj) {
			$("#gnd_multi")
			.append("<option value='" + obj.id + "' selected='selected'></option>");
		});
		// cria <option> para cada objeto selecionado na lista
		$.each(trs_modalidade, function(pos, obj) {
			$("#mod_multi")
			.append("<option value='" + obj.id + "' selected='selected'></option>");
		});
		
		$("#form_nova_emenda").submit();	
	});	 
});



</script>