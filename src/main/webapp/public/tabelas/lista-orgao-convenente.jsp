<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div>

	<div class="container-fluid">
		
		<div class="row">
			<div class="col-md-12">
				<div class="page-header">
					<h2 class="text-info">Lista de Orgãos Convenentes Cadastrados</h2>
				</div>
			</div>
		</div>
		
		<div class="row">
				
			<div class="col-md-12">				
				
				<a class="btn btn-warning" href="novo">
					<i class="fa fa-plus"></i> NOVO						
				</a>
				
				<hr />
				
				<!-- ###################### -->
				<!-- LISTA ORGAO CONCEDENTE -->
				<!-- ###################### -->
				
				<table id="tabela_org_conv" class="table table-bordered">				
					<thead>
						<tr>
							<th style="width: 5%">ID</th>
							<th>NOME</th>
							<th>CNPJ</th>
							<th style="width: 5%"></th>
							<th style="width: 5%"></th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${convenentes}" var="conv">
							<tr>
								<td>${conv.id}</td>
								<td>${conv.nome}</td>
								<td>${conv.cnpj}</td>
								<td style="text-align: center">
									<a href="alteracao/${conv.id}">
										<i class="fa fa-pencil-square-o"></i>
									</a>
								</td>
								<td style="text-align: center" id="org_${conv.id}">
									<a href="#" onclick="remove_ajax(${conv.id})"> 
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

<!-- SCRIPTS -->
<script type="text/javascript">

//inicia datatables
$("#tabela_org_conv").dataTable();

// remover
function remove_ajax(id) {
	var table = $("#tabela_org_conv").DataTable();
	
	// seta linha como selecionada
	$('#tabela_org_conv tbody').on( "click", "tr", function () {
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