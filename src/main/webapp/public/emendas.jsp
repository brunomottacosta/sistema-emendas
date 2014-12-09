<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div>

	<div class="container-fluid">	
			
		<!-- ACORDION -->
		
		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			
			<!-- ACORDION_01 -->
			
			<div class="panel panel-default" id="acc_01">
				
				<!-- HEADER ACC_01 -->
				
				<div class="panel-heading" role="tab" id="heading_01">
				
			    	<h4 class="panel-title simple-link">
			       		<a href="#">
			         		Filtros
			      		</a>
			     	</h4>
			     	
				</div>
				
				<!-- CONTEUDO ACC_01 -->    			
    			
  				<div class="panel-body">
      				
   					<!-- FORMULARIO PARA PESQUISAR EMENDA -->

					<form id="form_nova_emenda">						
												
						<div class="row">
							<div class="col-md-4">								
					
								<div class="form-group">
									<label class="control-label">Numero</label> 
									<input type="text" name="numero" id="num_emenda" 
									class="form-control input-sm form-pesquisa"> 
								</div>
									
								<div class="form-group">
									<label class="control-label">Data</label> 
									<input type="date" name="ano" id="ano_emenda" class="form-control input-sm form-pesquisa"> 
								</div>
																		
							</div>						
							<div class="col-md-4">
								
								<div class="form-group">
									<label class="control-label">G.N.D.</label> 
									<select id="gnd_emenda" class="form-control input-sm form-pesquisa" name="gnd">
										<option value=""></option>
										<c:forEach items="${gnd}" var="gnd_var" >
											<option value="${gnd_var.id}">${gnd_var.numero} - ${gnd_var.descricao}</option>
										</c:forEach>
									</select> 
								</div>
								
								<div class="form-group">
									<label class="control-label">Modalidade de Aplicacao</label> 
									<select id="mda_emenda" class="form-control input-sm form-pesquisa" name="modApp">
										<option value=""></option>
										<c:forEach items="${modalidadeDeAplicacao}" var="mda_var">
											<option value="${mda_var.id}">${mda_var.numero} - ${mda_var.descricao}</option>
										</c:forEach>
									</select> 
								</div>
									
							</div>
								
						</div>
						
						<hr />	
						
						<div class="row">
		
							<div class="col-md-12">
								
								<button id="btn_filtro" class="btn btn-primary" type="button">
									<i class="fa fa-refresh"></i> FILTRAR
								</button>	
								<button id="btn_resetar" class="btn btn-warning" type="button">
									<i class="fa fa-refresh"></i> RESETAR PESQUISA
								</button>
								<a href="lista/novo" id="btn_novo" class="btn btn-success pull-right">
									<i class="fa fa-folder"></i> NOVO
								</a>				
								
							</div>
								
						</div>						
								
					</form>
						
					<!-- FIM FORMULARIO PARA PESQUISAR EMENDA -->
											
   				</div>    			
    			
    			<!-- FIM CONTEUDO ACC_01 -->				
				
			</div>
			
			<!-- FIM ACORDION_01 -->
			
			<!-- ################################################################################## -->
			
			<!-- ACORDION_02 -->
			
			<div class="panel panel-default" id="acc_01">
				
				<!-- HEADER ACC_02 -->
				
				<div class="panel-heading" role="tab" id="heading_02">
				
			    	<h4 class="panel-title simple-link">
			       		<a href="#">
			         		Pesquisa
			      		</a>
			     	</h4>
			     	
				</div>
				
				<!-- CONTEUDO ACC_02 -->    			
    			
     			<div class="panel-body" id="pn_tb_emendas" style="min-height: 400px">
     					
     					<!-- LISTA DE EMENDAS -->
     					
					<table id="tabela_emendas" class="table table-bordered">
						<thead>
							<tr>
								<th style="width: 10%">NUMERO</th>
								<th style="width: 5%">ANO</th>
								<th style="width: 15%">VALOR (R$)</th>
								<th>MODALIDADE</th>
								<th>G.N.D.</th>
							</tr>
						</thead>
						
						<!-- ######################## -->
						<!-- ####### LISTAGEM ####### -->
						<!-- ######################## -->
						
					</table>
					
     			</div>  				
   				
   				<!-- FIM CONTEUDO ACC_02 -->
   				
   			</div>      				
			
			<!-- FIM ACORDION_02 -->
			
		</div>
		
		<!-- FIM ACORDION -->

	</div>

</div>

<script type="text/javascript">

// datatable
$(document).ready(function() {
	$("#tabela_emendas").DataTable({
		"filter": false,
		"sAjaxSource": "listar",
		"sAjaxDataProp": "",
		"bProcessing": true,
		"aoColumns": [
		              {"mData" : "numero"},
		              {"mData" : "ano"},
		              {"mData" : "valor"},
		              {"mData" : "modalidadeDeAplicacao"},
		              {"mData" : "gnd"}
		             ],
	});
});



// datatable apos filtro
$(document).ready( function() {
	$("#btn_filtro").click( function() {
		
		// destroi a antiga table
		table = $("#tabela_emendas").DataTable();
		table.destroy();
		
		// seta os atributos da pesquisa
		var numero = $("#num_emenda").val();
		var ano = $("#ano_emenda").val();
		var idModalidade = $("#mda_emenda").val();
		var idGND = $("#gnd_emenda").val();
		console.log(idGND);
		
		// cria a nova table
		$("#tabela_emendas").DataTable({
			"filter": false,
			"sAjaxSource": "buscar?numero=" + numero + "&ano=" + ano + "&idModalidade=" + idModalidade + "&idGND=" + idGND,
			"sAjaxDataProp": "",
			"bProcessing": true,
			"aoColumns": [
			              {"mData" : "numero"},
			              {"mData" : "ano"},
			              {"mData" : "valor"},
			              {"mData" : "modalidadeDeAplicacao"},
			              {"mData" : "gnd"}
			             ],
		});
	});	
});

// resetar pesquisa
$(document).ready( function() {
	$("#btn_resetar").click( function() {
		
		// limpa campos de pesquisa
		$(".form-pesquisa").val(null);
		
		// destroi a antiga table
		$("#pn_tb_emendas").fadeOut("slow", function() {
			table = $("#tabela_emendas").DataTable();
			table.destroy();
			
			// chama table inicial
			$("#tabela_emendas").DataTable({
				"filter": false,
				"sAjaxSource": "listar",
				"sAjaxDataProp": "",
				"bProcessing": true,
				"aoColumns": [
				              {"mData" : "numero"},
				              {"mData" : "ano"},
				              {"mData" : "valor"},
				              {"mData" : "modalidadeDeAplicacao"},
				              {"mData" : "gnd"}
				             ],				
				            
			});	
			$("#pn_tb_emendas").fadeIn("slow");
		});
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