<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<%-- INCLUSUAO DE EXAMES --%>
<head>
<meta charset="ISO-8859-1" />
<title><s:text name="label.titulo.pagina.cadastro" /></title>
<link rel="icon" type="image/png"
	href="https://www.soc.com.br/wp-content/uploads/2020/12/logo-soc.svg" />
<link rel="stylesheet"
	href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" />
<style>
.card-header {
	background-color: #3f8c97;
	color: white;
}

.card-title {
	color: white;
}

.btn-primary {
	background-color: #3f8c97;
	border: none;
}

.btn-primary:hover {
	background-color: #2a6e6f;
}

.btn-secondary {
	border: 1px solid #3f8c97;
}

.btn-secondary:hover {
	background-color: #e0f0f0;
}

.alert-danger {
	margin-top: 10px;
}
</style>
</head>
<body style="background-color: #128b6e;">

	<div class="container">
		<s:form action="/novoExames.action">
			<div class="card mt-5">
				<div class="card-header">
					<div class="row">
						<div class="col-sm-5">
							<s:url action="todosExames" var="todos" />
							<a href="${todos}" class="btn btn-warning">Exames</a>
						</div>
						<div class="col-sm">
							<h5 class="card-title">Novo Exame</h5>
						</div>
					</div>
				</div>

				<div class="card-body">
					<s:if test="hasFieldErrors('exameVo.nome')">
						<div class="alert alert-danger">
							<s:fielderror fieldName="exameVo.nome" />
						</div>
					</s:if>

					<div class="row align-items-center">
						<label for="id" class="col-sm-1 col-form-label text-center">C�digo:</label>
						<div class="col-sm-2">
							<s:textfield cssClass="form-control" id="id" name="exameVo.rowid"
								readonly="true" />
						</div>
					</div>

					<div class="row align-items-center mt-3">
						<label for="nome" class="col-sm-1 col-form-label text-center">Nome:</label>
						<div class="col-sm-5">
							<s:textfield cssClass="form-control" id="nome"
								name="exameVo.nome" placeholder="Digite o nome (obrigat�rio)" />
						</div>
					</div>
				</div>

				<div class="card-footer">
					<div class="form-row">
						<button class="btn btn-primary col-sm-4 offset-sm-1">Salvar</button>
						<button type="reset"
							class="btn btn-secondary col-sm-4 offset-sm-2">Limpar
							Formul�rio</button>
					</div>
				</div>
			</div>
		</s:form>
	</div>

	<script src="webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
