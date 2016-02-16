<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Aluno</title>
    </head>
    <body>
        <h1>Manter Aluno - ${operacao}</h1>
        <form action="ManterAlunoController?acao=confirmar${operacao}" method="post" name="frmManterAluno" onsubmit="return validarFormulario(this)">
            <table>
                <tr> 
                    <td>Nome do Usuário:</td> 
                    <td>
                        <select name="optUsuario" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="0" <c:if test="${aluno.codUsuario == null}"> selected</c:if>> </option>  
                            <c:forEach items="${usuarios}" var="usuario">
                                <option value="${usuario.codUsuario}" <c:if test="${aluno.codUsuario == usuario.codUsuario}"> selected</c:if>>${usuario.nome}</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Matrícula:</td> 
                    <td><input type="text" name="txtMatricula" value="${aluno.matricula}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Ano de Ingresso:</td> 
                    <td><input type="text" name="txtAnoIngresso" maxlength="4" value="${aluno.anoIngresso}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr> 
                    <td>Curso do Aluno:</td> 
                    <td>
                        <select name="optCurso" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="0" <c:if test="${aluno.codCurso == null}"> selected</c:if>> </option>  
                            <c:forEach items="${cursos}" var="curso">
                                <option value="${curso.codCurso}" <c:if test="${aluno.codCurso == curso.codCurso}"> selected</c:if>>${curso.nome}</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>(Período / Módulo / Série) que está cursando:</td> 
                    <td><input type="text" name="txtPeriodoCurso" value="${aluno.periodoCurso}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td><br />O seu endereço é o mesmo da sua família?</td> 
                    <td><br /><input type="radio" name="endereco" value="Sim" onclick="if(document.getElementById('FamiliaEndereco').disabled==false){document.getElementById('FamiliaEndereco').disabled=true}; if(document.getElementById('FamiliaNumero').disabled==false){document.getElementById('FamiliaNumero').disabled=true}; if(document.getElementById('FamiliaComplemento').disabled==false){document.getElementById('FamiliaComplemento').disabled=true}; if(document.getElementById('FamiliaBairro').disabled==false){document.getElementById('FamiliaBairro').disabled=true}; if(document.getElementById('FamiliaCep').disabled==false){document.getElementById('FamiliaCep').disabled=true}; if(document.getElementById('FamiliaCidade').disabled==false){document.getElementById('FamiliaCidade').disabled=true}; if(document.getElementById('FamiliaUF').disabled==false){document.getElementById('FamiliaUF').disabled=true};">Sim
                        <input type="radio" name="endereco" value="Não" onclick="if(document.getElementById('FamiliaEndereco').disabled==true){document.getElementById('FamiliaEndereco').disabled=false}; if(document.getElementById('FamiliaNumero').disabled==true){document.getElementById('FamiliaNumero').disabled=false}; if(document.getElementById('FamiliaComplemento').disabled==true){document.getElementById('FamiliaComplemento').disabled=false}; if(document.getElementById('FamiliaBairro').disabled==true){document.getElementById('FamiliaBairro').disabled=false}; if(document.getElementById('FamiliaCep').disabled==true){document.getElementById('FamiliaCep').disabled=false}; if(document.getElementById('FamiliaCidade').disabled==true){document.getElementById('FamiliaCidade').disabled=false}; if(document.getElementById('FamiliaUF').disabled==true){document.getElementById('FamiliaUF').disabled=false};">Não</td>
                </tr>
                <tr>
                    <td colspan="2">(Caso não seja o mesmo, informe abaixo o endereço da sua família)
                    <br />Rua:<input type="text" id="FamiliaEndereco" name="txtFamiliaEndereco" value="${aluno.familia_endereco}" disabled="disabled" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                    <br />Número:<input type="text" id="FamiliaNumero" name="txtFamiliaNumero" value="${aluno.familia_numero}" disabled="disabled" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                    <br />Complemento:<input type="text" id="FamiliaComplemento" name="txtFamiliaComplemento" value="${aluno.familia_complemento}" disabled="disabled" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                    <br />Bairro:<input type="text" id="FamiliaBairro" name="txtFamiliaBairro" value="${aluno.familia_bairro}" disabled="disabled" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                    <br />CEP:<input type="text" id="FamiliaCep" name="txtFamiliaCep" value="${aluno.familia_cep}" disabled="disabled" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                    <br />Cidade:<input type="text" id="FamiliaCidade" name="txtFamiliaCidade" value="${aluno.familia_cidade}" disabled="disabled" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                    <br />UF:<input type="text" id="FamiliaUF" name="txtFamiliaUF" value="${aluno.familia_uf}" disabled="disabled" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
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
                if (form.optUsuario.value == "0"){
                    mensagem = mensagem + "Selecione um Usuário\n";
                }
                if (form.txtMatricula.value == ""){
                    mensagem = mensagem + "Informe a Matrícula\n";
                }                             
                if (form.txtAnoIngresso.value == ""){
                    mensagem = mensagem + "Informe o Ano de Ingresso\n";
                }
                if (form.txtPeriodoCurso.value == ""){
                    mensagem = mensagem + "Informe qual o (Período / Módulo / Série) que está cursando \n";
                }
                if (form.optCurso.value == "0"){
                    mensagem = mensagem + "Selecione o Curso\n";
                }
                if (!campoNumerico(form.txtMatricula.value)){
                    mensagem = mensagem + "A Matrícula deve ser numérica\n";
                }
                if (!campoNumerico(form.txtAnoIngresso.value)){
                    mensagem = mensagem + "Ano deve ser Numérico\n";
                }
                if (!campoNumerico(form.txtPeriodoCurso.value)){
                    mensagem = mensagem + "(Período / Módulo / Série) deve ser Numérico\n";
                }
                if (form.endereco.value == ""){
                    mensagem = mensagem + "Informe se o seu endereço é o mesmo da sua família\n";
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