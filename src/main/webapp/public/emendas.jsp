<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<div class="container-fluid">
	
	<div id="content_pesq_emenda">
		
		<!-- ####################### -->	
		<!-- FORMULARIO FILTRO BUSCA -->
		<!-- ####################### -->		
			
		<div id="filtro_pesq_emenda">
			
			<!-- ############## -->  
			<!-- BOTOES DE ACAO -->
			<!-- ############## -->
							
			<div class="row" style="margin-bottom: 20px">
			
				<div class="col-md-12">
					
					<button id="btn_filtro" class="btn btn-primary" type="button">
						<i class="fa fa-search"></i> FILTRAR
					</button>	
					<button id="btn_resetar" class="btn btn-warning" type="button">
						<i class="fa fa-close"></i> LIMPAR
					</button>	
					
				</div>	
							
			</div>		
			
			<!-- ################## -->  
			<!-- FIM BOTOES DE ACAO -->
			<!-- ################## -->
				
			
			<form id="form_nova_emenda">						
						
				<div class="row">
				
					<div class="col-md-3">								
			
						<div class="form-group">
							<label class="control-label">Numero</label> 
							<input type="text" name="numero" id="num_emenda" 
							class="form-control input-pesquisa num-emenda"> 
						</div>
						
						<div class="form-group">
							<label class="control-label">Funcional Programática</label> 
							<input type="text" name="funcionalProgramatica" id="fnc_prog_emenda" 
							class="form-control input-pesquisa"> 
						</div>
							
						<div class="form-group">
							<label class="control-label">Ano</label> 
							<input type="text" name="ano" id="ano_emenda"
							class="form-control input-pesquisa ano-emenda"> 
						</div>
						
					</div>						
					<div class="col-md-3">
					
						<div class="form-group">
							<label class="control-label">Valor</label>															
							<input type="text" name="valor" id="valor_emenda" 
							class="form-control money input-pesquisa" maxlength="20"> 
						</div>																
						
						<div class="form-group">
							<label class="control-label">G.N.D.</label> 
							<select id="gnd_emenda" data-live-search="true"
							class="form-control drop-pesquisa selectpicker" name="gnd">										
								<c:forEach items="${gnd}" var="gnd_var" >
									<option value="${gnd_var.id}">${gnd_var.numero} - ${gnd_var.descricao}</option>
								</c:forEach>
							</select> 
						</div>
						
						<div class="form-group">
							<label class="control-label">Modalidade de Aplicacao</label> 
							<select id="mda_emenda" data-live-search="true"
							class="form-control drop-pesquisa selectpicker" name="modApp">										
								<c:forEach items="${modalidadeDeAplicacao}" var="mda_var">
									<option value="${mda_var.id}">${mda_var.numero} - ${mda_var.descricao}</option>
								</c:forEach>
							</select> 
						</div>
					
					</div>						
					<div class="col-md-3">
						
						<div class="form-group">
							<label class="control-label">Tipo de Emenda</label> 
							<select id="tipo_emenda" data-live-search="true"
							class="form-control selectpicker" name="tipoEmenda">								
								<c:forEach items="${tipoEmenda}" var="tipo_var">
									<option value="${tipo_var.id}">${tipo_var.numero} - ${tipo_var.descricao}</option>
								</c:forEach>
							</select> 
						</div>	
						
						<div class="form-group">
							<label class="control-label">Autor</label> 
							<select id="autor_emenda" data-live-search="true"
							class="form-control drop-pesquisa selectpicker" name="idAutor">
								<option value="0">Nenhum</option>
								<c:forEach items="${autores}" var="autor_var" >
									<option value="${autor_var.id}">${autor_var.nome}</option>
								</c:forEach>
							</select> 
						</div>
							
						<div class="form-group">
							<label class="control-label">Orgão Concedente</label> 
							<select id="org_conced_emenda" data-live-search="true"
							class="form-control drop-pesquisa selectpicker" name="idOrgaoConced">
								<option value="0">Nenhum</option>
								<c:forEach items="${orgaos}" var="org_conced_var" >
									<option value="${org_conced_var.id}">${org_conced_var.nome}</option>
								</c:forEach>
							</select> 
						</div>
						
					</div>
					
				</div>	
				
			</form>
			
		</div>
		
		<!-- ########################### -->
		<!-- FIM FORMULARIO FILTRO BUSCA -->
		<!-- ########################### -->
		
		<!-- ################ -->    					
		<!-- LISTA DE EMENDAS -->
		<!-- ################ -->  
    	
    	<div id="list_pesq_emenda" class="not-visible">
    	    
    	    <div class="row" style="margin-bottom: 20px">
			
				<div class="col-md-12">
					
					<button id="btn_voltar_filtro" class="btn btn-primary" type="button">
						<i class="fa fa-arrow-left"></i> VOLTAR
					</button>
					
				</div>	
							
			</div>
    	    					
			<table id="tabela_emendas" class="table table-bordered">
				<thead>
					<tr>
						<th style="width: 5em">NUMERO</th>
						<th style="width: 10em">AUTOR</th>
						<th style="width: 10em">ORGÃO</th>
						<th style="width: 10em">FUNC. PROG.</th>
						<th style="width: 5em">ANO</th>
						<th style="width: 10em">VALOR (R$)</th>
						<th style="width: 15em">MODALIDADE</th>
						<th style="width: 15em">G.N.D.</th>
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
		"sAjaxDataProp": "",
		"bProcessing": true,
		"deferRender": true,
		"aoColumns": [
		              {"data" : "numero"},
		              {"data" : "autor"},
		              {"data" : "orgaoConcedente"},
		              {"data" : "funcionalProgramatica"},
		              {"data" : "ano"},
		              {"data" : "valor"},
		              {"data" : "modalidadeDeAplicacao"},
		              {"data" : "gnd"}
		],
//         "columnDefs": [
//         {
//         	"className": "center-td",
//     		"targets": 7,
//     	    "data": "id",
//     	    "render": function ( data, type, full, meta ) {
//     	     	return botao_deletar(data);
//     	    }
//    	  	},
//         {
//    	  		"className": "center-td",
//         	"targets": 6,
//     	    "data": "id",
//     	    "render": function ( data, type, full, meta ) {
//     	     	return botao_editar(data);
//     	    }
//         }]
	});
});



// datatable apos filtro
$(document).ready( function() {
	$("#btn_filtro").click( function() {
				
		// destroi a antiga table 
		$("#content_pesq_emenda").hide("slide", {direction : "right"}, 500, function() {
			$("#carregar_modal").modal("show");
			
			// seta os atributos da pesquisa
			var numero = $("#num_emenda").val();
			var funcProg = $("#fnc_prog_emenda").val();
			var ano = $("#ano_emenda").val();
			var idModalidade = $("#mda_emenda").val();
			var idGND = $("#gnd_emenda").val();
			var idOrgaoConced = $("#org_conced_emenda").val();
			var idAutor = $("#autor_emenda").val();
			
			// cria a nova table
			var table = $("#tabela_emendas").DataTable(); 
			table.ajax.url("buscar?"
					+ "numero=" + numero 
					+ "&ano=" + ano 
					+ "&idModalidade=" + idModalidade 
					+ "&idGND=" + idGND
					+ "&funcProg=" + funcProg
					+ "&idOrgaoConced=" + idOrgaoConced
					+ "&idAutor=" + idAutor
			).load();
			
			$("#carregar_modal").modal("hide");
			$("#filtro_pesq_emenda").hide();
			$("#list_pesq_emenda").show();
			$("#carregar_modal").on("hidden.bs.modal", function() {
				$("#content_pesq_emenda").show("slide", {direction : "left"}, 500);				
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
		$(".filter-option").html("Nenhum");
		
	});
});

// voltar para os filtros
$("#btn_voltar_filtro").click( function() {
	$("#content_pesq_emenda").hide("slide", {direction : "left"}, 500, function() {
		$("#filtro_pesq_emenda").show();
		$("#list_pesq_emenda").hide();		
		$("#content_pesq_emenda").show("slide", {direction : "right"}, 500);
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