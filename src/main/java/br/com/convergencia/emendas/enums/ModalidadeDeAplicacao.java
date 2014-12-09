package br.com.convergencia.emendas.enums;


public enum ModalidadeDeAplicacao {
	
	ESTADOS(30, "Estados"),
	MUNICIPIOS(40, "Municípios"),
	ENTIDADES_PRIVADAS(50, "Entidades Privadas"),
	A_DEFINIR(99, "A definir");
	
	private ModalidadeDeAplicacao(Integer id, String descricao) {
		this.descricao = descricao;
		this.id = id;
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
	
	public String getDescricao() {
		return descricao;
	}

	public Integer getId() {
		return id;
	}
}
