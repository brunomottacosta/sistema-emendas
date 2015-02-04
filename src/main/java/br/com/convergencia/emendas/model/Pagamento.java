package br.com.convergencia.emendas.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "pagamento")
public class Pagamento {

	@Id
	@GeneratedValue
	@Column(name = "idn_pagamento")
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "idn_empenho", referencedColumnName = "idn_empenho")
	private Empenho empenho;

	@Column(name = "numero_pagamento")
	private Integer numeroDoPagamento;

	@Column(name = "valor_pagamento")
	private BigDecimal valorDoPagamento;

	@Column(name = "data_pagamento")
	private Date dataDoPagamento;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Empenho getEmpenho() {
		return empenho;
	}

	public void setEmpenho(Empenho empenho) {
		this.empenho = empenho;
	}

	public Integer getNumeroDoPagamento() {
		return numeroDoPagamento;
	}

	public void setNumeroDoPagamento(Integer numeroDoPagamento) {
		this.numeroDoPagamento = numeroDoPagamento;
	}

	public BigDecimal getValorDoPagamento() {
		return valorDoPagamento;
	}

	public void setValorDoPagamento(BigDecimal valorDoPagamento) {
		this.valorDoPagamento = valorDoPagamento;
	}

	public Date getDataDoPagamento() {
		return dataDoPagamento;
	}

	public void setDataDoPagamento(Date dataDoPagamento) {
		this.dataDoPagamento = dataDoPagamento;
	}

}
