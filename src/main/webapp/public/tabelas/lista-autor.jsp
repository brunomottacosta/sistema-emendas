<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div>

	<div class="container-fluid">

		
		<div class="row">
				
			<div class="col-md-12">				
				
				<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#new_autor_modal">
					<i class="fa fa-plus"></i> NOVO					
				</button>
				
				<hr />
				
				<table id="tabela_autores" class="table table-bordered">
				
					<thead>
						<tr>
							<th style="width: 5%">ID</th>
							<th>NOME</th>
							<th style="width: 5%"></th>
							<th style="width: 5%"></th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${autores}" var="a">
							<tr>
								<td>${a.id}</td>
								<td>${a.nome}</td>
								<td style="text-align: center">
									<a href="#"	onclick="edita_ajax(${a.id},'${a.nome}')">
										<i class="fa fa-pencil-square-o"></i>
									</a>
								</td>
								<td style="text-align: center" id="autor_${a.id}">
									<a href="#" onclick="remove_ajax(${a.id})"> 
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
<c:import url="../modals/autor-modal.jsp"></c:import>

<!-- IMPORT DE MODALS PARA ALTERAR -->
<c:import url="../modals/autor-editar-modal.jsp"></c:import>


<!-- SCRIPTS -->
<script type="text/javascript">

// inicia datatables
$("#tabela_autores").dataTable();

//editar
function edita_ajax(id, nome) {	
	$("#autor_id_edit").val(id);
	$("#autor_nome_edit").val(nome);
	$("#edit_autor_modal").modal("show");	
}

// remover
function remove_ajax(id) {
	var table = $("#tabela_autores").DataTable();
	
	// seta linha como selecionada
	$('#tabela_autores tbody').on( "click", "tr", function () {
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