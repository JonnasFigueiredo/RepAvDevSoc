package br.com.soc.sistema.business;

import java.sql.SQLIntegrityConstraintViolationException;
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
	
	public List<ExameVo> trazerTodosOsExames(){
		return dao.findAllExames();
	}	
	
	public void salvarExame(ExameVo exameVo) {
		try {
			if(exameVo.getNome().isEmpty())
				throw new IllegalArgumentException("Nome nao pode ser em branco");
			
			dao.insertExame(exameVo);
		} catch (Exception e) {
			throw new BusinessException("Nao foi possivel realizar a inclusao do registro");
		}
		
	}	
	public void editarExame(ExameVo exameVo) {
		try {
			if (exameVo.getNome().isEmpty())
				throw new IllegalArgumentException("Nome nao pode ser em branco");

			dao.editarExame(exameVo);
			
		} catch (Exception e) {
			throw new BusinessException("Nao foi possivel realizar a edicao do registro");
		}
	}

	
	public void excluirExame(String rowid) {
		try {
		ExameDao exameDao = new ExameDao();
		exameDao.excluirExame(rowid);
	}
		catch (Exception e) {
			throw new BusinessException("Impossível excluir exame");}
		}
	
	public List<ExameVo> filtrarExames(ExameFilter filter){
		List<ExameVo> exames = new ArrayList<>();
		
		switch (filter.getOpcoesCombo()) {
			case ID:
				try {
					Integer codigo = Integer.parseInt(filter.getValorBusca());
					exames.add(dao.findByCodigo(codigo));
				}catch (NumberFormatException e) {
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
		}catch (NumberFormatException e) {
			throw new BusinessException(FOI_INFORMADO_CARACTER_NO_LUGAR_DE_UM_NUMERO);
		}
	}
}
