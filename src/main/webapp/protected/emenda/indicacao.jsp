<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container-fluid">

	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h2 class="text-info">Indicação - Emenda: <span class="text-primary" style="font-size: 90%">${emenda.numero} - ${emenda.ano}</span></h2>
			</div>
		</div>
	</div> 
	
	<div class="row">
		<div class="col-md-12">
			
			<a href="../visualizar/${emenda.id}" class="btn btn-default">
				<i class="fa fa-arrow-left"></i> Voltar para Emenda 
			</a>

		</div>
	</div>  
	
	<div class="row" style="margin-top: 20px">
		<div class="col-md-6">
			<div class="panel panel-default">
				<div class="panel-body">
				
					<form action="salvar" method="post" id="form_ind_emenda" role="form"> 
						
						<input type="hidden" name="emenda" value="${emenda.id}">
						<input type="hidden" name="indicacao" value="${indicacao.id}">						
						
						<div class="form-group">
							<label>Orgão Convenente</label>
							<div class="row">
								<div class="col-md-10">
									<select id="convenente" name="convenente"
									class="form-control selectpicker"
									data-live-search="true">
										<c:forEach items="${convenentes}" var="conv_var">
											<option value="${conv_var.id}">${conv_var.nome}</option>
										</c:forEach>					
									</select>
								</div>
								<div class="col-md-2">
									<a class="btn btn-info btn-block" data-toggle="modal" data-target="#new_convenente_modal">
										<i class="fa fa-plus"></i>
									</a>
								</div>	
							</div>		
						</div>
						
						<div class="form-group">
							<label>Objeto</label>
							<div class="row">
								<div class="col-md-10">
									<select id="objeto" name="objeto"
									class="form-control selectpicker"
									data-live-search="true">
										<c:forEach items="${objetos}" var="objeto_var">
											<option value="${objeto_var.id}">${objeto_var.nome}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-2">
									<a class="btn btn-info btn-block" data-toggle="modal" data-target="#new_objeto_modal">
										<i class="fa fa-plus"></i>
									</a>
								</div>							
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label">Valor Destinado</label>													
							<input type="text" name="valor" id="valor" class="form-control money"> 
						</div>						
						
						<div class="row">
							<div class="col-xs-2">
								<input type="submit" class="btn btn-primary" value="Salvar" >
							</div>
							<div class="col-xs-10">
								<c:if test="${!empty error}">
									<button class="btn btn-danger btn-block" disabled="disabled">
										<i class="fa fa-exclamation-triangle"></i> ${error}
									</button>
								</c:if>
							</div>
						</div>						
						
					</form>
					
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="panel panel-default">
				<table class="table table-bordered">
					<tr>
						<fmt:formatNumber value="${emenda.valor}" var="valor_fmt" minFractionDigits="2" />
						<td class="col-md-4"><strong>Total Valor Emenda (R$)</strong></td>
						<td class="text-info">${valor_fmt}</td>
					</tr>
					<tr>
						<fmt:formatNumber value="${valorUtilizado}" var="valor_util_fmt" minFractionDigits="2" />
						<td><strong>Valor Utilizado (R$)</strong></td>
						<td class="text-danger">${valor_util_fmt}</td>
					</tr>
					<tr>
						<fmt:formatNumber value="${valorDisponivel}" var="valor_disp_fmt" minFractionDigits="2" />
						<td><strong>Valor Disponível (R$)</strong></td>
						<td class="text-success">${valor_disp_fmt}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	<div class="row" style="margin-top: 20px">
		<div class="col-md-12">
			<div class="panel panel-default">
				<table id="tb_indicacao" class="table">
					<thead>
						<tr>
							<th>Objeto</th>
							<th>Orgão Convenente</th>
							<th>Valor Destinado (R$)</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty indicacoes}">
							<tr>
								<td class="text-danger">Nenhuma indicação adicionada.</td>
							</tr>
						</c:if>
						<c:if test="${!empty indicacoes}">
							<c:forEach items="${indicacoes}" var="ind">
								<tr class="text-info">
									<fmt:formatNumber value="${ind.valorDestinado}" var="valor_ind_fmt"  minFractionDigits="2" />
									<td id="${ind.objeto.nome}">${ind.objeto.nome}</td>
									<td id="${ind.convenente.nome}">${ind.convenente.nome}</td>
									<td id="${valor_ind_fmt}">${valor_ind_fmt}</td>
									<td>
										<a href="#" id="edit_${ind.id}"
										onclick="edita_ajax(${ind.id},'${valor_ind_fmt}',${ind.objeto.id},${ind.convenente.id})">
											<i class="fa fa-pencil"></i>
										</a>
									</td>
									<td id="ind_${ind.id}">
										<a href="#" onclick="remover(${ind.id})">
											<i class="fa fa-trash"></i>
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

<!-- IMPORT DE MODALS PARA ADICIONAR -->
<c:import url="../../protected/modals/objeto-indicacao-modal.jsp"></c:import>
<c:import url="../../protected/modals/convenente-indicacao-modal.jsp"></c:import>
<c:import url="../../protected/modals/indicacao-editar-modal.jsp"></c:import>

<!-- ################# -->
<!-- ##### SCRIPTS ### -->
<!-- ################# -->

<script type="text/javascript">

//editar
function edita_ajax(id, valor, objeto, convenente) {		

	$("#objeto_edit").val(objeto)	
	.selectpicker("refresh");

	$("#convenente_edit").val(convenente)	
	.selectpicker("refresh");

	$("#id_edit").val(id);
	$("#valor_edit").val(valor);	
		
	$("#edit_indicacao_modal").modal("show");
}

function remover(id) {
	$.post("remover", {
		'id' : id
	}, function() {
		$("#ind_" + id).closest("tr").hide();
		$("#tb_indicacao tbody")
		.append('<tr><td class="text-danger">Nenhuma indicação adicionada.</td></tr>');
	});
}
 
</script>