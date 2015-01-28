package br.com.convergencia.emendas.enums;


public enum GND {
	
	EMPTY(0, 0, "Nenhum"),
	OUTRAS_DESPESAS_CORRENTES(1, 3, "Outras despesas correntes"),
	INVESTIMENTOS(2, 4, "Investimentos");
	
	private final String descricao;
	private final Integer id;
	private final Integer numero;
	
	private GND(Integer id, Integer numero, String descricao) {
		this.descricao = descricao;
		this.id = id;
		this.numero = numero;
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

	public Integer getNumero() {
		return numero;
	}
}
