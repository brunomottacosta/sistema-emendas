<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div>

	<div class="container-fluid">

		
		<div class="row">
				
			<div class="col-md-12">				
				
				<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#new_produto_modal">
					<i class="fa fa-plus"></i> NOVO					
				</button>
				
				<hr />
				
				<table id="tabela_produtos" class="table table-bordered">
				
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
						<c:forEach items="${produtos}" var="p">
							<tr>
								<td>${p.id}</td>
								<td>${p.nome}</td>
								<td>${p.acao.nome}</td>
								<td>${p.acao.programa.nome}</td>
								<td style="text-align: center">
									<a href="#"	onclick="edita_ajax(${p.id},'${p.nome}')">
										<i class="fa fa-pencil-square-o"></i>
									</a>
								</td>
								<td style="text-align: center" id="produto_${p.id}">
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
<c:import url="../modals/produto-modal.jsp"></c:import>

<!-- IMPORT DE MODALS PARA ALTERAR -->
<c:import url="../modals/produto-editar-modal.jsp"></c:import>


<!-- SCRIPTS -->
<script type="text/javascript">

//editar
function edita_ajax(id, nome) {	
	$("#produto_id_edit").val(id);
	$("#produto_nome_edit").val(nome);
	$("#edit_produto_modal").modal("show");	
}

// remover
function remove_ajax(id) {
	$.post("remover", { 'id' : id }, 
		function() {
			$("#produto_" + id).closest("tr").hide();
	});
}	

</script>