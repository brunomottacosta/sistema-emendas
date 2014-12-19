package br.com.convergencia.testes;

import java.util.HashMap;
import java.util.Map;

public class TesteNewDateAPI {
	public static void main(String[] args) {		

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("numero", 6);
		
		Integer i = Integer.parseInt(map.get("numero").toString());
		
		System.out.println(i);
		
	}
}
