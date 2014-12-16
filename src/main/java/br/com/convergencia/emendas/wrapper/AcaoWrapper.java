package br.com.convergencia.emendas.wrapper;

import java.io.Serializable;

import br.com.convergencia.emendas.model.Acao;

public class AcaoWrapper implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String id;
	private String nome;
	private String programa;
	
	public void setAllAttributes(Acao a) {
		this.id = a.getId().toString();
		this.nome = a.getNome();
		this.programa = a.getPrograma().getNome();	
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getPrograma() {
		return programa;
	}
	public void setPrograma(String programa) {
		this.programa = programa;
	}
	
	
	
}
