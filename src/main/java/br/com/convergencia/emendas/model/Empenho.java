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
@Table(name = "empenho")
public class Empenho {

	@Id
	@GeneratedValue
	@Column(name = "idn_empenho")
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "idn_ind_emenda", referencedColumnName = "idn_ind_emenda")
	private IndicacaoEmenda indicacao;

	@Column(name = "valor_empenho")
	private BigDecimal valorDoEmpenho;

	@Column(name = "numero_empenho")
	private Integer numeroDoEmpenho;

	@Column(name = "data_empenho")
	private Date dataDoEmpenho;
	
	@Column(name = "ptres_empenho")
	private String ptres;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public IndicacaoEmenda getIndicacao() {
		return indicacao;
	}

	public void setIndicacao(IndicacaoEmenda indicacao) {
		this.indicacao = indicacao;
	}

	public BigDecimal getValorDoEmpenho() {
		return valorDoEmpenho;
	}

	public void setValorDoEmpenho(BigDecimal valorDoEmpenho) {
		this.valorDoEmpenho = valorDoEmpenho;
	}

	public Integer getNumeroDoEmpenho() {
		return numeroDoEmpenho;
	}

	public void setNumeroDoEmpenho(Integer numeroDoEmpenho) {
		this.numeroDoEmpenho = numeroDoEmpenho;
	}

	public Date getDataDoEmpenho() {
		return dataDoEmpenho;
	}

	public void setDataDoEmpenho(Date dataDoEmpenho) {
		this.dataDoEmpenho = dataDoEmpenho;
	}

	public String getPtres() {
		return ptres;
	}

	public void setPtres(String ptres) {
		this.ptres = ptres;
	}

}
