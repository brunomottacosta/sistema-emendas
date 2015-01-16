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
		<div class="col-md-2">
			<button id="btn_salvar_emenda" class="btn btn-primary">
				<i class="fa fa-floppy-o"></i> SALVAR
			</button>			
		</div>
		
		<div class="col-md-8">
			<div id="col-error">
				<c:if test="${!empty error}">
					<button class="btn btn-danger btn-block" disabled="disabled">Erro! Preencha todos os campos.</button>
				</c:if>					
			</div>
		</div>				
	</div>
		
	<div class="row">
	
		<div class="col-md-12">		
			
			<!-- ################# -->	
			<!-- FORMULARIO EMENDA -->
			<!-- ################# -->			
					
			<form action="../editar" method="post" id="form_nova_emenda" role="form">				
							
				<input type="hidden" name="id" value="${emenda.id}">			
							
				<div class="row">	
					<div class="col-md-4">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">Numero</label> 
									<input type="text" name="numero" id="num_emenda" 
									class="form-control num-emenda" value="${emenda.numero}">
					                 
								</div>							
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">Ano</label>
									<input type="text" name="ano" id="ano_emenda" 
									class="form-control ano-emenda" value="${emenda.ano}"> 
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label">Funcional Programática</label> 
							<input type="text" name="funcProg" id="fnc_prog_emenda" 
							class="form-control fnc-prog-emenda" value="${emenda.funcionalProgramatica}"> 
						</div>						
						<div class="form-group">
							<fmt:formatNumber minFractionDigits="2" value="${emenda.valor}" var="valor_fmt" />
							<label class="control-label">Valor (R$)</label>													
							<input type="text" name="valor" id="valor_emenda" 
							class="form-control money" value="${valor_fmt}"> 
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
														<option value="${gnd_var.id}_${gnd_var.descricao}_${gnd_var.numero}">
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
											<c:if test="${!empty emenda.gnds}">
												<c:forEach items="${emenda.gnds}" var="gnd_var">
													<tr id='${gnd_var.id}'>
														<td class='add-gnd' 
														style='width:95%; border-top: 0px;'>
															${gnd_var.numero} - ${gnd_var.descricao}
														</td>
														<td id='mod_${gnd_var.id}' 
															style='width:5%; border-top: 0px;'>
															<a href='#' id='${gnd_var.id}_${gnd_var.descricao}_${gnd_var.numero}' 
															onclick='removerMod(this)'>
																<i class='fa fa-close' style='color:red'></i>
															</a>
														</td>
													</tr>
												</c:forEach>											
											</c:if>											
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
								<option value="${emenda.tipoEmenda.id}">${emenda.tipoEmenda.descricao}</option>
								<c:forEach items="${tipoEmenda}" var="tipo_var">
									<c:if test="${(emenda.tipoEmenda.id != tipo_var.id) && (tipo_var.id >= 1)}">										
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
								<option value="${emenda.autor.id}">${emenda.autor.nome}</option>
								<c:forEach items="${autores}" var="autor_var" >
									<c:if test="${emenda.autor.id != autor_var.id}">
										<option value="${autor_var.id}">${autor_var.nome}</option>
									</c:if>	
								</c:forEach>
							</select> 
						</div>
						<div class="form-group">
							<label class="control-label">Orgão Concedente</label> 
							<select id="org_conced_emenda" 
							data-live-search="true"
							class="form-control selectpicker" 
							name="idOrgaoConced">
								<option value="${emenda.orgaoConcedente.id}">${emenda.orgaoConcedente.nome}</option>	
								<c:forEach items="${orgaos}" var="org_conced_var" >
									<c:if test="${emenda.orgaoConcedente.id != org_conced_var.id}">
										<option value="${org_conced_var.id}">${org_conced_var.nome}</option>
									</c:if>	
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
														<option value="${mda_var.id}_${mda_var.descricao}_${mda_var.numero}">																								
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
											<c:if test="${!empty emenda.modalidades}">
												<c:forEach items="${emenda.modalidades}" var="modalidade_var">
													<tr id='${modalidade_var.id}'>
														<td class='add-modalidade' 
														style='width:95%; border-top: 0px;'>
															${modalidade_var.numero} - ${modalidade_var.descricao}
														</td>
														<td id='mod_${modalidade_var.id}' 
															style='width:5%; border-top: 0px;'>
															<a href='#' id='${modalidade_var.id}_${modalidade_var.descricao}_${modalidade_var.numero}' 
															onclick='removerMod(this)'>
																<i class='fa fa-close' style='color:red'></i>
															</a>
														</td>
													</tr>
												</c:forEach>											
											</c:if>													
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
							name="idPrograma" >
								<option value="${emenda.programa.id}" selected="selected">${emenda.programa.nome}</option>			
								<c:forEach items="${programas}" var="programa_var">
									<c:if test="${emenda.programa.id != programa_var.id}">
										<option value="${programa_var.id}">${programa_var.nome}</option>									
									</c:if>
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

// ao iniciar a página, elimina os elementos da opção de selecionar já existentes na lista
( function() {
	var trs_gnd = $("#tb_select_gnd tbody").children("tr").children("td").children("a");	
	var trs_modalidade = $("#tb_select_modalidade tbody").children("tr").children("td").children("a");	

	// remove <option> igual para cada objeto da lista
	$.each(trs_gnd, function(pos, obj) {
		$('#gnd_emenda').find('[value="'+ obj.id +'"]').remove();			
	});
	// remove <option> igual para cada objeto da lista
	$.each(trs_modalidade, function(pos, obj) {
		$('#mda_emenda').find('[value="'+ obj.id +'"]').remove();		
	});	
})();

// incluir modalidade a lista para adicionar
$(document).ready( function() {
	$("#select_modalidade").click( function() {
		if ($("#mda_emenda").val() != null) {			
			var value = $("#mda_emenda").val();
			var split = value.split("_");
			var id = split[0];
			var title = split[1];
			var num = split[2];
			if (split[0] > 0) {
				$("#tb_select_modalidade tbody")
				.append(
					"<tr id='" + id + "'>" +
					"<td class='add-modalidade' style='width:95%; border-top: 0px;'>" + num + " - " + title + "</td>" +
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
			var num = split[2];
			if (split[0] > 0) {
				$("#tb_select_gnd tbody")
				.append(
					"<tr id='" + id + "'>" +
					"<td class='add-gnd' style='width:95%; border-top: 0px;'>" + num + " - " + title + "</td>" +
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
	var num = split[2];
	$("#mod_" + id).closest("tr").remove();
	$("#mda_emenda")
	.append("<option value='" + obj.id + "'>" + num + " - " + title + "</option>")
	.selectpicker("refresh");	
}

//remover gnd da lista para adicionar
function removerGnd(obj) {	
	var split = obj.id.split("_");
	var id = split[0];
	var title = split[1];
	var num = split[2];
	$("#gnd_" + id).closest("tr").remove();
	$("#gnd_emenda")
	.append("<option value='" + obj.id + "'>" + num + " - " + title + "</option>")
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
		// serializa em array o form
		var data = $("#form_nova_emenda").serializeArray();	
		// valida se todos os dados estao preenchidos
		$.each(data, function(pos, obj) {
			if (obj.value <= 0) {
				$("#col-error").hide("fade", 100, function() {
					$("#col-error")
					.html('<button class="btn btn-danger btn-block" disabled="disabled">' +
							'Erro! Preencha todos os campos.' +
							'</button>')
					.show("fade", 350);					
				});				
				return false;		
			}
			if(pos == (data.length - 1)) {
				$("#form_nova_emenda").submit();	
			}
			return true;
		});	
	});	 
});

</script>