<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- MODAL PARA EDITAR INDICACAO -->
<div class="modal fade" id="edit_indicacao_modal" tabindex="-1" role="dialog"  aria-hidden="true">

	<div class="modal-dialog">

		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>

				<h4 class="modal-title">Indicação - Alteração</h4>

			</div>
			
			<div class="modal-body">										
					
				<form action="editar" method="post" id="form_ind_emenda" role="form"> 
					
					<input type="hidden" name="emenda" value="${emenda.id}">
					<input id="id_edit" type="hidden" name="id">						
					
					<div class="form-group">
						<label>Orgão Convenente</label>						
						<select id="convenente_edit" name="convenente"
						class="form-control selectpicker"
						data-live-search="true">
							<c:forEach items="${convenentes}" var="conv_var">
								<option value="${conv_var.id}">${conv_var.nome}</option>
							</c:forEach>					
						</select>	
					</div>
					
					<div class="form-group">
						<label>Objeto</label>						
						<select id="objeto_edit" name="objeto"
						class="form-control selectpicker"
						data-live-search="true">
							<c:forEach items="${objetos}" var="objeto_var">
								<option value="${objeto_var.id}">${objeto_var.nome}</option>
							</c:forEach>
						</select>							
					</div>
					
					<div class="form-group">
						<label class="control-label">Valor Destinado</label>													
						<input type="text" name="valor" id="valor_edit" class="form-control money"> 
					</div>						
					
					<div class="row">
						<div class="col-xs-2">
							<input type="submit" class="btn btn-primary" value="Salvar" >
						</div>
						<div class="col-xs-10">
							<c:if test="${!empty error}">
								<button class="btn btn-danger btn-block" disabled="disabled">
									<i class="fa fa-exclamation-triangle"></i> ${error}
								</button>
							</c:if>
						</div>
					</div>						
					
				</form>				

			</div>

		</div>

	</div>

</div>

<script>


	
</script>