<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div>
	<div class="container-fluid">	
		<div class="row">
			<div class="col-md-12">
			
				<!-- ################# -->	
				<!-- FORMULARIO EMENDA -->
				<!-- ################# -->
						
				<form action="../salvar" method="post" id="form_nova_emenda" role="form">
					
					<input type="hidden" value="${emenda.id}" name="id">
					<input type="hidden" value="${modo}" name="modo">
								
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label class="control-label">Numero</label> 
								<input type="text" name="numero" id="num_emenda" 
								class="form-control num-emenda input-sm" value="${emenda.numero}"> 
							</div>
							<div class="form-group">
								<label class="control-label">Funcinoal Programática</label> 
								<input type="text" name="funcProg" id="fnc_prog_emenda" 
								class="form-control input-sm fnc-prog-emenda" value="${emenda.funcionalProgramatica}"> 
							</div>
							<div class="form-group">
								<label class="control-label">Ano</label>
								<input type="date" name="ano" id="data_emenda" class="form-control input-sm ano-emenda" 
								value="${emenda.ano}"> 
							</div>
							<div class="form-group">
								<label class="control-label">Valor</label>	
								<fmt:formatNumber value="${emenda.valor}" var="valor_fmt"  minFractionDigits="2"  />							
								<input type="text" name="valor" id="valor_emenda" class="form-control input-sm money" 
								value="${valor_fmt}" maxlength="20"> 
							</div>	
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="control-label">G.N.D.</label> 
								<select id="gnd_emenda" class="form-control input-sm" name="gnd">
									<c:if test="${!empty emenda.gnd}">
										<option value="${emenda.gnd.id}">
											${emenda.gnd.numero} - ${emenda.gnd.descricao}
										</option>
									</c:if>
									<c:forEach items="${gnd}" var="gnd_var" >
										<option value="${gnd_var.id}">${gnd_var.numero} - ${gnd_var.descricao}</option>
									</c:forEach>
								</select> 
							</div>								
							<div class="form-group">
								<label class="control-label">Modalidade de Aplicacao</label> 
								<select id="mda_emenda" class="form-control input-sm" name="modApp">
									<c:if test="${!empty emenda.modalidadeDeAplicacao}">
										<option value="${emenda.modalidadeDeAplicacao.id}">
											${emenda.modalidadeDeAplicacao.numero} - ${emenda.modalidadeDeAplicacao.descricao}
										</option>
									</c:if>
									<c:forEach items="${modalidadeDeAplicacao}" var="mda_var">
										<option value="${mda_var.id}">${mda_var.numero} - ${mda_var.descricao}</option>
									</c:forEach>
								</select> 
							</div>
							<div class="form-group">
								<label class="control-label">Autor</label> 
								<select id="autor_emenda" class="form-control input-sm" name="idAutor">
									<c:if test="${!empty emenda.autor}">
										<option value="${emenda.autor.id}">${emenda.autor.nome}</option>
									</c:if>
									<option value="0">Nenhum</option>
									<c:forEach items="${autores}" var="autor_var" >
										<option value="${autor_var.id}">${autor_var.nome}</option>
									</c:forEach>
								</select> 
							</div>
							<div class="form-group">
								<label class="control-label">Orgão Concedente</label> 
								<select id="org_conced_emenda" class="form-control input-sm" name="idOrgaoConced">
									<c:if test="${!empty emenda.orgaoConcedente}">
										<option value="${emenda.orgaoConcedente.id}">${emenda.orgaoConcedente.nome}</option>
									</c:if>
									<option value="0">Nenhum</option>
									<c:forEach items="${orgaos}" var="org_conced_var" >
										<option value="${org_conced_var.id}">${org_conced_var.nome}</option>
									</c:forEach>
								</select> 
							</div>	
						</div>
					</div>					
				</form>
				
				<!-- ##################### -->	
				<!-- FIM FORMULARIO EMENDA -->
				<!-- ##################### -->
				
				<hr />
					
				<button id="btn_salvar_emenda" class="btn btn-primary"><i class="fa fa-floppy-o"></i> SALVAR</button>	
								
			</div>
		</div>		
	</div>	
</div>

<!-- ################# -->
<!-- ##### SCRIPTS ### -->
<!-- ################# -->

<script>

//salvar
$(document).ready( function() {
	$("#btn_salvar_emenda").click( function() {
		$("#form_nova_emenda").submit();
	});	
});


</script>