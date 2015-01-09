package br.com.convergencia.emendas.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.convergencia.emendas.enums.GND;
import br.com.convergencia.emendas.model.Emenda;
import br.com.convergencia.emendas.model.IndicacaoEmenda;
import br.com.convergencia.emendas.model.Objeto;
import br.com.convergencia.emendas.repository.EmendaRepository;

@Service
public class EmendaService {
	
	private static final Logger logger = LoggerFactory.getLogger(EmendaService.class);	
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	// Injeções de Dependencia //
	// ~~~~~~~~~~~~~~~~~~~~~~~~//
	
	@Autowired private EmendaRepository emendaRepository;
	@Autowired private AcaoService acaoService;
	@Autowired private ObjetoService objetoService;
	@Autowired private ProgramaService programaService;
	@Autowired private IndicacaoEmendaService indicacaoEService;
	
	// ~~~~~~~~~~~~~~~~~~~~//
	//   Métodos Mapeados  //
	// ~~~~~~~~~~~~~~~~~~~~//
	
	@Transactional
	public void save(Emenda emenda) {
		emendaRepository.save(emenda);
	}
	
	@Transactional
	public void update(Emenda emenda) {
		emendaRepository.save(emenda);
	}
	
	@Transactional
	public void delete(Emenda emenda) {
		emendaRepository.delete(emenda.getId());
	}
	
	@Transactional
	public List<Emenda> listAll() {
		return (List<Emenda>) emendaRepository.findAll();
	}
	
	@Transactional
	public Emenda getEmenda(Integer id) {
		return emendaRepository.findOne(id);
	}
	
	/** BUSCAS AVANCADAS **/	
	@Transactional
	public List<Emenda> listByFiltro(Map<String, String> itens) {
		
		logger.info("## EXECUTANDO BUSCA AVANCADA ##");
		Long init = Calendar.getInstance().getTimeInMillis();
		
		List<Emenda> lista = emendaRepository.findAll();
		Stream<Emenda> busca = lista.parallelStream();
		
		/** FILTROS UTILIZANDO LAMBDA EXPRESSIONS JAVA 8 **/
		if (!itens.get("ano").isEmpty()) {
			busca = busca.filter(e -> e.getAno().toString().equals(itens.get("ano")));			
		}
		if (!itens.get("numero").isEmpty()) {
			busca = busca.filter(e -> e.getNumero().toString().contains(itens.get("numero")));
		}
		if (!itens.get("funcional").isEmpty()) {
			busca = busca.filter(e -> e.getFuncionalProgramatica().contains(itens.get("funcional")));
		}		
		if (!itens.get("tipo").equals("0")) {
			busca = busca.filter(e -> e.getTipoEmenda().getId().toString().equals(itens.get("tipo")));
		}
		if (!itens.get("orgao").equals("0")) {
			busca = busca.filter(e -> e.getOrgaoConcedente().getId().toString().equals(itens.get("orgao")));
		}
		if (!itens.get("autor").equals("0")) {
			busca = busca.filter(e -> e.getAutor().getId().toString().equals(itens.get("autor")));
		}
		if (!itens.get("programa").equals("0")) {
			busca = busca.filter(e -> e.getPrograma().getId().toString().equals(itens.get("programa")));
		}
		if (!itens.get("acao").equals("0")) {			
			busca = busca.filter(e -> e.getAcao().getId().toString().equals(itens.get("acao")));
		}
		if (!itens.get("objeto").equals("0")) {
			Objeto o = objetoService.getObjeto(Integer.parseInt(itens.get("objeto")));
			
			/** FILTER RECEBE SEMPRE TRUE OU FALSE, ENTAO RETORNO NECESSITA SER UM BOOLEAN **/
			busca = busca.filter(e -> {
				List<Objeto> objs = objetoService.findByEmenda(e.getId());
				if (!objs.isEmpty()) {
					int count = 0;
					for (Objeto ob : objs) {
						if (ob.getId() != o.getId()) {
							count ++;
						}						
					}
					if (objs.size() == count) {
						return false;
					} else {
						return true;
					}
				} else {
					return false;
				}			
			});
		}
		if (!itens.get("modalidade").equals("0")) {
			busca = busca.filter(e -> {
				String modalidade = itens.get("modalidade");				
				String[] s = e.getModalidadeDeAplicacao().split("_");
				if (s.length > 0) {
					int count = 0;
					for (String st : s) {
						if (!st.equals(modalidade)) {
							count ++;
						}
					}
					if (s.length == count) {
						return false;
					} else {
						return true;
					}
				} else {
					return false;
				}
			});
		}
		if (!itens.get("gnd").equals("0")) {
			busca = busca.filter(e -> {
				String gnd = itens.get("gnd");				
				String[] s = e.getGnd().split("_");
				if (s.length > 0) {
					int count = 0;
					for (String st : s) {
						if (!st.equals(gnd)) {
							count ++;
						}
					}
					if (s.length == count) {
						return false;
					} else {
						return true;
					}
				} else {
					return false;
				}
			});
		}
		
		List<Emenda> result = busca.collect(Collectors.toList());
		
		Long end = Calendar.getInstance().getTimeInMillis();		
		logger.info("## TEMPO DE BUSCA: " + (end - init) + " ms ##");
		
		return result;
	}
	
	/** CALCULO VALOR DISPONIVEL EMENDA **/
	public BigDecimal calculaValorDisponivel(Emenda e) {
		
		BigDecimal valorDisponivel = new BigDecimal(0);
		BigDecimal valorUsado = new BigDecimal(0);
		BigDecimal valorTotal = e.getValor();
		
		List<IndicacaoEmenda> indicacoes = indicacaoEService.findByEmenda(e);
		
		for (IndicacaoEmenda indicacao : indicacoes) {
			valorUsado = valorUsado.add(indicacao.getValorDestinado());
		}
		
		valorDisponivel = valorTotal.min(valorUsado);
		
		return valorDisponivel;
	}
	
	public List<GND> buscarGnds(String s) {
		
		List<GND> lista = new ArrayList<GND>();
		
		return lista;
	}
}
