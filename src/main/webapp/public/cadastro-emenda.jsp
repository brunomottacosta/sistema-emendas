<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<div class="container-fluid">	

	<div class="row">
	
		<div class="col-md-12">		
			
			<!-- ################# -->	
			<!-- FORMULARIO EMENDA -->
			<!-- ################# -->
			
			<div class="page-header">
  				<h2 class="text-info">Formulário para Cadastro</h2>
			</div>
					
			<form action="salvar" method="post" id="form_nova_emenda" role="form">
				
				<input type="hidden" value="${emenda.id}" name="id">
				<input type="hidden" value="${modo}" name="modo">
							
				<div class="row">
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Numero</label> 
							<input type="text" name="numero" id="num_emenda" 
							class="form-control num-emenda" value="${emenda.numero}"> 
						</div>
						<div class="form-group">
							<label class="control-label">Funcinoal Programática</label> 
							<input type="text" name="funcProg" id="fnc_prog_emenda" 
							class="form-control fnc-prog-emenda" value="${emenda.funcionalProgramatica}"> 
						</div>
						<div class="form-group">
							<label class="control-label">Ano</label>
							<input type="text" name="ano" id="ano_emenda" 
							class="form-control input-sm ano-emenda" 
							value="${emenda.ano}"> 
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Valor</label>	
							<fmt:formatNumber value="${emenda.valor}" var="valor_fmt"  minFractionDigits="2"  />							
							<input type="text" name="valor" id="valor_emenda" 
							class="form-control money" value="${valor_fmt}" maxlength="20"> 
						</div>	
						<div class="form-group">
							<label class="control-label">G.N.D.</label> 
							<select id="gnd_emenda" data-live-search="true"
							class="form-control selectpicker" name="gnd">
								<c:if test="${!empty emenda.gnd}">
									<option value="${emenda.gnd.id}">
										${emenda.gnd.numero} - ${emenda.gnd.descricao}
									</option>
								</c:if>
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
						<div class="form-group">
							<label class="control-label">Modalidade de Aplicacao</label> 
							<select id="mda_emenda" data-live-search="true"
							class="form-control selectpicker" name="modApp">
								<c:if test="${!empty emenda.modalidadeDeAplicacao}">
									<option value="${emenda.modalidadeDeAplicacao.id}">
										${emenda.modalidadeDeAplicacao.numero} - ${emenda.modalidadeDeAplicacao.descricao}
									</option>
								</c:if>
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
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Tipo de Emenda</label> 
							<select id="tipo_emenda" data-live-search="true"
							class="form-control selectpicker" name="tipoEmenda">
								<c:if test="${!empty emenda.tipoEmenda}">
									<option value="${emenda.tipoEmenda.id}">
										${emenda.tipoEmenda.descricao}
									</option>
								</c:if>
								<c:forEach items="${tipoEmenda}" var="tipo_var">
									<option value="${tipo_var.id}">${tipo_var.descricao}</option>
								</c:forEach>
							</select> 
						</div>	
						<div class="form-group">
							<label class="control-label">Autor</label> 
							<select id="autor_emenda" data-live-search="true"
							class="form-control selectpicker" name="idAutor">
								<c:if test="${!empty emenda.autor}">
									<option value="${emenda.autor.id}">${emenda.autor.nome}</option>
								</c:if>
								<c:forEach items="${autores}" var="autor_var" >
									<option value="${autor_var.id}">${autor_var.nome}</option>
								</c:forEach>
							</select> 
						</div>
						<div class="form-group">
							<label class="control-label">Orgão Concedente</label> 
							<select id="org_conced_emenda" data-live-search="true"
							class="form-control selectpicker" name="idOrgaoConced">
								<c:if test="${!empty emenda.orgaoConcedente}">
									<option value="${emenda.orgaoConcedente.id}">${emenda.orgaoConcedente.nome}</option>
								</c:if>
								<c:forEach items="${orgaos}" var="org_conced_var" >
									<option value="${org_conced_var.id}">${org_conced_var.nome}</option>
								</c:forEach>
							</select> 
						</div>	
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label class="control-label">Programa</label> 
							<select id="programa_emenda" data-live-search="true"
							class="form-control selectpicker" name="idPrograma">
								<c:if test="${!empty emenda.programa}">
									<option value="${emenda.programa.id}">${emenda.programa.nome}</option>
								</c:if>							
								<c:forEach items="${programas}" var="programa_var" >
									<option value="${programa_var.id}">${programa_var.nome}</option>
								</c:forEach>
							</select> 
						</div>
						<div class="form-group">
							<label class="control-label">Ações</label>
							
							<select id="acao_emenda" data-live-search="true"
							class="form-control selectpicker" name="idAcao">
								<c:forEach items="${acoes}" var="acao_var" >
									<option value="${acao_var.id}_${acao_var.nome}">${acao_var.nome}</option>
								</c:forEach>
							</select>
							<a id="select_acao" class="btn" href="#">
								<i class="fa fa-plus"></i> Incluir
							</a>
							<table id="tb_select_acao">
								<thead>
									<tr>											
										<th></th>
										<th></th>
									</tr>
								</thead>
								<tbody>											
								</tbody>
							</table>							
							
						</div>	
					</div>
				</div>							
			</form>
			
			<!-- ##################### -->	
			<!-- FIM FORMULARIO EMENDA -->
			<!-- ##################### -->			
							
		</div>
		
	</div>
	
	<div class="row">
	
		<div class="col-md-12">
			
			<button id="btn_salvar_emenda" class="btn btn-primary"><i class="fa fa-floppy-o"></i> SALVAR</button>
			<c:if test="${modo == 1}">
				<a href="novo" class="btn btn-warning" ><i class="fa fa-close"></i> LIMPAR</a>			
			</c:if>	
			<c:if test="${modo == 2}">
				<a href="../novo" class="btn btn-warning" ><i class="fa fa-close"></i> LIMPAR</a>			
			</c:if>	
		</div>
		
	</div>		
	
</div>	


<!-- ################# -->
<!-- ##### SCRIPTS ### -->
<!-- ################# -->

<script>

$(document).ready( function() {
	$("#select_acao").click( function() {
		var split = $("#acao_emenda").val().split("_");
		var id = split[0];
		var title = split[1];
		$("#tb_select_acao tbody").append(
				"<tr>" +
				"<td id='" + id + "'>" + title + "</td>" +
				"<tr>"				
		);
		$('#acao_emenda').find('[value="'+ $("#acao_emenda").val() +'"]').remove();
		$('#acao_emenda').selectpicker("refresh");
	});
});

// salvar
$(document).ready( function() {
	$("#btn_salvar_emenda").click( function() {
		$("#form_nova_emenda").submit();
	});	
});


</script>