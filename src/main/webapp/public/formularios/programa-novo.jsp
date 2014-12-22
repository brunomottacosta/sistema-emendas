<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container-fluid">
					
		<div class="row">
			
			<div class="col-md-6">
			
				<form action="salvar" method="POST" role="form" id="form_novo_programa">									
					
					<div class="form-group">			
						<button id="salvar_programa" class="btn btn-info" type="button">
							<i class="fa fa-floppy-o"></i> SALVAR
						</button>
					</div>
								
					<div class="form-group">
						<label class="control-label">Nome do Programa</label>
						<input type="text" id="programa_nome" name="nome" class="form-control">
					</div>
					
					<div class="form-group">
						<label class="control-label">Ações</label>
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="row">
									<div class="col-md-1">
										<button type="button" class="btn btn-primary" id="add_input_acao" style="margin-bottom: 10px">
											<i class="fa fa-plus"></i>
										</button>										
									</div>
									<div class="col-md-11" id="inputs_acao">
										<input type="text" class="form-control input-acao" style="margin-bottom: 10px">
									</div>									
								</div>								 							
							</div>
						</div>
					</div>	

				</form>
				
			</div>
			
		</div>
		
</div>

<!-- SCRIPTS -->
<script type="text/javascript">

var num = 0;

// inserir novo campo para acao
$("#add_input_acao").click( function() {
	num = num + 1;
	$("#inputs_acao")
	.append('<div class="input-group" id="input_' + num + '" style="margin-bottom: 10px">' +
			'<input type="text" class="form-control input-acao">' +
			'<span class="input-group-addon"><a type="button" class="text-danger"' +
				'style="cursor: pointer" onclick="remover_input(' + num + ')">' +
			'<i class="fa fa-minus"></i>' +
			'</a></span></div>'
			);
});

// remover campo para acao
function remover_input(id) {
	var inputs = $("#inputs_acao").children("div");
	$.each(inputs, function(pos, obj) {
		var split = obj.id.split("_");
		if (split[1] == id) {
			$("#" + obj.id).remove();
		}
	});
}

// salvar
$("#salvar_programa").click( function() {
	var inputs = $("#inputs_acao").children("input");
	
	$("#form_novo_programa")
	.append("<select id='select_acoes' name='acoes' multiple='multiple' hidden='hidden'></select>");
	
	$.each(inputs, function(pos, obj) {
		$("#select_acoes")
		.append("<option value='" + obj.value + "' selected='selected'></option>");
	});
	
	$("#form_novo_programa").submit();
});

</script>