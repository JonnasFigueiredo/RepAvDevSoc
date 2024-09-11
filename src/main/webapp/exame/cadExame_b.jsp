<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<%-- PAGINA INICIAL EXAMES--%>
<head>
<meta charset="ISO-8859-1">
<title><s:text name="label.titulo.pagina.consulta" /></title>
<link rel='stylesheet'
	href='webjars/bootstrap/5.1.3/css/bootstrap.min.css'>
</head>
<body style="background-color: #128b6e;">

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Sistema de Gestão</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link"
						href="<s:url action='todosExames'/>">Exames</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<s:url action='todosFuncionarios'/>">Funcionários</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<s:url action='todosFichas'/>">Fichas</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<s:url action='relatorio_ExamesRealizadosFicha'/>">Relatório de Exames</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row mt-5 mb-2">
			<div class="col-sm p-0">
				<s:form action="/filtrarExames.action">
					<div class="input-group">
						<span class="input-group-text"> <strong><s:text
									name="label.buscar.por" /></strong>
						</span>
						<div class="col-sm-3">
							<s:select cssClass="form-select" name="filtrar.opcoesCombo"
								list="listaOpcoesCombo" headerKey="" headerValue="Selecione:"
								listKey="%{codigo}" listValueKey="%{descricao}"
								value="filtrar.opcoesCombo.codigo" />
						</div>

						<s:textfield cssClass="form-control" id="nome"
							name="filtrar.valorBusca" />
						<button class="btn btn-primary" type="submit">
							<s:text name="label.pesquisar" />
						</button>
					</div>
				</s:form>
			</div>
		</div>

		<div class="row">
			<table class="table table-light table-striped align-middle">
				<thead>
					<tr>
						<th><s:text name="label.id" /></th>
						<th><s:text name="label.nome" /></th>
						<th class="text-end mt-5"><s:text name="label.acao" /></th>
					</tr>
				</thead>

				<tbody>
					<s:iterator value="exames">
						<tr>
							<td>${rowid}</td>
							<td>${nome}</td>
							<td class="text-end"><s:url action="alterarExames"
									var="alterar">
									<s:param name="exameVo.rowid" value="rowid" />
								</s:url> <a href="${alterar}" class="btn btn-warning text-white"> <s:text
										name="label.editar" />
							</a> <s:url action="excluirExame" var="excluir">
									<s:param name="exameVo.rowid" value="rowid" />
								</s:url> <a href="${excluir}" class="btn btn-danger"> <s:text
										name="label.excluir" />
							</a></td>
						</tr>
					</s:iterator>
				</tbody>

				<tfoot class="table-secondary">
					<tr>
						<td colspan="3"><s:url action="novoExames" var="novo" /> <a
							href="${novo}" class="btn btn-success"> <s:text
									name="label.novo" />
						</a></td>
					</tr>
				</tfoot>
			</table>
		</div>

		<div class="row"></div>
	</div>

	<!-- Modal de erro -->
	<s:if test="erro != null && erro.trim().length() > 0">
		<div class="modal fade" id="errorModal" tabindex="-1"
			aria-labelledby="errorModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="errorModalLabel">Erro</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<s:property value="erro" />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							data-bs-dismiss="modal">Entendi</button>
					</div>
				</div>
			</div>
		</div>

		<script>
			document.addEventListener('DOMContentLoaded', function() {
				var errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
				errorModal.show();
			});
		</script>
		<script>
			var erro = "<s:property escapeHtml='true' value='erro' />";
			console.log("Erro: " + erro);
		</script>
	</s:if>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script src="webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
