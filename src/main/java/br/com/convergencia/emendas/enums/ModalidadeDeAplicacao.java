package br.com.convergencia.emendas.enums;


public enum ModalidadeDeAplicacao {
	
	EMPTY(0, 0, "Nenhum"),
	ESTADOS(1, 30, "Estados"),
	MUNICIPIOS(2, 40, "Municípios"),
	ENTIDADES_PRIVADAS(3, 50, "Entidades Privadas"),
	A_DEFINIR(4, 99, "À Definir");
	
	private ModalidadeDeAplicacao(Integer id, Integer numero, String descricao) {
		this.descricao = descricao;
		this.id = id;
		this.numero = numero;
	}
	
	public static ModalidadeDeAplicacao getModalidadeDeAplicacaoById(Integer id) {
		for (ModalidadeDeAplicacao mda : ModalidadeDeAplicacao.values()) {
			if (mda.getId() == id) {
				return mda;
			}
		}
		
		return null; 
	}
	
	private final String descricao;
	private final Integer id;
	private final Integer numero;
	
	public String getDescricao() {
		return descricao;
	}

	public Integer getId() {
		return id;
	}

	public Integer getNumero() {
		return numero;
	}
}
