package br.com.convergencia.emendas.model;

import java.io.Serializable;
import java.util.List;

public class OrgaoConvenente implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	
	private String nome;
	
	private String cnpj;

	private List<IndicacaoEmenda> indicacoes;
}
