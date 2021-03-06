<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container"> 

	<div class="row">

		<div class="col-xs-12" id="content_pesq_emenda">		
	
			<!-- ####################### -->	
			<!-- FORMULARIO FILTRO BUSCA -->
			<!-- ####################### -->		
				
			<div id="filtro_pesq_emenda">
				
				<!-- ############## -->  
				<!-- BOTOES DE ACAO -->
				<!-- ############## -->			
					
				<div class="panel panel-transparence">
					
					<div class="panel-heading">
						<h4>
							<strong>Pesquisa por Filtros</strong>
						</h4>
					</div>				
										
					<div class="panel-body">
					
						<span id="descr_col" class="text-success">
							<i class="fa fa-info-circle"></i> Escolha as colunas que serão apresentadas: 
						</span>	
						<span id="warning_col" class="not-visible text-warning" style="cursor: pointer;">
							<i class="fa fa-warning"></i> Selecione pelo menos duas colunas!
						</span>						
						
						<div id="btn_colunas_tb" data-toggle="buttons">
												
							<a class="btn btn-default toggle-visible active" data-column="0">
								Ano
							</a>						
							<a class="btn btn-default toggle-visible active" data-column="1">
								Número
							</a>	 
							<a class="btn btn-default toggle-visible active" data-column="2">
								Autor
							</a>
							<a class="btn btn-default toggle-visible active" data-column="3">
								Orgão
							</a>
							<a class="btn btn-default toggle-visible" data-column="4">
								Programática
							</a>
							<a class="btn btn-default toggle-visible" data-column="5">
								Tipo
							</a>
							<a class="btn btn-default toggle-visible" data-column="6">
								Modalidade
							</a>
							<a class="btn btn-default toggle-visible" data-column="7">
								G.N.D.
							</a>
							<a class="btn btn-default toggle-visible" data-column="8">
								Valor
							</a>
							<a class="btn btn-default toggle-visible" data-column="9">
								Programa
							</a>
							<a class="btn btn-default toggle-visible" data-column="10">
								Ação
							</a>
								
						</div>
					
					</div>			
							
				</div>		
				
				<!-- ################## -->  
				<!-- FIM BOTOES DE ACAO -->
				<!-- ################## -->
					
				<div class="panel panel-transparence">	
					
				<div class="panel-body">
				
				<span class="text-success">
					<i class="fa fa-info-circle"></i> Escolha os filtros:
				</span>
				
				<form id="form_pesquisa_emenda">						
							
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
							
							<div class="form-group">
								<label class="control-label">Tipo de Emenda</label> 
								<select id="tipo_emenda" data-live-search="true"
								class="form-control selectpicker" name="tipoEmenda">								
									<c:forEach items="${tipoEmenda}" var="tipo_var">
										<option value="${tipo_var.id}">${tipo_var.descricao}</option>
									</c:forEach>
								</select> 
							</div>	
						
						</div>						
						<div class="col-md-3">						
							
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
							
							<div class="form-group">
								<label class="control-label">Programa</label> 
								<select id="programa_emenda" data-live-search="true"
								class="form-control drop-pesquisa selectpicker" name="idPrograma">
									<option value="0">Nenhum</option>
									<c:forEach items="${programas}" var="programa_var" >
										<option value="${programa_var.id}">${programa_var.nome}</option>
									</c:forEach>
								</select> 
							</div>
							
						</div>
						<div class="col-md-3">						
							
							<div class="form-group">
								<label class="control-label">Ação</label> 
								<select id="acao_emenda" data-live-search="true"
								class="form-control drop-pesquisa selectpicker" name="idAcao">
									<option value="0">Nenhum</option>
									<c:forEach items="${acoes}" var="acao_var" >
										<option value="${acao_var.id}">${acao_var.nome}</option>
									</c:forEach>
								</select> 
							</div>
							
							<div class="form-group">
								<label class="control-label">Objeto</label> 
								<select id="objeto_emenda" data-live-search="true"
								class="form-control drop-pesquisa selectpicker" name="idObjeto">
									<option value="0">Nenhum</option>
									<c:forEach items="${objetos}" var="obj_var" >
										<option value="${obj_var.id}">${obj_var.nome}</option>
									</c:forEach>
								</select> 
							</div>
							
						</div>
						
					</div>	
					
				</form>
				
				</div>
				
				<div class="panel-footer panel-footer-transparence">
				
					<div class="row">
				
						<div class="col-xs-12">
							<button id="btn_filtro" class="btn btn-transparence btn-green" type="button">
								<i class="fa fa-search"></i> BUSCAR
							</button>
								
							<button id="btn_resetar" class="btn btn-transparence btn-red" type="button" style="margin-left: 1em">
								<i class="fa fa-close"></i> LIMPAR
							</button>
						
							<a id="btn_novo_cadastro" class="btn btn-transparence btn-blue pull-right" href="/sistema/protected/emenda/registro/novo" >
								<i class="fa fa-plus"></i>  NOVO CADASTRO
							</a>					
						</div>
						
					</div>	
					
				</div>
				
				</div>
				
			</div>
			
			<!-- ########################### -->
			<!-- FIM FORMULARIO FILTRO BUSCA -->
			<!-- ########################### -->
			
			<!-- ################ -->    					
			<!-- LISTA DE EMENDAS -->
			<!-- ################ -->  
		   	
		   	<div id="list_pesq_emenda" class="row not-visible">
		   		
		   		<div class="col-xs-12">
		   			
		   			<div class="panel panel-transparence">
		   		
				   		<div class="panel-heading">
				   		
				   			<h4>Resultados</h4>
				   			
				   			<button id="btn_voltar_filtro" class="btn btn-transparence btn-red" type="button">
								<i class="fa fa-arrow-left"></i> VOLTAR
							</button>
							<button id="btn_ver_emenda" class="btn btn-transparence btn-green" type="button" disabled="disabled">
								<i class="fa fa-folder-open"></i> ABRIR
							</button>
				  			
						</div>	
						
						<div class="panel-body" >	  	   
									
							<table id="tabela_emendas" class="table table-bordered table-striped">
											
								<thead>
									<tr>
										<th>ANO</th>
										<th>NUMERO</th>
										<th>AUTOR</th>
										<th>ORGÃO</th>
										<th>PROGRAMÁTICA</th>
										<th>TIPO</th>
										<th>MODALIDADE</th>
										<th>G.N.D.</th>
										<th>VALOR (R$)</th>
										<th>PROGRAMA</th>
										<th>AÇÃO</th>
										<th></th>
									</tr>
								</thead>
								
								<!-- ######################## -->
								<!-- ####### LISTAGEM ####### -->
								<!-- ######################## -->
								
							</table>
						
						</div>
						
						<div class="panel-footer panel-footer-transparence">
							<a type="button" id="btn_novo_cadastro" class="btn btn-transparence btn-blue" href="/sistema/protected/emenda/registro/novo" >
								<i class="fa fa-plus"></i>  NOVO CADASTRO
							</a>
						</div>
						
					</div>	
		   			
		   		</div>	
								
			</div>			
			
			<!-- #################### -->
			<!-- FIM LISTA DE EMENDAS -->
			<!-- #################### -->   	
			
		</div>
			
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
		              {"data" : "programa"},
		              {"data" : "acao"},
		              {"data" : "id"},
		],
		// definicoes da coluna, pode-se aplicar classes css, inserir links, etc.
        "columnDefs": [
        {
        	"className": "center-td",
    		"targets": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],    	    
   	  	},
   	  	{
	   	  	"render": function ( data, type, row ) {
		   	  	var string = "";
		   	  	$.each(data, function(pos, obj) {
			   	  	if (pos < (data.length - 1)) {
						string = string + obj + ", <br />";
				   	} else {
				   		string = string + obj;
					}
			   	});
	            return string;
	        },
	        "targets": [6, 7],
   	   	}]
	});
});

// redirecionamento para pagina da emenda
$(document).ready( function() {
	var table = $('#tabela_emendas').DataTable();
	var data = "";
	
	// mostra tr selecionada, ativa ou desativa botao para abrir
	$('#tabela_emendas tbody').on( 'click', 'tr', function () {		
        if ( $(this).hasClass('selected')) {
            $(this).removeClass('selected');
        } else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
        
        if ( $('#tabela_emendas tbody tr').hasClass('selected')) {
        	$('#btn_ver_emenda').attr('disabled', false);
        } else {
        	$('#btn_ver_emenda').attr('disabled', true);
        }
	});

 	// encaminha para pagina individual da emenda
    $('#btn_ver_emenda').click( function () {
        data = table.row('.selected').data();
        var url = 'visualizar/' + data.id;
        $(window.document.location).attr('href', url);
    });		
});

( function() {
	$('#btn_ver_emenda').attr('disabled', true);
})();

// datatable apos filtro
$(document).ready( function() {
	$("#btn_filtro").click( function() {		
		
		var btns = $("#btn_colunas_tb").children("a.active");
		
		if (btns.length > 1) {			
			
			// muda o slide, de filtros para a lista
			$("#content_pesq_emenda").hide("fade", 350, function() {
				
				// abre o modal de loading para caso de demorar a carregar os dados da busca
				$("#carregar_modal").modal("show");
				$("#warning_col").hide();
				
				// seta os atributos da pesquisa
				var numero = $("#num_emenda").val();
				var funcProg = $("#fnc_prog_emenda").val();
				var ano = $("#ano_emenda").val();
				var idModalidade = $("#mda_emenda").val();
				var idTipoEmenda = $("#tipo_emenda").val();
				var idGND = $("#gnd_emenda").val();
				var idOrgaoConced = $("#org_conced_emenda").val();
				var idAutor = $("#autor_emenda").val();
				var idPrograma = $("#programa_emenda").val();
				var idAcao = $("#acao_emenda").val();
				var idObjeto = $("#objeto_emenda").val();
								
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
						+ "&idPrograma=" + idPrograma
						+ "&idAcao=" + idAcao
						+ "&idObjeto=" + idObjeto
 				).load( function() {
					// depois de finalizada a busca, fecha o modal de loading
					$("#carregar_modal").modal("hide");
					$("#filtro_pesq_emenda").hide();
					$("#list_pesq_emenda").show();
					$("#carregar_modal").on("hidden.bs.modal", function() {
						$("#content_pesq_emenda").show("fade", 350);				
					});
				});		
			});			
		} else {
			$("#descr_col").hide("fade", 250, function() {
				$("#warning_col").show("fade", 250);
			});
		}		
	});	
});

// cancelar warning de colunas
$("#warning_col").click( function() {
	$("#warning_col").hide("fade", 250, function() {
		$("#descr_col").show("fade", 250);
	})	
});

// escolher colunas que serão visualizadas
$(document).ready(function() {
    var table = $('#tabela_emendas').DataTable();
 	var count = $('#tabela_emendas thead tr').children('th').length;
 	var btns = $("#btn_colunas_tb").children('a.active');
 	
    // esconde todas as colunas por padrão    
    for (i = 0 ; i < count ; i++) {
    	if (i >= btns.length && i < count) {
		 	var hide = table.column( i );
		 	hide.visible( ! hide.visible() ); 		
    	}
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
	
	$("#form_pesquisa_emenda").hide("fade", 350, function() {
		
		// limpa campos de pesquisa
		$(".input-pesquisa").val(null);
		$(".drop-pesquisa").val(0);
		$(".filter-option").html("Nenhum");	
		$("#form_pesquisa_emenda").show("fade", 350);
	});		
});


// voltar para os filtros
$("#btn_voltar_filtro").click( function() {
	$("#content_pesq_emenda").hide("fade", 350, function() {
		$("#filtro_pesq_emenda").show();
		$("#list_pesq_emenda").hide();		
		$("#content_pesq_emenda").show("fade", 350);
	});
});

// deletar
function remove_ajax(id) {
	var table = $("#tabela_emendas").DataTable();
	
	// seta linha como selecionada
	$('#tabela_emendas tbody').on( "click", "tr", function () {
		$(this).addClass("selected");
				
		// executa funcao de deletar
		$.post("remover", { "id" : id }, function() {			
	 		table.row($(this)).remove().draw( false );
		});
    });	
}	

</script>