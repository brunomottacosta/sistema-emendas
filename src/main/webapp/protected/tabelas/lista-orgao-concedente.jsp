<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container">
		
	<div class="row">
				
		<div class="col-md-12">
		
			<div class="panel panel-default">
				
				<div class="panel-heading">
					<h4><strong>Lista de Orgãos Concedentes Cadastrados</strong></h4>
				</div>
				
				<div class="panel-body table-content">
					
					<!-- ###################### -->
					<!-- LISTA ORGAO CONCEDENTE -->
					<!-- ###################### -->
					
					<table id="tabela_org_conced" class="table table-bordered">				
						<thead>
							<tr>
								<th style="width: 5%">ID</th>
								<th>NOME</th>
								<th style="width: 5%"></th>
								<th style="width: 5%"></th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach items="${orgaos}" var="org">
								<tr>
									<td>${org.id}</td>
									<td>${org.nome}</td>
									<td style="text-align: center">
										<a href="#"	onclick="edita_ajax(${org.id},'${org.nome}')">
											<i class="fa fa-pencil-square-o"></i>
										</a>
									</td>
									<td style="text-align: center" id="org_${org.id}">
										<a href="#" onclick="remove_ajax(${org.id})"> 
											<i class="fa fa-trash"></i>
										</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>										
					</table>
					
					<!-- ########################## -->
					<!-- FIM LISTA ORGAO CONCEDENTE -->
					<!-- ########################## -->
					
				</div>
				
			</div>	
							
		</div>	
				
	</div>
	
	<div class="row">
		<div class="col-xs-12">
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#new_org_conced_modal">
				<i class="fa fa-plus"></i> CADASTRAR						
			</button>
		</div>				
	</div>
				
</div>	


<!-- IMPORT DE MODALS PARA ADICIONAR -->
<c:import url="../../protected/modals/orgao-concedente-modal.jsp"></c:import>

<!-- IMPORT DE MODALS PARA ALTERAR -->
<c:import url="../../protected/modals/orgao-concedente-editar-modal.jsp"></c:import>


<!-- SCRIPTS -->
<script type="text/javascript">

//inicia datatables
$("#tabela_org_conced").dataTable({
    "scrollY":        "35vh",
    "scrollCollapse": true,
    "paging": false,
});

//editar
function edita_ajax(id, nome) {	
	$("#orgao_id_edit").val(id);
	$("#orgao_nome_edit").val(nome);
	$("#edit_orgao_modal").modal("show");	
}

// remover
function remove_ajax(id) {
	var table = $("#tabela_org_conced").DataTable();
	
	// seta linha como selecionada
	$('#tabela_org_conced tbody').on( "click", "tr", function () {
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