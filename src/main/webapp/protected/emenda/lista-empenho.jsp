<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container">

	<div class="row">
	
		<div class="col-xs-12">
			
			<div class="panel panel-transparence">
				
				<div class="panel-heading">
					<h4>
						Empenhos - Emenda: ${indicacao.emenda.numero} - ${indicacao.emenda.ano}
					</h4>
				</div>
				
				<div class="panel-body">
					
					<div class="row">
					
						<div class="col-xs-6">
						
							<form action="salvar" method="post" id="form_empenho" role="form"> 
							
								<input type="hidden" name="indicacao" value="${indicacao.id}">						
								
								<div class="row">
					
									<div class="col-xs-6">
									
										<div class="form-group">
											<label>Valor do Empenho</label>
											<input type="text" name="valorDoEmpenho" id="valorDoEmpenho" 
											class="form-control money" placeholder="0,00" maxlength="21"> 	
										</div>
									
									</div>
									<div class="col-xs-6">
									
										<div class="form-group">
											<label>Número do Empenho</label>
											<input type="text" name="numeroDoEmpenho" id="numeroDoEmpenho" 
											class="form-control"> 
										</div>
										
									</div>
								
								</div>										
								
								<div class="row">
					
									<div class="col-xs-6">
									
										<div class="form-group">
											<label class="control-label">Data do Empenho</label>													
											<input type="text" name="dataDoEmpenho" id="dataDoEmpenho" 
											class="form-control data-completa" placeholder="DD/MM/YYYY"> 
										</div>				
										
									</div>
									<div class="col-xs-6">	
										
										<div class="form-group">
											<label class="control-label">PTRES</label>													
											<input type="text" name="ptres" id="ptres" 
											class="form-control"> 
										</div>
									
									</div>																
								
								</div>
								
								<div class="row">			
									<div class="col-xs-2">
										<input type="submit" class="btn btn-success" value="Salvar" >
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
						
						<div class="col-xs-6">
							
							<table class="table table-bordered table-striped">
								<tr>						
									<td class="col-md-4"><strong>Objeto</strong></td>
									<td class="text-primary">${indicacao.objeto.nome}</td>
								</tr>
								<tr>						
									<td><strong>Orgão Convenente</strong></td>
									<td class="text-primary">${indicacao.convenente.nome}</td>
								</tr>
							</table>

							<table class="table table-bordered table-striped">
								<tr>
									<fmt:formatNumber value="${indicacao.valorDestinado}" var="valor_fmt" minFractionDigits="2" />
									<td class="col-md-4"><strong>Valor da Indicação (R$)</strong></td>
									<td class="text-primary">${valor_fmt}</td>
								</tr>
							</table>
							
						</div>
						
					</div>	
					
					<div class="row" style="margin-top: 20px">
					
						<div class="col-xs-12">
							
							<table id="tb_empenho" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>Nº do Empenho</th>
										<th>PTRES</th>
										<th>Data do Empenho</th>
										<th>Valor do Empenho (R$)</th>
										<th></th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty empenhos}">
										<tr>
											<td class="text-danger">Nenhum empenho adicionado.</td>
										</tr>
									</c:if>
									<c:if test="${!empty empenhos}">
										<c:forEach items="${empenhos}" var="e">
											<tr class="text-primary">
												<fmt:formatNumber value="${e.valorDoEmpenho}" var="valor_e_fmt"  minFractionDigits="2" />
												<fmt:formatDate value="${e.dataDoEmpenho}" var="data_e_fmt" pattern="dd/MM/yyyy"/>
												<td id="${e.numeroDoEmpenho}">${e.numeroDoEmpenho}</td>
												<td id="${e.ptres}">${e.ptres}</td>
												<td id="${data_e_fmt}">${data_e_fmt}</td>
												<td id="${valor_e_fmt}">${valor_e_fmt}</td>
												<td style="text-align: center">
													<a href="#" id="edit_${e.id}"
													onclick="edita_ajax(${e.id},'${valor_e_fmt}','${data_e_fmt}',${e.numeroDoEmpenho},'${e.ptres}')">
														<i class="fa fa-pencil-square-o"></i>
													</a>
												</td>
												<td id="e_${e.id}" style="text-align: center">
													<a href="#" onclick="remover(${e.id})">
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
			
		</div>
		
	</div>
	
</div>		

<!-- IMPORT DE MODALS PARA ADICIONAR -->
<c:import url="../../protected/modals/empenho-editar-modal.jsp"></c:import>
		
<!-- ################# -->
<!-- ##### SCRIPTS ### -->
<!-- ################# -->

<script type="text/javascript">

//editar
function edita_ajax(id, valor, data, numero, ptres) {		

 	$("#id_edit").val(id);
 	$("#valor_edit").val(valor);
 	$("#ptres_edit").val(ptres);
 	$("#data_edit").val(data);
 	$("#numero_edit").val(numero);	
 		
 	$("#edit_empenho_modal").modal("show");
}
 

function remover(id) {
 	$.post("remover", {
 		'id' : id
 	}, function() {
 		$("#e_" + id).closest("tr").hide();
 		if ($("#tb_empenho tbody").children("tr").length < 2) {
			$("#tb_empenho tbody").append('<tr><td class="text-danger">Nenhum empenho adicionado.</td></tr>');
		} 	
 	});
}	

</script>