<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<%-- ALTERAÇÃO DE EXAMES --%>
<head>
<meta charset="ISO-8859-1" />
<title><s:text name="label.titulo.pagina.edicao" /></title>
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
        <s:form action="/editarExame.action">
            <div class="card mt-5">
                <div class="card-header">
                    <div class="row">
                        <div class="col-sm-5">
                            <s:url action="todosExames" var="todos" />
                            <a href="${todos}" class="btn btn-warning">Exames</a>
                        </div>

                        <div class="col-sm">
                            <h5 class="card-title">Editar Exame</h5>
                        </div>
                    </div>
                </div>

                <div class="card-body">
                    <div class="row align-items-center">
                        <label for="id" class="col-sm-1 col-form-label text-center">
                            Código: </label>

                        <div class="col-sm-2">
                            <s:textfield cssClass="form-control" id="id" name="exameVo.rowid"
                                readonly="true" />
                        </div>
                    </div>

                    <div class="row align-items-center mt-3">
                        <label for="nome" class="col-sm-1 col-form-label text-center">Nome:
                        </label>
                        <div class="col-sm-5">

                            <input class="form-control" id="nome" name="exameVo.nome"
                                placeholder="Digite o nome (obrigatório)" required />

                        </div>
                    </div>
                </div>

                <div class="card-footer">
                    <div class="form-row">
                        <button class="btn btn-primary col-sm-4 offset-sm-1">Salvar</button>
                        <button type="reset"
                            class="btn btn-secondary col-sm-4 offset-sm-2">Limpar
                            Formulário</button>
                    </div>
                </div>
            </div>
        </s:form>

    </div>

    <!-- Modal de Erro -->
    
    <!-- ALTERAÇÃO AQUI: Verificação se há erro antes de exibir o modal -->
    <s:if test="erro != null && erro.trim().length() > 0">
        <script>
            // Script para abrir o modal automaticamente quando a página carregar
            document.addEventListener('DOMContentLoaded', function () {
                var errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
                errorModal.show();
            });
        </script>

        <!-- Modal -->
        <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="errorModalLabel">Erro</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <s:property value="erro"/>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Entendi</button>
                    </div>
                </div>
            </div>
        </div>
    </s:if> <!-- Fim da verificação de erro -->

    <!-- Bootstrap JS (sem jQuery necessário) -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
