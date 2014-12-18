<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<div class="container-fluid">

	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h2 class="text-info">Emenda: <span class="text-primary" style="font-size: 90%">${emenda.numero} - ${emenda.ano}</span></h2>
			</div>
		</div>
	</div> 
	
	<div class="row">
		<div class="col-md-6">
			<div class="panel panel-default">
				<table class="table table-bordered">
					<fmt:formatNumber type="currency" minFractionDigits="2" currencySymbol="R$" value="${emenda.valor}" var="valor_fmt" />
					<tr>
						<td style="width: 40%"><strong>Número</strong></td>
						<td>${emenda.numero}</td>
					</tr>
					<tr>
						<td><strong>Ano</strong></td>
						<td>${emenda.ano}</td>
					</tr>
					<tr>
						<td><strong>Funcional Programática</strong></td>
						<td>${emenda.funcionalProgramatica}</td>
					</tr>
					<tr>
						<td><strong>Tipo de Emenda</strong></td>
						<td>${emenda.tipoEmenda.descricao}</td>
					</tr>
					<tr>
						<td><strong>Valor</strong></td>
						<td>${valor_fmt}</td>
					</tr>
				</table>				
			</div>
		</div>
		<div class="col-md-6">
			<div class="panel panel-default">
				<table class="table table-bordered">				
					<tr>
						<td style="width: 40%"><strong>G.N.D.</strong></td>
						<td>${emenda.gnd.descricao}</td>
					</tr>				
					<tr>
						<td><strong>Modalidade de Aplicação</strong></td>
						<td>${emenda.modalidadeDeAplicacao.descricao}</td>
					</tr>
					<tr>
						<td><strong>Autor</strong></td>
						<td>${emenda.autor.nome}</td>
					</tr>
					<tr>
						<td><strong>Orgão Concedente</strong></td>
						<td>${emenda.orgaoConcedente.nome}</td>
					</tr>
					<tr>
						<td><strong>Programa</strong></td>
						<td>${emenda.programa.nome}</td>
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
						<td style="width: 40%"><strong>Ações</strong></td>
						<td>
							<c:forEach items="${acoesDaEmenda}" var="acao">
								<p>${acao.nome}</p>								
							</c:forEach>
						</td>
					</tr>
				</table>		
			</div>
		</div>
		<div class="col-md-6">
			<div class="panel panel-default">
				<table class="table table-bordered">				
					<tr>
						<td style="width: 40%"><strong>Objetos</strong></td>
						<td>
							<c:forEach items="${objetosDaEmenda}" var="obj">
								<p>${obj.nome}</p>								
							</c:forEach>
						</td>
						<td>
							<c:forEach items="${objetosDaEmenda}" var="obj">
								<p>${obj.acao.nome}</p>								
							</c:forEach>
						</td>
					</tr>
				</table>		
			</div>
		</div>		
	</div>
	
</div>	


<!-- ################# -->
<!-- ##### SCRIPTS ### -->
<!-- ################# -->

<script>



 
</script>