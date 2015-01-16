<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="container-fluid">

	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h2 class="text-info">Emenda: <span class="text-primary" style="font-size: 90%">${emenda.numero} - ${emenda.ano}</span></h2>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-12">
			
			<a href="../indicacao/${emenda.id}" class="btn btn-info">
				Lista de Indicações <i class="fa fa-arrow-right"></i>
			</a>
			<a href="../edicao/${emenda.id}" class="btn btn-danger pull-right">
				<i class="fa fa-pencil"></i> Editar Emenda 
			</a>

		</div>
	</div>  
	
	<div class="row" style="margin-top: 20px">
		<div class="col-md-6">
			<div class="panel panel-default">
				<table class="table table-bordered">
					<fmt:formatNumber type="currency" minFractionDigits="2" currencySymbol="R$" value="${emenda.valor}" var="valor_fmt" />
					<tr>
						<td class="col-md-5"><strong>Número</strong></td>
						<td class="text-info">${emenda.numero}</td>
					</tr>
					<tr>
						<td><strong>Ano</strong></td>
						<td class="text-info">${emenda.ano}</td>
					</tr>
					<tr>
						<td><strong>Funcional Programática</strong></td>
						<td class="text-info">${emenda.funcionalProgramatica}</td>
					</tr>
					<tr>
						<td><strong>Tipo de Emenda</strong></td>
						<td class="text-info">${emenda.tipoEmenda.descricao}</td>
					</tr>
					<tr>
						<td><strong>Valor</strong></td>
						<td class="text-info">${valor_fmt}</td>
					</tr>
				</table>				
			</div>
		</div>
		<div class="col-md-6">
			<div class="panel panel-default">
				<table class="table table-bordered">				
					<tr>
						<td class="col-md-5"><strong>G.N.D.</strong></td>
						<td class="text-info">
							<c:set var="num_of_gnd" value="${fn:length(emenda.gnds)}" />
							<c:forEach items="${emenda.gnds}" var="gnd_var" varStatus="gnd_counter">
								<c:if test="${gnd_counter.count < num_of_gnd}">
									${gnd_var.descricao},								
								</c:if>
								<c:if test="${gnd_counter.count >= num_of_gnd}">
									${gnd_var.descricao}
								</c:if>
							</c:forEach>
						</td>
					</tr>				
					<tr>
						<td><strong>Modalidade de Aplicação</strong></td>
						<td class="text-info">
							<c:set var="num_of_mod" value="${fn:length(emenda.modalidades)}" />
							<c:forEach items="${emenda.modalidades}" var="mod_var" varStatus="mod_counter">
								<c:if test="${mod_counter.count < num_of_mod}">
									${mod_var.descricao}, 							
								</c:if>
								<c:if test="${mod_counter.count >= num_of_mod}">
									${mod_var.descricao}
								</c:if>								
							</c:forEach>
						</td>
					</tr>
					<tr>
						<td><strong>Autor</strong></td>
						<td class="text-info">${emenda.autor.nome}</td>
					</tr>
					<tr>
						<td><strong>Orgão Concedente</strong></td>
						<td class="text-info">${emenda.orgaoConcedente.nome}</td>
					</tr>
					<tr>
						<td><strong>Programa</strong></td>
						<td class="text-info">${emenda.programa.nome}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-6">
			<div class="panel panel-default">
				<table class="table table-bordered">				
					<tr>
						<td class="col-md-5"><strong>Ação</strong></td>					
						<td class="text-info">${emenda.acao.nome}</td>						
					</tr>
				</table>		
			</div>
		</div>
		<div class="col-md-6">
			<div class="panel panel-default">
				<table class="table table-bordered">					
					<tr>					
						<td>
							<strong>Objetos</strong>
						</td>						
						<c:forEach items="${objetosAssociados}" var="obj">										
							<tr>
								<td class="text-info">${obj.nome}</td>
								<td class="text-info">${obj.acao.nome}</td>							
							</tr>
						</c:forEach>													
					</tr>
				</table>							
			</div>
		</div>		
	</div>
		
</div>	


<!-- ################# -->
<!-- ##### SCRIPTS ### -->
<!-- ################# -->

<script type="text/javascript">



 
</script>