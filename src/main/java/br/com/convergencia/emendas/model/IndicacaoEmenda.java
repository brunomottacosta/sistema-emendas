package br.com.convergencia.emendas.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ind_emenda")
public class IndicacaoEmenda implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name = "idn_ind_emenda")
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name = "idn_emenda", referencedColumnName = "idn_emenda")
	private Emenda emenda;
	
	@ManyToOne
	@JoinColumn(name = "idn_orgao_conv", referencedColumnName = "idn_orgao_conv")
	private OrgaoConvenente convenente;
	
	@ManyToOne
	@JoinColumn(name = "idn_objeto", referencedColumnName = "idn_objeto")
	private Objeto objeto;
	
	@Column(name = "valor_ind_emenda")
	private BigDecimal valorDestinado;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Emenda getEmenda() {
		return emenda;
	}

	public void setEmenda(Emenda emenda) {
		this.emenda = emenda;
	}

	public OrgaoConvenente getConvenente() {
		return convenente;
	}

	public void setConvenente(OrgaoConvenente convenente) {
		this.convenente = convenente;
	}

	public Objeto getObjeto() {
		return objeto;
	}

	public void setObjeto(Objeto objeto) {
		this.objeto = objeto;
	}

	public BigDecimal getValorDestinado() {
		return valorDestinado;
	}

	public void setValorDestinado(BigDecimal valorDestinado) {
		this.valorDestinado = valorDestinado;
	}
		
}
