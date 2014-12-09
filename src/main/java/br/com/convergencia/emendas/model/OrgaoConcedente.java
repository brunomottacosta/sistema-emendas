package br.com.convergencia.emendas.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "orgao_conced")
public class OrgaoConcedente {
	
	@Id
	@GeneratedValue
	@Column(name = "idn_orgao_conced")
	private Integer id;
	
	@Column(name = "nome_orgao_conced")
	private String nome;

	public Integer getId() {
		return id;
	}

	public String getNome() {
		return nome;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

}
