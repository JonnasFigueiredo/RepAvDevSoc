package br.com.soc.sistema.action.exame;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import br.com.soc.sistema.business.ExameBusiness;
import br.com.soc.sistema.exception.BusinessException;
import br.com.soc.sistema.filter.ExameFilter;
import br.com.soc.sistema.infra.Action;
import br.com.soc.sistema.infra.OpcoesComboBuscarExames;
import br.com.soc.sistema.vo.ExameVo;

public class ExameAction extends Action {
	private List<ExameVo> exames = new ArrayList<>();
	private ExameBusiness business = new ExameBusiness();
	private ExameFilter filtrar = new ExameFilter();
	private ExameVo exameVo = new ExameVo();
	private String erro;

	public String todos() {
		exames.addAll(business.trazerTodosOsExames());

		return SUCCESS;
	}

	public String filtrar() {
		if (filtrar.isNullOpcoesCombo())
			return REDIRECT;

		exames = business.filtrarExames(filtrar);

		return SUCCESS;
	}

	public String novo() {
			return INPUT;
	}
	
	public String alterar() {
		return EDIT;
}
	
	public String salvar() {
	    try {
	        business.salvarExame(exameVo);
	        return REDIRECT;
	    } catch (BusinessException e) {
                erro = e.getMessage();
	        return INPUT;
	    }
	}

	public String editar() {
	    try {
	        business.editarExame(exameVo);
	        return REDIRECT;
	    } catch (BusinessException e) {
                erro = e.getMessage();
	        return EDIT;
	    }
	}

	public String excluir() {
	    try {
	        business.excluirExame(exameVo.getRowid());
	        return REDIRECT;
	    } catch (BusinessException e) {
	        erro = e.getMessage(); 
	        addActionError(erro); 
	        return todos(); 
	    }
	}

	public List<OpcoesComboBuscarExames> getListaOpcoesCombo() {
		return Arrays.asList(OpcoesComboBuscarExames.values());
	}

	public List<ExameVo> getExames() {
		return exames;
	}

	public void setExames(List<ExameVo> exames) {
		this.exames = exames;
	}

	public ExameFilter getFiltrar() {
		return filtrar;
	}

	public void setFiltrar(ExameFilter filtrar) {
		this.filtrar = filtrar;
	}

	public ExameVo getExameVo() {
		return exameVo;
	}

	public void setExameVo(ExameVo exameVo) {
		this.exameVo = exameVo;
	}

	public String getErro() {
		return erro;
	}

	public void setErro(String erro) {
		this.erro = erro;
	}
}
