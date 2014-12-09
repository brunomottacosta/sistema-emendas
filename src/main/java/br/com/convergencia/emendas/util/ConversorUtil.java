package br.com.convergencia.emendas.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class ConversorUtil {

	public Double mascaraApenasNumero(String string) {

		String replaced = string.replaceAll("[^0-9,]", "").replace(",", ".");
		Double value = Double.parseDouble(replaced);

		return value;
	}

	public Double mascaraApenasNumeroPorcentagem(String string) {

		String replaced = string.replaceAll("[^0-9.]", "");
		Double value = Double.parseDouble(replaced);

		return value;
	}
	
	public Integer mascaraParaInt(String string) {
		
		Integer value = Integer.parseInt(string);
		
		return value;
	}
	
	public Date mascaraParaHora(String string) throws ParseException {
		
		Date parse = (Date) new SimpleDateFormat("hh:mm").parse(string);
		return parse;
	}
}
