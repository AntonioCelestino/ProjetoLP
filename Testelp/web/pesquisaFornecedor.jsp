<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa de Fornecedores</title>
    </head>
    <body>
        <h1>Pesquisa de Fornecedores</h1>
        <table border="1">
            <tr>
                <th>Código Fornecedor</th>
                <th>Nome Fornecedor</th>
                <th colspan="2">Ação</th>
            </tr>
            <c:forEach items="${fornecedores}" var="fornecedor">
                <tr>
                    <td><c:out value="${fornecedor.codFornecedor}"/></td>
                    <td><c:out value="${fornecedor.nome}"/></td>
                    <td>
                        <a href="ManterFornecedorController?acao=prepararEditar&codFornecedor=<c:out value="${fornecedor.codFornecedor}"/>">Editar</a>
                    </td>
                    <td>
                        <a href="ManterFornecedorController?acao=prepararExcluir&codFornecedor=<c:out value="${fornecedor.codFornecedor}"/>">Excluir</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <form action="ManterFornecedorController?acao=prepararIncluir" method="post">
            <input type="submit" name="btnIncluir" value="Incluir"/>
        </form>
    </body>
</html>
