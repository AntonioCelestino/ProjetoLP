<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Curso</title>
    </head>
    <body>
        <h1>Manter Curso - ${operacao}</h1>
        <form action="ManterCursoController?acao=confirmar${operacao}" method="post" name="frmManterCurso" onsubmit="return validarFormulario(this)">
            <table>
                <tr>
                    <td>Código:</td> 
                    <td><input type="text" name="txtCodCurso" value="${curso.codCurso}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Nome do Curso:</td> 
                    <td><input type="text" name="txtNomeCurso" value="${curso.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Período:</td> 
                    <td>
                        <select name="optPeriodo" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <option value="" <c:if test="${curso.periodo == null}"> selected</c:if>> </option>
                        <option value="Diurno" <c:if test="${curso.periodo == 'Diurno'}"> selected</c:if>>Diurno</option>
                        <option value="Noturno" <c:if test="${curso.periodo == 'Noturno'}"> selected</c:if>>Noturno</option>
                        <option value="Integral" <c:if test="${curso.periodo == 'Integral'}"> selected</c:if>>Integral</option> 
                        </select>
                    </td>
                </tr>
                <tr> 
                    <td>Nível:</td> 
                    <td>
                        <select name="optNivelCurso" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="" <c:if test="${curso.nivel == null}"> selected</c:if>> </option>
                            <option value="Técnico" <c:if test="${curso.nivel == 'Técnico'}"> selected</c:if>>Técnico</option>
                            <option value="Superior" <c:if test="${curso.nivel == 'Superior'}"> selected</c:if>>Superior</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnConfirmar" value="Confirmar"></td>
                </tr>
            </table>
        </form>
        <SCRIPT language="JavaScript">
            <!--
            
            function campoNumerico(valor)
            {
                var caracteresValidos = "0123456789";
                var ehNumero = true;
                var umCaracter;
                for (i = 0; i < valor.length && ehNumero == true; i++) 
                { 
                    umCaracter = valor.charAt(i); 
                    if (caracteresValidos.indexOf(umCaracter) == -1) 
                    {
                        ehNumero = false;
                    }
                }
                return ehNumero;
            }

            function validarFormulario(form) { 
                var mensagem;
                mensagem = "";
                if (form.txtCodCurso.value == ""){
                    mensagem = mensagem + "Informe o Código do Curso\n";
                }                             
                if (form.txtNomeCurso.value == ""){
                    mensagem = mensagem + "Informe o Nome do Curso\n";
                }
                if (form.optPeriodo.value == ""){
                    mensagem = mensagem + "Selecione um Período\n";
                }
                if (form.optNivelCurso.value == ""){
                    mensagem = mensagem + "Selecione um Nível de Curso\n";
                }
                if (!campoNumerico(form.txtCodCurso.value)){
                    mensagem = mensagem + "Código do Curso deve ser numérico\n";
                }                                   
                if (mensagem == ""){
                    return true;
                }else{
                    alert(mensagem);
                    return false;
                }                
            } 
            //-->
        </SCRIPT>  
    </body>
</html>