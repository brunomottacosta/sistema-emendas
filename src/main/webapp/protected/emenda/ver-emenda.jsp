<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="container">

	<div class="row">	
	<div class="col-xs-12">
	
		<div class="panel panel-transparence">
		
		<div class="panel-heading">
			<h4>Emenda: <span style="font-size: 90%;font-weight: bold;">${emenda.numero} - ${emenda.ano}</span></h4>
		</div>
		
		<div class="panel-body">
		
			<div class="row">	
					
				<div class="col-xs-6">
				
					<table class="table table-bordered table-striped">
						<fmt:formatNumber type="currency" minFractionDigits="2" currencySymbol="R$" value="${emenda.valor}" var="valor_fmt" />
						<tr>
							<td class="col-md-5"><strong>Número</strong></td>
							<td class="text-primary">${emenda.numero}</td>
						</tr>
						<tr>
							<td><strong>Ano</strong></td>
							<td class="text-primary">${emenda.ano}</td>
						</tr>
						<tr>
							<td><strong>Autor</strong></td>
							<td class="text-primary">${emenda.autor.nome}</td>
						</tr>
						<tr>
							<td><strong>Funcional Programática</strong></td>
							<td class="text-primary">${emenda.funcionalProgramatica}</td>
						</tr>
						<tr>
							<td><strong>Tipo de Emenda</strong></td>
							<td class="text-primary">${emenda.tipoEmenda.descricao}</td>
						</tr>
						<tr>
							<td><strong>Valor</strong></td>
							<td class="text-primary">${valor_fmt}</td>
						</tr>
						<tr>
							<td class="col-md-5"><strong>G.N.D.</strong></td>
							<td class="text-primary">
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
							<td class="text-primary">
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
							<td><strong>Orgão Concedente</strong></td>
							<td class="text-primary">${emenda.orgaoConcedente.nome}</td>
						</tr>
					</table>				
					
				</div>
				
				<div class="col-xs-6">				
					
					<table class="table table-bordered  table-striped">				
						<tr>
							<td class="col-md-5"><strong>Ação</strong></td>					
							<td class="text-primary">${emenda.acao.nome}</td>						
						</tr>
						<tr>
							<td><strong>Programa</strong></td>
							<td class="text-primary">${emenda.programa.nome}</td>
						</tr>
					</table>	
					
					<table class="table table-bordered table-striped">			
						<tr>
							<th>Objeto</th>
							<th>Orgão Convenente</th>
							<th>Valor (R$)</th>
						</tr>
						<tr>						
							<c:forEach items="${indicacoes}" var="ind">										
								<tr>
									<fmt:formatNumber value="${ind.valorDestinado}" var="valorDestinado_fmt" minFractionDigits="2" />
									<td class="text-primary col-md-5">${ind.objeto.nome}</td>
									<td class="text-primary col-md-4">${ind.convenente.nome}</td>	
									<td class="text-primary col-md-3">${valorDestinado_fmt}</td>						
								</tr>
							</c:forEach>													
						</tr>
					</table>							
					
				</div>				
				
			</div>
		
		</div>
		
		<div class="panel-footer panel-footer-transparence">
		
			<div class="row">
			
				<div class="col-md-12">
					
					<a href="../indicacao/${emenda.id}" class="btn btn-transparence btn-blue">
						Lista de Indicações <i class="fa fa-arrow-right"></i>
					</a>
					<a href="../edicao/${emenda.id}" class="btn btn-transparence btn-red pull-right">
						<i class="fa fa-pencil"></i> Editar Emenda 
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

<script type="text/javascript">



 
</script>