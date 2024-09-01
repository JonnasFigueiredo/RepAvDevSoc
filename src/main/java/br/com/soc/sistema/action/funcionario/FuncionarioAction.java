package br.com.soc.sistema.action.funcionario;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import br.com.soc.sistema.business.FuncionarioBusiness;
import br.com.soc.sistema.exception.BusinessException;
import br.com.soc.sistema.filter.FuncionarioFilter;
import br.com.soc.sistema.infra.Action;
import br.com.soc.sistema.infra.OpcoesComboBuscarFuncionarios;
import br.com.soc.sistema.vo.FuncionarioVo;

public class FuncionarioAction extends Action {
	private List<FuncionarioVo> funcionarios = new ArrayList<>();
	private FuncionarioBusiness business = new FuncionarioBusiness();
	private FuncionarioFilter filtrar = new FuncionarioFilter();
	private FuncionarioVo funcionarioVo = new FuncionarioVo();;
	private String erro;

	/* Action para listagem dos funcionários cadastrados */
	public String todos() {
		funcionarios.addAll(business.trazerTodosOsFuncionarios());
		return SUCCESS;
	}

	/* Action para filtrar os funcionários */
	public String filtrar() {

		return SUCCESS;
	}

	/* Action para inclusão de funcionário */
	public String novo() {

		return INPUT;
	}

	public String salvar() {

		business.inserirFuncionario(funcionarioVo);

		return REDIRECT;
	}

	/* Action para edição de funcionário */
	public String alterar() {
		return EDIT;
	}

	public String editar() {
	    try {
	        business.editarFuncionario(funcionarioVo);
	        return REDIRECT;
	    } catch (BusinessException e) {
                setErro(e.getMessage());
	        return EDIT;
	    }
	}
	/* Action para exclusão de funcionário */
	public String excluir() {

		business.deletarFuncionario(Integer.parseInt(funcionarioVo.getRowid()));

		return REDIRECT;
	}

	public List<OpcoesComboBuscarFuncionarios> getListaOpcoesCombo() {
		return Arrays.asList(OpcoesComboBuscarFuncionarios.values());
	}

	public List<FuncionarioVo> getFuncionarios() {
		return funcionarios;
	}

	public void setFuncionarios(List<FuncionarioVo> funcionarios) {
		this.funcionarios = funcionarios;
	}

	public FuncionarioFilter getFiltrar() {
		return filtrar;
	}

	public void setFiltrar(FuncionarioFilter filtrar) {
		this.filtrar = filtrar;
	}

	public FuncionarioVo getFuncionarioVo() {
		return funcionarioVo;
	}

	public void setFuncionarioVo(FuncionarioVo funcionarioVo) {
		this.funcionarioVo = funcionarioVo;
	}

	public String getErro() {
		return erro;
	}

	public void setErro(String erro) {
		this.erro = erro;
	}

}
