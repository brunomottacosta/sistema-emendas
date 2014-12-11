package br.com.convergencia.emendas.enums;


public enum TipoEmenda {
	
	EMPTY(0, "Nenhum"),
	INDIVIDUAL(1, "Individual"),
	BANCADA(2, "Bancada"),
	COLETIVA(3, "Coletiva");
	
	private TipoEmenda(Integer id, String descricao) {
		this.descricao = descricao;
		this.id = id;
	}
	
	public static TipoEmenda getTipoEmendaById(Integer id) {
		for (TipoEmenda tipo : TipoEmenda.values()) {
			if (tipo.getId() == id) {
				return tipo;
			}
		}
		
		return null; 
	}	

	private final String descricao;
	private final Integer id;
	
	public Integer getId() {
		return id;
	}
	
	public String getDescricao() {
		return descricao;
	}
}
