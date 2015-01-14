<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- MODAL PARA NOVO PRODUTO -->
<div class="modal fade" id="new_convenente_modal" tabindex="-1" role="dialog"  aria-hidden="true">

	<div class="modal-dialog">

		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>

				<h4 class="modal-title">Novo Orgão Convenente</h4>

			</div>
			
			<div class="modal-body">

				<form action="../../orgao-convenente/salvarEmIndicacao" method="POST" role="form" id="form_novo_convenente">									
								
					<input type="hidden" name="emenda" value="${emenda.id}"> 			
								
					<div class="form-group">
						<label class="control-label">Orgão Convenente</label>
						<input type="text" id="orgao_convenente_nome" name="nome" class="form-control">
					</div>
					
					<div class="form-group">
						<label class="control-label">CNPJ</label>
						<input type="text" id="orgao_convenente_cnpj" name="cnpj" class="form-control cnpj">
					</div>			
					
					<div class="form-group">			
						<button id="salvar_convenente" class="btn btn-info btn-block">
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
	$("#salvar_convenente").click( function() {
		$("#form_novo_convenente").submit();
	});
});
	
</script>