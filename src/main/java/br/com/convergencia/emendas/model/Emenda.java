package br.com.convergencia.emendas.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import br.com.convergencia.emendas.enums.TipoEmenda;

@Entity
@Table(name = "emenda")
public class Emenda implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name = "idn_emenda")
	private Integer id;
	
	@Column(name = "num_emenda")
	private Integer numero;
	
	@Column(name = "ano_emenda")	
	private Integer ano;
	
	@Column(name = "valor_emenda")
	private BigDecimal valor;	
	
	@Column(name = "func_prog_emenda")
	private String funcionalProgramatica;
	
	@Enumerated(EnumType.ORDINAL)
	@Column(name = "tipo_emenda")
	private TipoEmenda tipoEmenda;
	
	@Column(name = "mod_app_emenda")
	private String modalidadeDeAplicacao;
	
	@Column(name = "gnd_emenda")
	private String gnd;
	
	@ManyToOne
	@JoinColumn(name = "idn_autor", referencedColumnName = "idn_autor")
	private Autor autor;
	
	@ManyToOne
	@JoinColumn(name = "idn_orgao_conced", referencedColumnName = "idn_orgao_conced")
	private OrgaoConcedente orgaoConcedente;
	
	@ManyToOne
	@JoinColumn(name = "idn_programa", referencedColumnName = "idn_programa")
	private Programa programa;
	
	@ManyToOne
	@JoinColumn(name = "idn_acao", referencedColumnName = "idn_acao")
	private Acao acao;
	
	@OneToMany(mappedBy="emenda")
	private List<IndicacaoEmenda> indicacoes;
	
	public Integer getId() {
		return id;
	}

	public Integer getNumero() {
		return numero;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public void setNumero(Integer numero) {
		this.numero = numero;
	}
	
	public Integer getAno() {
		return ano;
	}

	public void setAno(Integer ano) {
		this.ano = ano;
	}
	
	public String getFuncionalProgramatica() {
		return funcionalProgramatica;
	}

	public void setFuncionalProgramatica(String funcionalProgramatica) {
		this.funcionalProgramatica = funcionalProgramatica;
	}

	public Autor getAutor() {
		return autor;
	}

	public TipoEmenda getTipoEmenda() {
		return tipoEmenda;
	}

	public BigDecimal getValor() {
		return valor;
	}

	public OrgaoConcedente getOrgaoConcedente() {
		return orgaoConcedente;
	}

	public String getModalidadeDeAplicacao() {
		return modalidadeDeAplicacao;
	}

	public String getGnd() {
		return gnd;
	}


	public void setAutor(Autor autor) {
		this.autor = autor;
	}

	public void setTipoEmenda(TipoEmenda tipoEmenda) {
		this.tipoEmenda = tipoEmenda;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

	public void setOrgaoConcedente(OrgaoConcedente orgaoConcedente) {
		this.orgaoConcedente = orgaoConcedente;
	}

	public void setModalidadeDeAplicacao(String modalidadeDeAplicacao) {
		this.modalidadeDeAplicacao = modalidadeDeAplicacao;
	}

	public void setGnd(String gnd) {
		this.gnd = gnd;
	}

	public Programa getPrograma() {
		return programa;
	}

	public void setPrograma(Programa programa) {
		this.programa = programa;
	}


	public Acao getAcao() {
		return acao;
	}

	public void setAcao(Acao acao) {
		this.acao = acao;
	}

	public List<IndicacaoEmenda> getIndicacoes() {
		return indicacoes;
	}

	public void setIndicacoes(List<IndicacaoEmenda> indicacoes) {
		this.indicacoes = indicacoes;
	}

}
