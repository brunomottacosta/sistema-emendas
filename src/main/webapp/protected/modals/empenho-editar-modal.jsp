<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- MODAL PARA EDITAR INDICACAO -->
<div class="modal fade" id="edit_empenho_modal" tabindex="-1" role="dialog"  aria-hidden="true" style="padding-top: 10em">

	<div class="modal-dialog">

		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>

				<h4 class="modal-title">Empenho - Alteração</h4>

			</div>
			
			<div class="modal-body">										
					
				<form action="editar" method="post" id="form_empenhoa" role="form"> 
					
					<input type="hidden" name="indicacao" value="${indicacao.id}">
					<input type="hidden" name="id" id="id_edit">						
					
					<div class="row">
					
						<div class="col-xs-6">
						
							<div class="form-group">
								<label>Valor do Empenho</label>
								<input type="text" name="valorDoEmpenho" id="valor_edit" 
								class="form-control money" placeholder="0,00" maxlength="21"> 	
							</div>
						
						</div>
						<div class="col-xs-6">
						
							<div class="form-group">
								<label>Número do Empenho</label>
								<input type="text" name="numeroDoEmpenho" id="numero_edit" 
								class="form-control"> 
							</div>
							
						</div>
					
					</div>										
					
					<div class="row">
		
						<div class="col-xs-6">
						
							<div class="form-group">
								<label class="control-label">Data do Empenho</label>													
								<input type="text" name="dataDoEmpenho" id="data_edit" 
								class="form-control data-completa" placeholder="DD/MM/YYYY"> 
							</div>				
							
						</div>
						<div class="col-xs-6">	
							
							<div class="form-group">
								<label class="control-label">PTRES</label>													
								<input type="text" name="ptres" id="ptres_edit" 
								class="form-control"> 
							</div>
						
						</div>																
					
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

<script type="text/javascript">


	
</script>