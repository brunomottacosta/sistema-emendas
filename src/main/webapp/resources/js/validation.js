$(document).ready(function() {
	$("#").bootstrapValidator({
        framework: 'bootstrap',
        icon: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            numero: {
                row: '.col-xs-4',
                validators: {
                    notEmpty: {
                        message: 'Campo não pode ser nulo.'
                    },
                    stringLength: {
                        min: 8,
                        max: 8,
                        message: 'Campo deve possuir 8 digitos.'
                    },
                    regexp: {
                        regexp: /^[0-9_\.]+$/,
                        message: 'Apenas numeros.'
                    }
                }
            },
            ano: {
                row: '.col-xs-4',
                validators: {
                	notEmpty: {
                        message: 'Campo não pode ser nulo.'
                    },
                    stringLength: {
                        min: 4,
                        max: 4,
                        message: 'Campo deve possuir 4 digitos.'
                    },
                    regexp: {
                        regexp: /^[0-9_\.]+$/,
                        message: 'Apenas numeros.'
                    }
                }
            },
            funcProg: {
                validators: {
                	notEmpty: {
                        message: 'Campo não pode ser nulo.'
                    }
                }
            },
            valor: {
                validators: {
                	notEmpty: {
                        message: 'Campo não pode ser nulo.'
                    },
                    stringLength: {
                        max: 20,
                        message: 'Campo deve possuir no maximo 20 digitos.'
                    },
                    regexp: {
                        regexp: /^[0-9_\.,]+$/,
                        message: 'Apenas numeros.'
                    }
                }
            }
        }
    });
});