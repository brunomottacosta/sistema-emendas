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
			
			<a href="../../visualizar/${emenda.id}" class="btn btn-default">
				<i class="fa fa-arrow-left"></i> Voltar para Emenda 
			</a>

		</div>
	</div>  
	
	<div class="row" style="margin-top: 20px">
		<div class="col-md-6">
			<div class="panel panel-default">
				<div class="panel-body">
				
					<form action="../salvar" method="post" id="form_ind_emenda" role="form"> 
						
						<input type="hidden" name="emenda" value="${emenda.id}">
						<input type="hidden" name="indicacao" value="${indicacao.id}">
						
						<c:if test="${error != 0}">
							<div class="alert alert-danger" role="alert">
								<i class="fa fa-exclamation-triangle"></i> Valor especificado maior que o valor disponível.
							</div>
						</c:if>
						
						<div class="form-group">
							<label>Orgão Convenente</label>
							<select id="convenente" name="convenente"
							class="form-control selectpicker"
							data-live-search="true">
								<c:forEach items="${convenentes}" var="conv_var">
									<option value="${conv_var.id}">${conv_var.nome}</option>
								</c:forEach>					
							</select>
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
							<input type="text" name="valor" id="valor" class="form-control"> 
						</div>						
						
						<input type="submit" class="btn btn-primary" value="Salvar">
						
					</form>
					
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="panel panel-default">
				<table class="table table-bordered">
					<tr>
						<fmt:formatNumber value="${emenda.valor}" var="valor_fmt" type="currency" minFractionDigits="2" currencySymbol="R$"/>
						<td class="col-md-4"><strong>Total Valor Emenda</strong></td>
						<td class="text-info">${valor_fmt}</td>
					</tr>
					<tr>
						<fmt:formatNumber value="${valorUtilizado}" var="valor_util_fmt" type="currency" minFractionDigits="2" currencySymbol="R$"/>
						<td><strong>Valor Utilizado</strong></td>
						<td class="text-danger">${valor_util_fmt}</td>
					</tr>
					<tr>
						<fmt:formatNumber value="${valorDisponivel}" var="valor_disp_fmt" type="currency" minFractionDigits="2" currencySymbol="R$"/>
						<td><strong>Valor Disponível</strong></td>
						<td class="text-success">${valor_disp_fmt}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	<div class="row" style="margin-top: 20px">
		<div class="col-md-12">
			<div class="panel panel-default">
				<table class="table">
					<thead>
						<tr>
							<th>Objeto</th>
							<th>Orgão Convenente</th>
							<th>Valor Destinado</th>
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
									<fmt:formatNumber value="${ind.valorDestinado}" var="valor_ind_fmt" type="currency" minFractionDigits="2" currencySymbol="R$"/>
									<td>${ind.objeto.nome}</td>
									<td>${ind.convenente.nome}</td>
									<td>${valor_ind_fmt}</td>
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
<c:import url="../modals/objeto-indicacao-modal.jsp"></c:import>

<!-- ################# -->
<!-- ##### SCRIPTS ### -->
<!-- ################# -->

<SCRIPT TYPE="TEXT/JAVASCRIPT">



 
</SCRIPT>