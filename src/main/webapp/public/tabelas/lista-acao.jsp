<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div>

	<div class="container-fluid">

		
		<div class="row">
				
			<div class="col-md-12">				
				
				<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#new_acao_modal">
					<i class="fa fa-plus"></i> NOVO					
				</button>
				
				<hr />
				
				<table id="tabela_acoes" class="table table-bordered">
				
					<thead>
						<tr>
							<th style="width: 5%">ID</th>
							<th>NOME</th>
							<th>PROGRAMA</th>
							<th style="width: 5%"></th>
							<th style="width: 5%"></th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${acoes}" var="a">
							<tr>
								<td>${a.id}</td>
								<td>${a.nome}</td>
								<td>${a.programa.nome}</td>
								<td style="text-align: center">
									<a href="#"	onclick="edita_ajax(${a.id},'${a.nome}')">
										<i class="fa fa-pencil-square-o"></i>
									</a>
								</td>
								<td style="text-align: center" id="acao_${a.id}">
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
<c:import url="../modals/acao-modal.jsp"></c:import>

<!-- IMPORT DE MODALS PARA ALTERAR -->
<c:import url="../modals/acao-editar-modal.jsp"></c:import>


<!-- SCRIPTS -->
<script type="text/javascript">

//editar
function edita_ajax(id, nome) {	
	$("#acao_id_edit").val(id);
	$("#acao_nome_edit").val(nome);
	$("#edit_acao_modal").modal("show");	
}

// remover
function remove_ajax(id) {
	$.post("remover", { 'id' : id }, 
		function() {
			$("#acao_" + id).closest("tr").remove();
	});
}	

</script>