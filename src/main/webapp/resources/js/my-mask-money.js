$(document).ready(function() {
	$(".money").maskMoney({
		showSymbol : true,
		affixesStay: false,
		prefix : "R$",
		decimal : ",",
		thousands : ".",
		allowZero: true
	});
});

$(document).ready(function() {
	$("input.percent").maskMoney({
		showSymbol : true,
		affixesStay: false,
		decimal : ".",
		suffix : "%",
		allowZero: true,
		precision: 1
	});
});