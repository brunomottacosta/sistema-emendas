package br.com.convergencia.emendas.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "acao")
public class Acao implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name = "idn_acao")
	private Integer id;
	
	@Column(name = "nome_acao")
	private String nome;
	
	@OneToMany(mappedBy = "acao")
	private List<Objeto> objetos;
	
	@ManyToOne
	@JoinColumn(name = "idn_programa", referencedColumnName = "idn_programa")
	private Programa programa;
	
	@ManyToOne
	@JoinColumn(name = "idn_emenda", referencedColumnName = "idn_emenda")
	private Emenda emenda;

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

	public List<Objeto> getProdutos() {
		return objetos;
	}

	public void setProdutos(List<Objeto> objetos) {
		this.objetos = objetos;
	}

	public Programa getPrograma() {
		return programa;
	}

	public void setPrograma(Programa programa) {
		this.programa = programa;
	}

	public Emenda getEmenda() {
		return emenda;
	}

	public void setEmenda(Emenda emenda) {
		this.emenda = emenda;
	}

}
