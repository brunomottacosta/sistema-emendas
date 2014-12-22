<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div>

	<div class="container-fluid">
					
		<div class="row">
				
			<div class="col-md-12">				
				
				<a href="novo" class="btn btn-warning">
					<i class="fa fa-plus"></i> NOVO					
				</a>
				
				<hr />
				
				<table id="tabela_programas" class="table table-bordered">
				
					<thead>
						<tr>
							<th style="width: 5%">ID</th>
							<th>NOME</th>
							<th style="width: 5%"></th>
							<th style="width: 5%"></th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${programas}" var="p">
							<tr>
								<td>${p.id}</td>
								<td>${p.nome}</td>
								<td style="text-align: center">
									<a href="edicao/${p.id}">
										<i class="fa fa-pencil-square-o"></i>
									</a>
								</td>
								<td style="text-align: center" id="programa_${p.id}">
									<a href="#" onclick="remove_ajax(${p.id})"> 
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

<!-- SCRIPTS -->
<script type="text/javascript">

//inicia datatables
$("#tabela_programas").dataTable();

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