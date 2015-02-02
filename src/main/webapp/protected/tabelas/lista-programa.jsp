<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<div class="container">

	<div class="row">
			
		<div class="col-md-12">
		
			<div class="panel panel-transparence">
				
				<div class="panel-heading">
					<h4>Lista de Programas Cadastrados</h4>
				</div>
				
				<div class="panel-body table-content">
					
					<table id="tabela_programas" class="table table-bordered table-striped">
			
						<thead>
							<tr>
								<th style="width: 5%">ID</th>
								<th>NOME</th>
								<th>AÇÕES</th>
								<th style="width: 5%"></th>
								<th style="width: 5%"></th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach items="${programas}" var="p">
								<tr>
									<td>${p.id}</td>
									<td>${p.nome}</td>
									<td>
										<c:set var="num_of_acoes" value="${fn:length(p.acoes)}" />
										<c:forEach items="${p.acoes}" var="acao" varStatus="acao_counter">
											<c:if test="${acao_counter.count < num_of_acoes}">
												${acao.nome}, <br/>							
											</c:if>
											<c:if test="${acao_counter.count >= num_of_acoes}">
												${acao.nome}
											</c:if>
										</c:forEach>
									</td>
									<td style="text-align: center">
										<a href="#"	onclick="edita_ajax(${p.id},'${p.nome}')">
											<i class="fa fa-pencil-square-o fa-lg"></i>
										</a>
									</td>
									<td style="text-align: center" id="programa_${p.id}">
										<a href="#" onclick="remove_ajax(${p.id})"> 
											<i class="fa fa-trash fa-lg"></i>
										</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
											
					</table>
					
				</div>
				
				<div class="panel-footer panel-footer-transparence">
						
					<div class="row">
						<div class="col-xs-12">
							<a href="novo" class="btn btn-transparence btn-green">
								CADASTRAR	
							</a>
						</div>
					</div>
		
				</div>
				
			</div>				
			
		</div>
		
	</div>

</div>	


<!-- IMPORT DE MODALS PARA ALTERAR -->
<c:import url="../../protected/modals/programa-editar-modal.jsp"></c:import>

<!-- SCRIPTS -->
<script type="text/javascript">

//inicia datatables
$("#tabela_programas").dataTable({
    "scrollY":        "35vh",
    "scrollCollapse": true,
    "paging": false,
});

//editar
function edita_ajax(id, nome) {	
	$("#programa_id_edit").val(id);
	$("#programa_nome_edit").val(nome);
	$("#edit_programa_modal").modal("show");	
}

// remover
function remove_ajax(id) {
	var table = $("#tabela_programas").DataTable();
	
	// seta linha como selecionada
	$('#tabela_programas tbody').on( "click", "tr", function () {
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