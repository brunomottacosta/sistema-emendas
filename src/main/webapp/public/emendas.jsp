<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div>

	<div class="container-fluid">
		
		<div class="row">
		
			<div class="col-md-4">
			
				<button id="adicionar_novo" class="btn btn-success"><i class="fa fa-plus"></i> NOVO</button>
				<button id="cancelar_acao" class="btn btn-danger" disabled="disabled"><i class="fa fa-times"></i> CANCELAR</button>
				
			</div>
				
		</div>
		
		<hr />
			
		<!-- ACORDION -->
		
		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			
			<!-- ACORDION_01 -->
			
			<div class="panel panel-primary" id="acc_01">
				
				<!-- HEADER ACC_01 -->
				
				<div class="panel-heading" role="tab" id="heading_01">
				
			    	<h4 class="panel-title simple-link">
			       		<a data-toggle="collapse" data-parent="#accordion" href="#collapse_01" aria-expanded="true" aria-controls="collapse_01">
			         		Cadastro
			      		</a>
			     	</h4>
			     	
				</div>
				
				<!-- CONTEUDO ACC_01 -->
				
    			<div id="collapse_01" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading_01">
    			
      				<div class="panel-body">
      				
       					<!-- FORMULARIO PARA ADICIONAR NOVA EMENDA -->

						<form action="buscar" method="post" id="form_nova_emenda">						
												
							<div class="row">
								<div class="col-md-4">
									
<!-- 									<input type="hidden" name="modo" id="modo_form" value="0"> -->
<!-- 									<input type="hidden" name="id" id="id_emenda" value="0"> -->
									
									<div class="form-group">
										<label class="control-label">Numero</label> 
										<input type="text" name="numero" id="num_emenda" 
										disabled="disabled" class="form-control input-sm"> 
									</div>
									
<!-- 									<div class="form-group"> -->
<!-- 										<label class="control-label">Data</label>  -->
<!-- 										<input type="date" name="data" id="data_emenda" class="form-control input-sm"  -->
<!-- 										onkeypress="return dateMask(this, event);"maxlength="10" disabled="disabled">  -->
<!-- 									</div> -->
									
<!-- 									<div class="form-group"> -->
<!-- 										<label class="control-label">Valor</label>								 -->
<!-- 										<input type="text" name="valor" id="valor_emenda" class="form-control input-sm money"  -->
<!-- 										maxlength="20" disabled="disabled">  -->
<!-- 									</div>	 -->
													
									<button id="salvar_emenda" class="btn btn-primary" disabled="disabled"><i class="fa fa-floppy-o"></i> SALVAR</button>							
									
								</div>						
<!-- 								<div class="col-md-4"> -->
								
<!-- 									<div class="form-group"> -->
<!-- 										<label class="control-label">G.N.D.</label>  -->
<!-- 										<select id="gnd_emenda" class="form-control input-sm" name="gnd" disabled="disabled"> -->
<!-- 											<option value=""></option> -->
<%-- 											<c:forEach items="${gnd}" var="gnd_var" > --%>
<%-- 												<option value="${gnd_var.id}">${gnd_var.id} - ${gnd_var.descricao}</option> --%>
<%-- 											</c:forEach> --%>
<!-- 										</select>  -->
<!-- 									</div> -->
									
<!-- 									<div class="form-group"> -->
<!-- 										<label class="control-label">Modalidade de Aplicacao</label>  -->
<!-- 										<select id="mda_emenda" class="form-control input-sm" name="modApp" disabled="disabled"> -->
<!-- 											<option value=""></option> -->
<%-- 											<c:forEach items="${modalidadeDeAplicacao}" var="mda_var"> --%>
<%-- 												<option value="${mda_var.id}">${mda_var.id} - ${mda_var.descricao}</option> --%>
<%-- 											</c:forEach> --%>
<!-- 										</select>  -->
<!-- 									</div> -->
									
<!-- 								</div> -->
								
							</div>	
								
						</form>
						
						<!-- FIM FORMULARIO PARA ADICIONAR NOVA EMENDA -->
											
      				</div>
      				
    			</div>
    			
    			<!-- FIM CONTEUDO ACC_01 -->				
				
			</div>
			
			<!-- FIM ACORDION_01 -->
			
			<!-- ################################################################################## -->
			
			<!-- ACORDION_02 -->
			
			<div class="panel panel-primary" id="acc_01">
				
				<!-- HEADER ACC_02 -->
				
				<div class="panel-heading" role="tab" id="heading_02">
				
			    	<h4 class="panel-title simple-link">
			       		<a data-toggle="collapse" data-parent="#accordion" href="#collapse_02" aria-expanded="true" aria-controls="collapse_02" >
			         		Pesquisa
			      		</a>
			     	</h4>
			     	
				</div>
				
				<!-- CONTEUDO ACC_02 -->
				
    			<div id="collapse_02" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading_02">
    			
      				<div class="panel-body">
      					
      					<!-- LISTA DE EMENDAS -->
      					
						<table id="tabela_emendas" class="table table-bordered">
							<thead>
								<tr>
									<th style="width: 10%">NUMERO</th>
									<th style="width: 5%">ANO</th>
									<th style="width: 15%">VALOR (R$)</th>
									<th>MODALIDADE</th>
									<th>G.N.D.</th>
									<th style="width: 5%"></th>
									<th style="width: 5%"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${emendas}" var="e">
									<tr>
										<td>${e.numero}</td>
										<fmt:formatDate value="${e.ano}" var="ano_fmt" pattern="yyyy"/>
										<td>${ano_fmt}</td>
										<fmt:formatNumber currencyCode="R$" minFractionDigits="2" value="${e.valor}" var="valor_fmt"/>
										<td>${valor_fmt}</td>
										<td>${e.modalidadeDeAplicacao.descricao}</td>
										<td>${e.gnd.descricao}</td>
										<td style="text-align: center">
											<a href="#">
												<i class="fa fa-pencil-square-o"></i>
											</a>
										</td>
										<td style="text-align: center" id="ex_${e.id}" >
											<a href="#" onclick="remove_ajax(${e.id})">
												<i class="fa fa-trash"></i>
											</a>
										</td>
									</tr>						
								</c:forEach>
							</tbody>
						</table>
						
      				</div>
      				
   				</div>
   				
   				<!-- FIM CONTEUDO ACC_02 -->
   				
   			</div>      				
			
			<!-- FIM ACORDION_02 -->
			
		</div>
		
		<!-- FIM ACORDION -->

	</div>

</div>

<script type="text/javascript">

// novo objeto
$(document).ready(function() {
	$("#adicionar_novo").click( function(event) {
		
		$("#collapse_01").collapse("show");
		$("#collapse_02").collapse("hide");
		
		event.preventDefault();
		
		$("#num_emenda").prop("disabled", false);
		$("#data_emenda").prop("disabled", false);
		$("#valor_emenda").prop("disabled", false);
		$("#gnd_emenda").prop("disabled", false);
		$("#mda_emenda").prop("disabled", false);
		$("#salvar_emenda").prop("disabled", false);
		$("#modo_form").val("1");
		
		$("#adicionar_novo").prop("disabled", true);
		$("#cancelar_acao").prop("disabled", false);
	});
});

// cancelar acao
$(document).ready(function() {
	$("#cancelar_acao").click( function(event){
		
		$("#collapse_01").collapse("hide");
		$("#collapse_02").collapse("show");
		
		event.preventDefault();
		
		$("#num_emenda").prop("disabled", true).val(null);
		$("#data_emenda").prop("disabled", true).val(null);
		$("#valor_emenda").prop("disabled", true).val(null);
		$("#gnd_emenda").prop("disabled", true).val(null);
		$("#mda_emenda").prop("disabled", true).val(null);
		$("#salvar_emenda").prop("disabled", true).val(null);
		$("#modo_form").val("0");
		
		$("#adicionar_novo").prop("disabled", false);
		$("#cancelar_acao").prop("disabled", true);
	});
});

// datatable
$(document).ready(function() {
	$('#tabela_emendas').DataTable({
		'aoColumns': [{},{},{},{},{},{bSortable:false},{bSortable:false}]
	});
});

// salvar
$(document).ready( function() {
	$("#salvar_emenda").click( function() {
		$("#form_nova_emenda").submit();
	});	
});

// remover
function remove_ajax(id) {
	$.post("remover", { 'id' : id }, 
		function() {
			$("#ex_" + id).closest("tr").hide();
	});
}	


</script>
