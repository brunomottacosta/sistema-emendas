<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="container">
	
<div class="row">

	<div class="col-md-12">		
		
		<!-- ################# -->	
		<!-- FORMULARIO EMENDA -->
		<!-- ################# -->	
		
		<div class="panel panel-transparence">
		
			<div class="panel-heading">
				
				<h4>Cadastro - Emenda</h4>
				
			</div>
			
			<div class="panel-body">
				
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
								<input type="text" name="funcional" id="fnc_prog_emenda" 
								class="form-control fnc-prog-emenda"> 
							</div>	
												
							<div class="form-group">
								<label class="control-label">Valor</label>													
								<input type="text" name="valor" id="valor_emenda" 
								class="form-control money"> 
							</div>	
							
							<div class="form-group">
								<label class="control-label">G.N.D.</label>										
								<select id="gnd_emenda" class="form-control selectpicker"
								data-live-search="true" 
								data-selected-text-format="count > 1"
								title="Selecione..."
								name="gnd" multiple="multiple">
									<c:forEach items="${gnd}" var="gnd_var" >
										<c:if test="${gnd_var.id >= 1}">
											<option value="${gnd_var.id}">
												${gnd_var.numero} - ${gnd_var.descricao}
											</option>
										</c:if>									
									</c:forEach>
								</select>
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
											<option value="0">Selecione...</option>
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
									<option value="0">Selecione...</option>
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
									<option value="0">Selecione...</option>	
									<c:forEach items="${orgaos}" var="org_conced_var" >
										<option value="${org_conced_var.id}">${org_conced_var.nome}</option>
									</c:forEach>
								</select> 
							</div>
							
							<div class="form-group">
								<label class="control-label">Modalidade de Aplicacao</label>					
								<select id="mda_emenda" 
								class="form-control selectpicker"
								data-live-search="true"
								data-selected-text-format="count > 2"
								title="Selecione..."
								name="modalidade" multiple="multiple">								
									<c:forEach items="${modalidadeDeAplicacao}" var="mda_var">
										<c:if test="${mda_var.id >= 1}">
											<option value="${mda_var.id}">																								
													${mda_var.numero} - ${mda_var.descricao}
											</option> 
										</c:if>
									</c:forEach>
								</select>										
							</div>
								
						</div>					
						<div class="col-md-4">
						
							<div class="form-group">
								<label class="control-label">Programa</label> 
								<select id="programa_emenda" 
								data-live-search="true"
								class="form-control selectpicker" 
								name="idPrograma">
									<option value="0">Selecione...</option>			
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
			
			<div class="panel-footer panel-footer-transparence">
			
				<div class="row">
					<div class="col-md-2">
						<button id="btn_salvar_emenda" class="btn btn-transparence btn-green">
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
					
					<div class="col-md-2">	
						<a href="novo" class="btn btn-transparence btn-red pull-right" >
							<i class="fa fa-close"></i> LIMPAR
						</a>			
					</div>		
				</div>
				
			</div>
			
		</div>			
						
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
		.append("<option value='0'>Selecione o Programa...</option>")
		.attr("disabled", true)		
		.selectpicker("refresh");
	} else {
		$.ajax({
			type: "GET",
			url: "../../acao/lista/programa/" + id,
			success: function(json) {
				$.each(json, function(pos, obj) {
					$("#acao_emenda")
					.append("<option value='" + obj.id + "'>" + obj.nome + "</option>")
					.attr("disabled", false)						
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
		.append("<option value='0'>Selecione o Programa...</option>")	
		.attr("disabled", true)		
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
						.attr("disabled", false)					
						.selectpicker("refresh");
					});				
				}
			}
		});	
	}
});

// salvar
$(document).ready( function() {
	$("#btn_salvar_emenda").click( function() {	
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
			else if(pos == (data.length - 1)) {
				if ($("#mda_emenda").val() != null && $("#gnd_emenda").val() != null) {
					$("#form_nova_emenda").submit();
					return true;
				} else {
					$("#col-error").hide("fade", 100, function() {
						$("#col-error")
						.html('<button class="btn btn-danger btn-block" disabled="disabled">' +
								'Erro! Preencha todos os campos.' +
								'</button>')
						.show("fade", 350);					
					});
					return false;
				}
			}
			return true;
		});	
	});	 
});

</script>