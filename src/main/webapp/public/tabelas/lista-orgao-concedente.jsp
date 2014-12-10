<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div>

	<div class="container-fluid">

		
		<div class="row">
				
			<div class="col-md-12">				
				
				<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#new_org_conced_modal">
					<i class="fa fa-plus"></i> NOVO						
				</button>
				
				<hr />
				
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

<!-- IMPORT DE MODALS PARA ADICIONAR -->
<c:import url="../modals/orgao-concedente-modal.jsp"></c:import>

<!-- IMPORT DE MODALS PARA ALTERAR -->
<c:import url="../modals/orgao-concedente-editar-modal.jsp"></c:import>


<!-- SCRIPTS -->
<script type="text/javascript">

//editar
function edita_ajax(id, nome) {	
	$("#orgao_id_edit").val(id);
	$("#orgao_nome_edit").val(nome);
	$("#edit_orgao_modal").modal("show");	
}

// remover
function remove_ajax(id) {
	$.post("remover", { 'id' : id }, 
		function() {
			$("#org_" + id).closest("tr").hide();
	});
}	

</script>