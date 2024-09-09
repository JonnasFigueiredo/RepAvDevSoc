package br.com.soc.sistema.business;

import java.util.ArrayList;
import java.util.List;

import br.com.soc.sistema.dao.exames.ExameDao;
import br.com.soc.sistema.exception.BusinessException;
import br.com.soc.sistema.filter.ExameFilter;
import br.com.soc.sistema.vo.ExameVo;

public class ExameBusiness {

	private static final String FOI_INFORMADO_CARACTER_NO_LUGAR_DE_UM_NUMERO = "Foi informado um caracter no lugar de um numero";
	private ExameDao dao;

	public ExameBusiness() {
		this.dao = new ExameDao();
	}

	public List<ExameVo> trazerTodosOsExames() {
		return dao.findAllExames();
	}

	public void salvarExame(ExameVo exameVo) {
		try {
			// Verifica se o nome está vazio
			if (exameVo.getNome() == null || exameVo.getNome().isEmpty()) {
				throw new IllegalArgumentException("Nome não pode ser em branco");
			}

			if (!exameVo.getNome().matches("[a-zA-Z0-9 ]*")) {
				throw new IllegalArgumentException("Nome não pode conter caracteres especiais");
			}

			dao.insertExame(exameVo);

		} catch (IllegalArgumentException e) {
			throw new BusinessException("Erro ao Inserir Exame: " + e.getMessage());
		}

	}

	public void editarExame(ExameVo exameVo) {
		try {
			// Verifica se o nome está vazio
			if (exameVo.getNome() == null || exameVo.getNome().isEmpty()) {
				throw new IllegalArgumentException("Nome não pode ser em branco");
			}

			if (!exameVo.getNome().matches("[a-zA-Z0-9 ]*")) {
				throw new IllegalArgumentException("Nome não pode conter caracteres especiais");
			}
			dao.editarExame(exameVo);
		} catch (IllegalArgumentException e) {
			throw new BusinessException("Erro ao Inserir Exame: " + e.getMessage());
		}

	}

	public void excluirExame(String rowid) throws BusinessException {
	    try {
	        dao.excluirExame(rowid); // Chama o método de exclusão no DAO
	    } catch (Exception e) {
	        throw new BusinessException("Erro ao excluir o exame: Verifique se ele já foi realizado por um funcionário.");
	    }
	}

	public List<ExameVo> filtrarExames(ExameFilter filter) {
		List<ExameVo> exames = new ArrayList<>();

		switch (filter.getOpcoesCombo()) {
		case ID:
			try {
				Integer codigo = Integer.parseInt(filter.getValorBusca());
				exames.add(dao.findByCodigo(codigo));
			} catch (NumberFormatException e) {
				throw new BusinessException(FOI_INFORMADO_CARACTER_NO_LUGAR_DE_UM_NUMERO);
			}
			break;

		case NOME:
			exames.addAll(dao.findAllByNome(filter.getValorBusca()));
			break;
		}

		return exames;
	}

	public ExameVo buscarExamePor(String codigo) {
		try {
			Integer cod = Integer.parseInt(codigo);
			return dao.findByCodigo(cod);
		} catch (NumberFormatException e) {
			throw new BusinessException(FOI_INFORMADO_CARACTER_NO_LUGAR_DE_UM_NUMERO);
		}
	}
}
