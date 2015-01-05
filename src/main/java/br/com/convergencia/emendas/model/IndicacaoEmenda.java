package br.com.convergencia.emendas.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

public class IndicacaoEmenda implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;
	
	private Emenda emenda;
	
	private OrgaoConvenente convenente;
	
	private Objeto objeto;
	
	private BigDecimal valorDestinado;
		
}
