<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<button class="btn btn-danger not-visible" id="toggle_on"> 
	<i class="fa fa-plus fa-2x"></i>
</button>

<div id="side_menu">

	<div class="list-group">
		<button type="button" class="list-group-item" id="toggle_off" 
				style="border-top-right-radius: 25px; border-top-left-radius: 25px">
			<i class="fa fa-minus fa-2x"></i>
		</button>
		<a href="/sistema/protected/index" class="list-group-item" style="border-top-right-radius: 4px;">
			<i class="fa fa-th-large"></i> Notícias
		</a>
		<a href="/sistema/protected/emenda/pesquisa" class="list-group-item">
			<i class="fa fa-search"></i> Buscar Emenda
		</a>
		<a href="/sistema/protected/emenda/registro/novo" class="list-group-item">
			<i class="fa fa-plus"></i> Cadastrar Emenda
		</a>
	</div>				
	
	<div class="list-group">
		<a class="list-group-item logout" href="<c:url value='/logout' />">
			<i class="fa fa-fw fa-power-off"></i> Logout
		</a>
	</div>
		
</div>	

<script type="text/javascript">

$("#toggle_off").click( function() {
	$("#side_menu").toggle("slide", 300, function() {
		$("#toggle_on").toggle("fade", 150);
	});
	
});

$("#toggle_on").click( function() {
	$("#toggle_on").toggle("fade", 150, function() {
		$("#side_menu").toggle("slide", 200);
	});	
});
	
</script>