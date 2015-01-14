<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div>

	<div class="container-fluid">
		
		<div class="row">
			<div class="col-md-12">
				<div class="page-header">
					<h2 class="text-info">Lista de Objetos Cadastrados</h2>
				</div>
			</div>
		</div>
		
		<div class="row">
				
			<div class="col-md-12">				
				
				<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#new_objeto_modal">
					<i class="fa fa-plus"></i> NOVO					
				</button>
				
				<hr />
				
				<table id="tabela_objeto" class="table table-bordered">
				
					<thead>
						<tr>
							<th style="width: 5%">ID</th>
							<th>NOME</th>
							<th>AÇÃO</th>
							<th>PROGRAMA</th>
							<th style="width: 5%"></th>
							<th style="width: 5%"></th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${objetos}" var="obj">
							<tr>
								<td>${obj.id}</td>
								<td>${obj.nome}</td>
								<td>${obj.acao.nome}</td>
								<td>${obj.acao.programa.nome}</td>
								<td style="text-align: center">
									<a href="#"	
									onclick="edita_ajax(${obj.id},'${obj.nome}', ${obj.acao.id}, ${obj.acao.programa.id})">
										<i class="fa fa-pencil-square-o"></i>
									</a>
								</td>
								<td style="text-align: center" id="objeto_${obj.id}">
									<a href="#" onclick="remove_ajax(${obj.id})"> 
										<i class="fa fa-trash"></i>
									</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
										
				</table>

			</div>
			
		</div>
		
	</div>
	
</div>

<!-- IMPORT DE MODALS PARA ADICIONAR -->
<c:import url="../../protected/modals/objeto-modal.jsp"></c:import>

<!-- IMPORT DE MODALS PARA ALTERAR -->
<c:import url="../../protected/modals/objeto-editar-modal.jsp"></c:import>


<!-- SCRIPTS -->
<script type="text/javascript">

//inicia datatables
$("#tabela_objeto").dataTable();

//editar
function edita_ajax(id, nome, acao, programa) {	
	$("#objeto_id_edit").val(id);
	$("#objeto_nome_edit").val(nome);
	$("#objeto_programa_edit").val(programa).selectpicker("refresh");
	$("#objeto_acao_edit").empty();
	var id = programa;
	$.ajax({
		type: "GET",
		url: "../acao/lista/programa/" + id,
		success: function(json) {
			if (json.length == 0) {
				$("#objeto_acao_edit").selectpicker("refresh");
			} else {
				$.each(json, function(pos, obj) {				
					$("#objeto_acao_edit")
					.append("<option value='" + obj.id + "'>" + obj.nome + "</option>")
					.selectpicker("refresh");
				});				
			}
			$("#objeto_acao_edit").val(acao).selectpicker("refresh");
		}
	});
	$("#edit_objeto_modal").modal("show");
}

// remover
function remove_ajax(id) {
	var table = $("#tabela_objeto").DataTable();
	
	// seta linha como selecionada
	$('#tabela_objeto tbody').on( "click", "tr", function () {
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