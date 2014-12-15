<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- MODAL PARA NOVO PRODUTO -->
<div class="modal fade" id="new_produto_modal" tabindex="-1" role="dialog"  aria-hidden="true">

	<div class="modal-dialog">

		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>

				<h4 class="modal-title">Adicionar Programa:</h4>

			</div>
			
			<div class="modal-body">

				<form action="salvar" method="POST" role="form" id="form_novo_produto">									
								
					<div class="form-group">						
						<label>Nome</label>
						<input type="text" id="produto_nome" name="nome" class="form-control">					
					</div>
					
					<div class="form-group">
						<label>Programa</label>
						<select id="produto_acao" data-live-search="true"
						class="form-control drop-pesquisa selectpicker" name="idAcao">										
							<c:forEach items="${acoes}" var="acao_var" >
								<option value="${acao_var.id}">
									${acao_var.nome}
								</option>
							</c:forEach>
						</select> 
					</div>
											
					<div class="form-group">			
						<button id="salvar_produto" class="btn btn-info btn-block">
							<i class="fa fa-floppy-o"></i> SALVAR
						</button>
					</div>				

				</form>

			</div>

		</div>

	</div>

</div>

<script>

//salvar

	$(document).ready( function() {
		$("#salvar_produto").click( function() {
			$("#form_novo_produto").submit();
		});
	});
	
</script>