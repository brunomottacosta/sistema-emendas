<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div>

	<div class="container-fluid">

		
		<div class="row">
				
			<div class="col-md-12">				
				
				<table id="tabela_emendas" class="table table-bordered">
				
					<thead>
						<tr>							
							<th width="10%">ANO</th>
							<th width="15%">NUMERO</th>
							<th>AUTOR</th>
							<th>PROGRAMA</th>
							<th style="width: 5%"></th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${emendas}" var="em">
							<tr>
								<td>${em.ano}</td>
								<td>
									<a href="visualizar/${em.id}">${em.numero}</a>
								</td>
								<td>${em.autor.nome}</td>
								<td>${em.orgaoConcedente.nome}</td>								
								<td style="text-align: center">
									<a href="#" onclick="remove_ajax(${em.id})"> 
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

// inicia datatables
$("#tabela_emendas").dataTable();

// remover
function remove_ajax(id) {
	
	var table = $("#tabela_emendas").DataTable();
	
	// seta linha como selecionada
	$('#tabela_emendas tbody').on( "click", "tr", function () {
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