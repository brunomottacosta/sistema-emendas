<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- MODAL PARA NOVO AUTOR -->
<div class="modal fade" id="new_acao_modal" tabindex="-1" role="dialog"  aria-hidden="true">

	<div class="modal-dialog">

		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>

				<h4 class="modal-title">Ação - Novo</h4>

			</div>
			
			<div class="modal-body">

				<form action="salvar" method="POST" role="form" id="form_novo_acao">									
								
					<div class="form-group">						
						<label>Nome</label>
						<input type="text" id="acao_nome" name="nome" class="form-control">					
					</div>
					
					<div class="form-group">
						<label>Programa</label>
						<select id="acao_prog" data-live-search="true"
						class="form-control drop-pesquisa selectpicker" name="idPrograma">										
							<c:forEach items="${programas}" var="prog_var" >
								<option value="${prog_var.id}">
									${prog_var.nome}
								</option>
							</c:forEach>
						</select> 
					</div>
											
					<div class="form-group">			
						<button id="salvar_acao" class="btn btn-info btn-block">
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
		$("#salvar_acao").click( function() {
			$("#form_novo_acao").submit();
		});
	});
	
</script>