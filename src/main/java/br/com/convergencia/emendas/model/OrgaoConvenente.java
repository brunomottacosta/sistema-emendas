package br.com.convergencia.emendas.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "orgao_conv")
public class OrgaoConvenente implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name = "idn_orgao_conv")
	private Integer id;
	
	@Column(name = "nome_orgao_conv")
	private String nome;
	
	@Column(name = "cnpj_orgao_conv")
	private String cnpj;
	
	@OneToMany(mappedBy = "convenente")
	private List<IndicacaoEmenda> indicacoes;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public List<IndicacaoEmenda> getIndicacoes() {
		return indicacoes;
	}

	public void setIndicacoes(List<IndicacaoEmenda> indicacoes) {
		this.indicacoes = indicacoes;
	}
}
