package br.com.convergencia.emendas.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import br.com.convergencia.emendas.enums.GND;
import br.com.convergencia.emendas.enums.ModalidadeDeAplicacao;
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
	
	@Transient
	private List<ModalidadeDeAplicacao> modalidades;
	
	@Column(name = "gnd_emenda")
	private String gnd;
	
	@Transient
	private List<GND> gnds;
	
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
	
	@OneToMany(mappedBy="emenda", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<IndicacaoEmenda> indicacoes;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getNumero() {
		return numero;
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
	
	/** CRIA LISTA DO ENUM UTILIZANDO A STRING SALVA NO BANCO, SEPARANDO OS IDS PELO "_" **/
	public List<ModalidadeDeAplicacao> getModalidades() {
		String[] ids = {};
		List<ModalidadeDeAplicacao> modalidades = new ArrayList<ModalidadeDeAplicacao>();
		ids = this.modalidadeDeAplicacao.split("_");
		
		for (String s : ids) {
			ModalidadeDeAplicacao modalidade = ModalidadeDeAplicacao.getModalidadeDeAplicacaoById(Integer.parseInt(s));
			modalidades.add(modalidade);
		}
		this.modalidades = modalidades;
		return modalidades;
	}
	
	public void setModalidades(List<ModalidadeDeAplicacao> modalidades) {
		this.modalidades = modalidades;
	}
	
	/** CRIA LISTA DO ENUM UTILIZANDO A STRING SALVA NO BANCO, SEPARANDO OS IDS PELO "_" **/
	public List<GND> getGnds() {
		String[] ids = {};
		List<GND> gnds = new ArrayList<GND>();
		ids = this.gnd.split("_");
		
		for (String s : ids) {
			GND gnd = GND.getGNDById(Integer.parseInt(s));
			gnds.add(gnd);
		}
		this.gnds = gnds;
		return gnds;
	}
	
	public void setGnds(List<GND> gnds) {
		this.gnds = gnds;
	}
}
