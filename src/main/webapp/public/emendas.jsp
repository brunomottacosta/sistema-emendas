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
							
			<div class="page-header">
				<h2 class="text-info">Filtros de busca para Emendas</h2>  						
			</div>		
			
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
			<div class="panel panel-default">	
				
				<div class="panel-body">
					
					<p class="text-info">Escolha as colunas que serão apresentadas:</p>
					
					<div class="btn-group" data-toggle="buttons">
											
						<a class="btn btn-checkbox toggle-visible" data-column="0">
							Ano
						</a>						
						<a class="btn btn-checkbox toggle-visible" data-column="1">
							Número
						</a>	 
						<a class="btn btn-checkbox toggle-visible" data-column="2">
							Autor
						</a>
						<a class="btn btn-checkbox toggle-visible" data-column="3">
							Orgão
						</a>
						<a class="btn btn-checkbox toggle-visible" data-column="4">
							Programática
						</a>
						<a class="btn btn-checkbox toggle-visible" data-column="5">
							Tipo
						</a>
						<a class="btn btn-checkbox toggle-visible" data-column="6">
							Modalidade
						</a>
						<a class="btn btn-checkbox toggle-visible" data-column="7">
							G.N.D.
						</a>
						<a class="btn btn-checkbox toggle-visible" data-column="8">
							Valor
						</a>
							
					</div>
				
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
									<option value="${gnd_var.id}">
										<c:if test="${gnd_var.id == 0}">
											${gnd_var.descricao}
										</c:if>												
										<c:if test="${gnd_var.id >= 1}">
											${gnd_var.numero} - ${gnd_var.descricao}
										</c:if>
									</option>
								</c:forEach>
							</select> 
						</div>
						
						<div class="form-group">
							<label class="control-label">Modalidade de Aplicacao</label> 
							<select id="mda_emenda" data-live-search="true"
							class="form-control drop-pesquisa selectpicker" name="modApp">										
								<c:forEach items="${modalidadeDeAplicacao}" var="mda_var">
									<option value="${mda_var.id}">
										<c:if test="${mda_var.id == 0}">
											${mda_var.descricao}
										</c:if>												
										<c:if test="${mda_var.id >= 1}">
											${mda_var.numero} - ${mda_var.descricao}
										</c:if>
									</option>
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
									<option value="${tipo_var.id}">${tipo_var.descricao}</option>
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
			
				<div class="col-md-4">
					
					<button id="btn_voltar_filtro" class="btn btn-primary" type="button">
						<i class="fa fa-arrow-left"></i> VOLTAR
					</button>
										
				</div>				
							
			</div>			

			<table id="tabela_emendas" class="table table-bordered">
				<thead>
					<tr>
						<th style="width: 5em">ANO</th>
						<th style="width: 5em">NUMERO</th>
						<th style="width: 10em">AUTOR</th>
						<th style="width: 10em">ORGÃO</th>
						<th style="width: 10em">FUNC. PROG.</th>
						<th style="width: 10em">TIPO</th>
						<th style="width: 15em">MODALIDADE</th>
						<th style="width: 15em">G.N.D.</th>
						<th style="width: 10em">VALOR (R$)</th>
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
		// colunas da table, numero de colunas tem que ser exatamente igual ao declarado no html
		"aoColumns": [
		              {"data" : "ano"},
		              {"data" : "numero"},
		              {"data" : "autor"},
		              {"data" : "orgaoConcedente"},
		              {"data" : "funcionalProgramatica"},
		              {"data" : "tipoEmenda"},
		              {"data" : "modalidadeDeAplicacao"},
		              {"data" : "gnd"},
		              {"data" : "valor"},
		],
		// definicoes da coluna, pode-se aplicar classes css, inserir links, etc.
        "columnDefs": [
        {
        	"className": "center-td",
    		"targets": [0, 1, 2, 3, 4, 5, 6, 7, 8],    	    
   	  	}]
	});
});



// datatable apos filtro
$(document).ready( function() {
	$("#btn_filtro").click( function() {
				
		// muda o slide, de filtros para a lista
		$("#content_pesq_emenda").hide("slide", {direction : "right"}, 500, function() {
			
			// abre o modal de loading para caso de demorar a carregar os dados da busca
			$("#carregar_modal").modal("show");
			
			// seta os atributos da pesquisa
			var numero = $("#num_emenda").val();
			var funcProg = $("#fnc_prog_emenda").val();
			var ano = $("#ano_emenda").val();
			var idModalidade = $("#mda_emenda").val();
			var idTipoEmenda = $("#tipo_emenda").val();
			var idGND = $("#gnd_emenda").val();
			var idOrgaoConced = $("#org_conced_emenda").val();
			var idAutor = $("#autor_emenda").val();
			
			// executa requisicao ajax para trazer os dados da busca e insere na table
			// os dados buscados tem que ser iguais aos da table criada na inicializacao
			var table = $("#tabela_emendas").DataTable();			
			table.ajax.url("buscar?"
					+ "numero=" + numero 
					+ "&ano=" + ano 
					+ "&idModalidade=" + idModalidade 
					+ "&idGND=" + idGND
					+ "&idTipoEmenda=" + idTipoEmenda
					+ "&funcProg=" + funcProg
					+ "&idOrgaoConced=" + idOrgaoConced
					+ "&idAutor=" + idAutor
			).load( function() {
				// depois de finalizada a busca, fecha o modal de loading
				$("#carregar_modal").modal("hide");
				$("#filtro_pesq_emenda").hide();
				$("#list_pesq_emenda").show();
				$("#carregar_modal").on("hidden.bs.modal", function() {
					$("#content_pesq_emenda").show("slide", {direction : "left"}, 500);				
				});
			});			
		});
	});	
});

// escolher colunas que serão visualizadas
$(document).ready(function() {
    var table = $('#tabela_emendas').DataTable();
    
    // esconde todas as colunas por padrão
    for (i = 0 ; i <= 8 ; i++) {
	 	var hide = table.column( i );
	 	hide.visible( ! hide.visible() );
    }
    
    $('a.toggle-visible').on('click', function (e) {
        e.preventDefault();
 
        // atribui o valor da coluna ao data-column do botão que seleciona
        var column = table.column( $(this).attr('data-column') );
 
        // torna visível a coluna
        column.visible( ! column.visible() );
    } );
} );

// resetar pesquisa
$("#btn_resetar").click( function() {		
	
	// limpa campos de pesquisa
	$(".input-pesquisa").val(null);
	$(".drop-pesquisa").val(0);
	$(".filter-option").html("Nenhum");	
	$(".toggle-visible").removeClass("active");
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