<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Usuário</title>
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
        <h1>Manter Usuário - ${operacao}</h1>
        <form action="ManterUsuarioController?acao=confirmar${operacao}" method="post" name="frmManterUsuario" onsubmit="return validarFormulario(this)">
            <table>
                <tr>
                    <td>Código:</td> 
                    <td><input type="text" name="txtCodUsuario" value="${usuario.codUsuario}" <c:if test="${operacao != 'Incluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Nome:</td> 
                    <td><input type="text" name="txtNome" value="${usuario.nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>CPF:</td> 
                    <td><input type="text" name="txtCPF" maxlength="14" OnKeyPress="formatar('###.###.###-##', this)" value="${usuario.cpf}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Telefone Fixo:</td> 
                    <td><input type="text" name="txtTelefoneFixo" maxlength="12" OnKeyPress="formatar('##-####-####', this)" value="${usuario.telefoneFixo}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Telefone Celular:</td> 
                    <td><input type="text" name="txtTelefoneCelular" maxlength="13" OnKeyPress="formatar('##-#####-####', this)" value="${usuario.telefoneCelular}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Email:</td> 
                    <td><input type="text" name="txtEmail" value="${usuario.email}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Endereço:</td> 
                    <td><input type="text" name="txtEndereco" value="${usuario.endereco}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Cidade:</td> 
                    <td><input type="text" name="txtCidade" value="${usuario.cidade}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>UF:</td> 
                    <td><input type="text" name="txtUF" value="${usuario.uf}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Login:</td> 
                    <td><input type="text" name="txtLogin" value="${usuario.login}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
                </tr>
                <tr>
                    <td>Senha:</td> 
                    <td><input type="password" name="txtSenha" value="${usuario.senha}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></td>
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
                if (form.txtCodUsuario.value == ""){
                    mensagem = mensagem + "Informe o Código do Usuário\n";
                }                             
                if (form.txtNome.value == ""){
                    mensagem = mensagem + "Informe o Nome do Usuário\n";
                }
                if (form.txtCPF.value == ""){
                    mensagem = mensagem + "Informe o CPF do Usuário\n";
                }
                if (form.txtTelefoneFixo.value == ""){
                    mensagem = mensagem + "Informe o Telefone Fixo do Usuário\n";
                }
                if (form.txtTelefoneCelular.value == ""){
                    mensagem = mensagem + "Informe o Telefone Celular do Usuário\n";
                }
                if (form.txtEmail.value == ""){
                    mensagem = mensagem + "Informe o E-mail do Usuário\n";
                }
                if (form.txtEndereco.value == ""){
                    mensagem = mensagem + "Informe o Endereço do Usuário\n";
                }
                if (form.txtCidade.value == ""){
                    mensagem = mensagem + "Informe a Cidade do Usuário\n";
                }
                if (form.txtUF.value == ""){
                    mensagem = mensagem + "Informe o UF do Usuário\n";
                }
                if (form.txtLogin.value == ""){
                    mensagem = mensagem + "Informe um Login para o Usuário\n";
                }
                if (form.txtSenha.value == ""){
                    mensagem = mensagem + "Informe uma Senha para o Usuário\n";
                }
                if (!campoNumerico(form.txtCodUsuario.value)){
                    mensagem = mensagem + "Código do Usuário deve ser somente numérico\n";
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
