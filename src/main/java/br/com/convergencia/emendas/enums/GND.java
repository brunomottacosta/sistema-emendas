package br.com.convergencia.emendas.enums;


public enum GND {
	
	OUTRAS_DESPESAS_CORRENTES(3, "Outras despesa correntes"),
	INVESTIMENTOS(4, "Investimentos");
	
	private final String descricao;
	private final Integer id;
	
	private GND(Integer id, String descricao) {
		this.descricao = descricao;
		this.id = id;
	}
	
	 public static GND getGNDById(Integer id) {
		for (GND gnd : GND.values()) {
			if (gnd.getId() == id) {
				return gnd;
			}
		}
		
		return null;  
	}

	public String getDescricao() {
		return descricao;
	}

	public Integer getId() {
		return id;
	}
}
