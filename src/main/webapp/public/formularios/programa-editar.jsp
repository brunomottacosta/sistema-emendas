<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container-fluid">
					
	<div class="row">
		
		<div class="col-md-6">
		
			<form action="../editar" method="POST" role="form" id="form_editar_programa">									
				
				<input id="programa_id" type="hidden" name="id" value="${programa.id}">
				
				<div class="form-group">			
					<button id="salvar_programa" class="btn btn-info" type="button">
						<i class="fa fa-floppy-o"></i> SALVAR
					</button>
				</div>
							
				<div class="form-group">
					<label class="control-label">Nome do Programa</label>
					<input type="text" id="programa_nome" name="nome" class="form-control" value="${programa.nome}">
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
									<button type="button" class="btn btn-danger input-remover"  id="remove_input_acao">
										<i class="fa fa-minus"></i>
									</button>	
								</div>
								<div class="col-md-11" id="inputs_acao">
									<!-- INPUT DE ACOES -->
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

// iniciar dados para edicao
( function() {
	var id = $("#programa_id").val();
	$.ajax({
		type: "GET",
		url: "../../acao/lista/programa/" + id,
		success: function(json) {
			$.each(json, function(pos, obj) {
				num = num + 1;
				$("#inputs_acao")
				.append(
					'<input id="input_' + num + '_' + obj.id + '" type="text" class="form-control input-acao" ' +
					'style="margin-bottom: 10px" value="' + obj.nome + '">'
				);
			});
		}
	});
})();

// inserir novo campo para acao
$("#add_input_acao").click( function() {
	num = num + 1;
	$("#inputs_acao")
	.append('<input id="input_' + num + '" type="text" class="form-control input-acao" style="margin-bottom: 10px">');
});

//remover campo para acao
$("#remove_input_acao").click( function() {
	var inputs = $("#inputs_acao").children("input");
	$.each(inputs, function(pos, obj) {
		var split = obj.id.split("_");
		if (split[1] == num && num != 1) {
			$("#" + obj.id).remove();
			num = num - 1;
		}
	});
});

// salvar 
$("#salvar_programa").click( function() {
	var inputs = $("#inputs_acao").children("input");

	$("#select_acoes").remove();
	
	$("#form_editar_programa")
	.append("<select id='select_acoes' name='acoes' multiple='multiple' hidden='hidden'></select>");

    	$.each(inputs, function(pos, obj) {
		var split = obj.id.split("_");
		if (split[2] > 0) {
			$("#select_acoes")
			.append("<option value='" + obj.value + "_" + split[2] + "' selected='selected'></option>");
		} else {
			$("#select_acoes")
			.append("<option value='" + obj.value + "_0' selected='selected'></option>");
		}
	});
	
	$("#form_editar_programa").submit();
});

</script>