<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div>
	<div class="container-fluid">		
		
		<!-- ######################### -->
		<!-- ACCORDION FILTRO DE BUSCA -->
		<!-- ######################### -->
		
		<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="false">
			<div class="panel panel-info">
		    	<div class="panel-heading" role="tab" id="hd_flt_busca">
		      		<h4 class="panel-title simple-link">
		        		<a data-toggle="collapse" data-parent="#accordion" 
		        		href="#acc_flt_busca" aria-expanded="true" aria-controls="acc_flt_busca">
							Filtros de Busca
						</a>
					</h4>
				</div>
				<div id="acc_flt_busca" class="panel-collapse collapse" role="tabpanel" aria-labelledby="hd_flt_busca">
					<div class="panel-body">
						
						<!-- ####################### -->	
						<!-- FORMULARIO FILTRO BUSCA -->
						<!-- ####################### -->
					
						<form id="form_nova_emenda">						
									
							<div class="row">
								<div class="col-md-3">								
						
									<div class="form-group">
										<label class="control-label">Numero</label> 
										<input type="text" name="numero" id="num_emenda" 
										class="form-control input-sm input-pesquisa num-emenda"> 
									</div>
									
									<div class="form-group">
										<label class="control-label">Funcional Programática</label> 
										<input type="text" name="funcionalProgramatica" id="fnc_prog_emenda" 
										class="form-control input-sm input-pesquisa"> 
									</div>
										
									<div class="form-group">
										<label class="control-label">Ano</label> 
										<input type="date" name="ano" id="ano_emenda"
										class="form-control input-sm input-pesquisa ano-emenda"> 
									</div>
																			
								</div>						
								<div class="col-md-3">
									
									<div class="form-group">
										<label class="control-label">G.N.D.</label> 
										<select id="gnd_emenda" class="form-control input-sm drop-pesquisa" name="gnd">										
											<c:forEach items="${gnd}" var="gnd_var" >
												<option value="${gnd_var.id}">${gnd_var.numero} - ${gnd_var.descricao}</option>
											</c:forEach>
										</select> 
									</div>
									
									<div class="form-group">
										<label class="control-label">Modalidade de Aplicacao</label> 
										<select id="mda_emenda" class="form-control input-sm drop-pesquisa" name="modApp">										
											<c:forEach items="${modalidadeDeAplicacao}" var="mda_var">
												<option value="${mda_var.id}">${mda_var.numero} - ${mda_var.descricao}</option>
											</c:forEach>
										</select> 
									</div>
								</div>
							</div>	
						</form>
						
						<!-- ########################### -->
						<!-- FIM FORMULARIO FILTRO BUSCA -->
						<!-- ########################### -->
											
					</div>
				</div>
			</div>
		</div>
		
		<!-- ############################# -->
		<!-- FIM ACCORDION FILTRO DE BUSCA -->
		<!-- ############################# -->
		
		<hr />	
		
		<!-- ############## -->  
		<!-- BOTOES DE ACAO -->
		<!-- ############## -->
						
		<div class="row">
			<div class="col-md-12">
				
				<button id="btn_filtro" class="btn btn-primary" type="button">
					<i class="fa fa-search"></i> FILTRAR
				</button>	
				<button id="btn_resetar" class="btn btn-warning" type="button">
					<i class="fa fa-refresh"></i> RESETAR PESQUISA
				</button>
				<a href="lista/novo" id="btn_novo" class="btn btn-info pull-right">
					<i class="fa fa-plus"></i> NOVO
				</a>				
				
			</div>				
		</div>		
		
		<!-- ################## -->  
		<!-- FIM BOTOES DE ACAO -->
		<!-- ################## -->  
		
		<hr />
		
		<!-- ################ -->    					
		<!-- LISTA DE EMENDAS -->
		<!-- ################ -->  
    	
    	<div id="pn_tb_emendas">
    	    					
			<table id="tabela_emendas" class="table table-bordered">
				<thead>
					<tr>
						<th style="width: 10%; text-align: left">NUMERO</th>
						<th style="width: 15%">FUNC. PROG.</th>
						<th style="width: 5%">ANO</th>
						<th style="width: 15%">VALOR (R$)</th>
						<th>MODALIDADE</th>
						<th>G.N.D.</th>
						<th></th> <!-- COLUNA EDITAR -->
						<th></th> <!-- COLUNA EXCLUIR -->	
					</tr>
				</thead>
				
				<!-- ######################## -->
				<!-- ####### LISTAGEM ####### -->
				<!-- ######################## -->
				
			</table>
		
		</div>
		
		<!-- #################### -->
		<!-- FIM LISTA DE EMENDAS -->
		<!-- #################### -->    				

	</div>
</div>

<!-- ############# -->
<!-- MODAL FUNCOES -->
<!-- ############# -->

<div class="modal fade" id="fnc_emenda_modal" tabindex="-1" role="dialog" style="padding-top: 25em" >
	<div class="modal-dialog modal-sm">
		<div class="modal-content">			
			<div class="modal-body">				
				<div class="row">
					<div class="col-md-12">
						<input type="hidden" id="fnc_id_emenda">
						<button id="btn_fnc_editar" type="button" class="btn btn-default">
							<i class="fa fa-pencil"></i> EDITAR
						</button>
					</div>				
				</div>
			</div>
		</div>
	</div>
</div>

<!-- ################# -->
<!-- FIM MODAL FUNCOES -->
<!-- ################# -->

<!-- ############# -->
<!-- MODAL LOADING -->
<!-- ############# -->

<div class="modal fade" id="carregar_modal" tabindex="-1" role="dialog" style="padding-top: 25em" >
	<div class="modal-dialog modal-sm">
		<div class="modal-content">			
			<div class="modal-body">				
				<div class="row">
					<div class="col-md-12">
						<img src="<c:url value='/resources/imgs/ajax-loader.gif' />" class="img-rounded center-block">
					</div>				
				</div>
			</div>
		</div>
	</div>
</div>

<!-- ################# -->
<!-- FIM MODAL LOADING -->
<!-- ################# -->

<!-- ################# -->
<!-- ##### SCRIPTS ### -->
<!-- ################# -->

<script type="text/javascript">

// botao de deletar row do datatable
function botao_deletar(data) {
	return '<a href="#" onclick="remove_ajax(' + data + ')">' 
		 + '<i class="fa fa-trash"></i>'
	  	 + '</a>';	
}

function botao_editar(data) {
	return '<a href="lista/' + data + '" >'
		 + '<i class="fa fa-pencil"></i>'
  	 	 + '</a>';	
}

// datatable
$(document).ready(function() {
	$("#tabela_emendas").DataTable({
		"filter": false,
		"ajax": "listar",
		"sAjaxDataProp": "",
		"bProcessing": true,
		"deferRender": true,
		"aoColumns": [
		              {"data" : "numero"},
		              {"data" : "funcionalProgramatica"},
		              {"data" : "ano"},
		              {"data" : "valor"},
		              {"data" : "modalidadeDeAplicacao"},
		              {"data" : "gnd"}
		],
        "columnDefs": [
        {
    		"targets": 7,
    	    "data": "id",
    	    "render": function ( data, type, full, meta ) {
    	     	return botao_deletar(data);
    	    }
   	  	},
        {
        	"targets": 6,
    	    "data": "id",
    	    "render": function ( data, type, full, meta ) {
    	     	return botao_editar(data);
    	    }
        }]
	});
});



// datatable apos filtro
$(document).ready( function() {
	$("#btn_filtro").click( function() {
				
		// destroi a antiga table
		$("#pn_tb_emendas").fadeOut(300, function() {
			$("#carregar_modal").modal("show");
			
			// seta os atributos da pesquisa
			var numero = $("#num_emenda").val();
			var funcProg = $("#fnc_prog_emenda").val();
			var ano = $("#ano_emenda").val();
			var idModalidade = $("#mda_emenda").val();
			var idGND = $("#gnd_emenda").val();
			
			// cria a nova table
			var table = $("#tabela_emendas").DataTable(); 
			table.ajax.url("buscar?"
					+ "numero=" + numero 
					+ "&ano=" + ano 
					+ "&idModalidade=" + idModalidade 
					+ "&idGND=" + idGND
					+ "&funcProg=" + funcProg
			).load();
			
			$("#carregar_modal").modal("hide");
			$("#carregar_modal").on("hidden.bs.modal", function() {
				$("#pn_tb_emendas").fadeIn(300);				
			});
		});
	});	
});

// resetar pesquisa
$(document).ready( function() {
	$("#btn_resetar").click( function() {		
		
		// limpa campos de pesquisa
		$(".input-pesquisa").val(null);
		$(".drop-pesquisa").val(0);
		
		// destroi a antiga table
		$("#pn_tb_emendas").fadeOut(300, function() {
			$("#carregar_modal").modal("show");
			
			// chama table inicial
			var table = $("#tabela_emendas").DataTable(); 
			table.ajax.url("listar").load();
			
			$("#carregar_modal").modal("hide");
			$("#carregar_modal").on("hidden.bs.modal", function() {
				$("#pn_tb_emendas").fadeIn(300);				
			});
		});
	});
});

// deletar
function remove_ajax(id) {
	var table = $("#tabela_emendas").DataTable();
	
	// seta linha como selecionada
	$('#tabela_emendas tbody').on( "click", "tr", function () {
		$(this).addClass("selected");
		
		// esconde row a ser deletada
		table.row($(".selected")).remove().draw( false );
		
		// executa funcao de deletar
		$.post("remover", { "id" : id }, function() {			
	 		table.row($(this)).remove().draw( false );
		});
    });	
}	


</script>