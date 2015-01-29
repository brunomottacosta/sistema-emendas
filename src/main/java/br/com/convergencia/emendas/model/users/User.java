package br.com.convergencia.emendas.model.users;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "system_user")
public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "username", length = 40)
	private String username;
	
	@Column(name = "password", length = 40)
	private String password;
	
	@Column(name = "nome")
	private String nome;
	
	@ManyToMany
	@JoinTable(name = "user_authority", joinColumns = @JoinColumn(name = "idn_user"), inverseJoinColumns = @JoinColumn(name = "idn_authority"))
	private List<Authority> authorities;
	
	@Column(name = "enable", columnDefinition = "BOOLEAN")
	private boolean enable;	

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public boolean isEnable() {
		return enable;
	}

	public void setEnable(boolean enable) {
		this.enable = enable;
	}

	public List<Authority> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(List<Authority> authorities) {
		this.authorities = authorities;
	}
}