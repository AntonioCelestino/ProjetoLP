<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Bolsa</title>
        <script>
            function formatar(mascara, documento){
              var i = documento.value.length;
              var saida = mascara.substring(0,1);
              var texto = mascara.substring(i)

              if (texto.substring(0,1) != saida){
                        documento.value += texto.substring(0,1);
              }

            }
        </script>
    </head>
    <body>
        <h1>Manter Bolsa - ${operacao}</h1>
        <form action="ManterBolsaController?acao=confirmar${operacao}" method="post" name="frmManterBolsa" onsubmit="return validarFormulario(this)">
            <table>
                <tr>
                    <td>Código:</td> 
                    <td><input type="text" name="txtCodBolsa" value="${bolsa.codBolsa}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Data de Início:</td> 
                        <td><input type="text" name="txtDataInicio" maxlength="10" placeholder="dd/mm/aaaa" OnKeyPress="formatar('##/##/####', this)" value="${bolsa.dataInicio}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr>
                        <td>Data de Fim:</td> 
                        <td><input type="text" name="txtDataFim" maxlength="10" placeholder="dd/mm/aaaa" OnKeyPress="formatar('##/##/####', this)" value="${bolsa.dataFim}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                    </tr>
                    <tr> 
                        <td>Nome do Aluno:</td> 
                        <td>
                            <select name="optAluno" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="0" <c:if test="${bolsa.codAluno == null}"> selected</c:if>> </option>  
                            <c:forEach items="${alunos}" var="aluno">
                                <option value="${aluno.matricula}" <c:if test="${bolsa.codAluno == aluno.matricula}"> selected</c:if>>${aluno.estudante.nome}</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr> 
                    <td>Edital | Nome da Modalidade:</td> 
                    <td>
                        <select name="optSelecao" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="0" <c:if test="${bolsa.codSelecao == null}"> selected</c:if>> </option>  
                            <c:forEach items="${selecoes}" var="selecao">
                                <option value="${selecao.codSelecao}" <c:if test="${bolsa.codSelecao == selecao.codSelecao}"> selected</c:if>>${selecao.numeroEdital} | ${selecao.modalidade.nome}</option>  
                            </c:forEach>
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
                if (form.txtCodBolsa.value == ""){
                    mensagem = mensagem + "Informe o Código da Bolsa\n";
                }                             
                if (form.txtDataInicio.value == ""){
                    mensagem = mensagem + "Informe a Data de Início\n";
                }
                if (form.txtDataFim.value == ""){
                    mensagem = mensagem + "Informe a Data de Fim\n";
                }
                if (form.optBolsista.value == "0"){
                    mensagem = mensagem + "Selecione um Bolsista\n";
                }
                if (form.optSelecao.value == "0"){
                    mensagem = mensagem + "Selecione um Edital | Modalidade\n";
                }
                if (!campoNumerico(form.txtCodBolsa.value)){
                    mensagem = mensagem + "Código da Bolsa deve ser numérico\n";
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