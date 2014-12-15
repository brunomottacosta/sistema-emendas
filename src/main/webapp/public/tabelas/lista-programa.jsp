<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div>

	<div class="container-fluid">

		
		<div class="row">
				
			<div class="col-md-12">				
				
				<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#new_programa_modal">
					<i class="fa fa-plus"></i> NOVO					
				</button>
				
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
									<a href="#"	onclick="edita_ajax(${p.id},'${p.nome}')">
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

<!-- IMPORT DE MODALS PARA ADICIONAR -->
<c:import url="../modals/programa-modal.jsp"></c:import>

<!-- IMPORT DE MODALS PARA ALTERAR -->
<c:import url="../modals/programa-editar-modal.jsp"></c:import>


<!-- SCRIPTS -->
<script type="text/javascript">

//editar
function edita_ajax(id, nome) {	
	$("#programa_id_edit").val(id);
	$("#programa_nome_edit").val(nome);
	$("#edit_programa_modal").modal("show");	
}

// remover
function remove_ajax(id) {
	$.post("remover", { 'id' : id }, 
		function() {
			$("#programa_" + id).closest("tr").hide();
	});
}	

</script>