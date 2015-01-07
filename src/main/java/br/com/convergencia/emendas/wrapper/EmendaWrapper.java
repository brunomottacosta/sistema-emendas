package br.com.convergencia.emendas.wrapper;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.NumberFormat;

import org.springframework.stereotype.Component;

import br.com.convergencia.emendas.enums.GND;
import br.com.convergencia.emendas.enums.ModalidadeDeAplicacao;
import br.com.convergencia.emendas.enums.TipoEmenda;
import br.com.convergencia.emendas.model.Emenda;

@Component
public class EmendaWrapper implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String id;
	private String numero;
	private String ano;
	private String valor;
	private String funcionalProgramatica;
	private String tipoEmenda;
	private String modalidadeDeAplicacao;
	private String gnd;
	private String autor;
	private String orgaoConcedente;
	private String programa;
	private String acao;
	
	/** CONVERTE BIGDECIMAL EM STRING FORMATADO R$ **/
	public String setValorToFormatMoney(BigDecimal valor) {
		
		NumberFormat formatador = NumberFormat.getCurrencyInstance();
		String symbol = formatador.getCurrency().getSymbol();
		String formatado = formatador.format(valor);
		formatado = formatado.replace(symbol, "");
		
		if (formatado.endsWith(",00")) {
		    int centsIndex = formatado.lastIndexOf(",00");
		    if (centsIndex != -1) {
		    	formatado = formatado.substring(1, centsIndex);
		    }
		}
		
		return formatado;
	}	
	
	/** RECEBE UM OBJETO E SETA TODOS OS ATRIBUTOS DO SEU "WRAPPER", PASSANDO TUDO PARA STRING **/
	public void setAllAtributtes(Emenda e) {
		
		this.id = e.getId().toString();
		
		if (e.getNumero() != null) {
			this.numero = e.getNumero().toString();			
		}
		if (e.getAno() != null) {
			this.ano = e.getAno().toString();			
		}
		if (e.getValor() != null) {
			this.valor = setValorToFormatMoney(e.getValor());			
		}
		if (!e.getFuncionalProgramatica().isEmpty()) {
			this.funcionalProgramatica = e.getFuncionalProgramatica();			
		}
		this.modalidadeDeAplicacao = ModalidadeDeAplicacao.getModalidadeDeAplicacaoById(e.getModalidadeDeAplicacao().getId()).getDescricao();
		this.tipoEmenda = TipoEmenda.getTipoEmendaById(e.getTipoEmenda().getId()).getDescricao();
		this.gnd = GND.getGNDById(e.getGnd().getId()).getDescricao();
		this.autor = e.getAutor().getNome();
		this.orgaoConcedente = e.getOrgaoConcedente().getNome();
		this.programa = e.getPrograma().getNome();
		this.acao = e.getAcao().getNome();
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getAno() {
		return ano;
	}
	public void setAno(String ano) {
		this.ano = ano;
	}
	public String getValor() {
		return valor;
	}
	public void setValor(String valor) {
		this.valor = valor;
	}
	public String getFuncionalProgramatica() {
		return funcionalProgramatica;
	}
	public void setFuncionalProgramatica(String funcionalProgramatica) {
		this.funcionalProgramatica = funcionalProgramatica;
	}
	public String getTipoEmenda() {
		return tipoEmenda;
	}
	public void setTipoEmenda(String tipoEmenda) {
		this.tipoEmenda = tipoEmenda;
	}
	public String getModalidadeDeAplicacao() {
		return modalidadeDeAplicacao;
	}
	public void setModalidadeDeAplicacao(String modalidadeDeAplicacao) {
		this.modalidadeDeAplicacao = modalidadeDeAplicacao;
	}
	public String getGnd() {
		return gnd;
	}
	public void setGnd(String gnd) {
		this.gnd = gnd;
	}
	public String getAutor() {
		return autor;
	}
	public void setAutor(String autor) {
		this.autor = autor;
	}
	public String getOrgaoConcedente() {
		return orgaoConcedente;
	}
	public void setOrgaoConcedente(String orgaoConcedente) {
		this.orgaoConcedente = orgaoConcedente;
	}
	public String getPrograma() {
		return programa;
	}
	public void setPrograma(String programa) {
		this.programa = programa;
	}

	public String getAcao() {
		return acao;
	}

	public void setAcao(String acao) {
		this.acao = acao;
	}

	
}
