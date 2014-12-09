package br.com.convergencia.emendas.model.users;


public enum Authority {
	ROLE_ADMIN("Admin",1), ROLE_USER("User",2);
	
	private final Integer id;
	private final String descricao;
	
	private Authority (String descricao, Integer id) {
		this.descricao = descricao;
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	public String getDescricao() {
		return descricao;
	}
}

