<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manter Formulario</title>
    </head>
    <body>
        <h1>Formulário Sócioeconômico - ${operacao}</h1>
        <form action="ManterFormularioController?acao=confirmar${operacao}" method="post" name="frmManterFormulario" onsubmit="return validarFormulario(this)">
            <table>
                <tr> 
                    <td><hr />Escolha em qual Seleção quer concorrer:
                        <select name="optSelecao" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="0" <c:if test="${formulario.codSelecao == null}"> selected</c:if>> </option>  
                            <c:forEach items="${selecoes}" var="selecao">
                                <option value="${selecao.codSelecao}" <c:if test="${formulario.codSelecao == selecao.codSelecao}"> selected</c:if>>${selecao.numeroEdital} | ${selecao.modalidade.nome}</option>  
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr> 
                    <td><hr />QUESTÃO 01:</td>
                </tr>
                <tr>
                    <td>Você ou alguém da sua família é ou já foi atendido em algum programa de Assistência Estudantil do IF Sudeste MG ou do antigo CTU?
                        <br /><input type="radio" name="opt_qt01_Resposta" value="Sim" <c:if test="${formulario.qt01_Resposta == 'Sim'}"> selected</c:if>>Sim
                        <input type="radio" name="opt_qt01_Resposta" value="Nao" <c:if test="${formulario.qt01_Resposta == 'Nao'}"> selected</c:if>>Não
                        <br />Se Sim, informe:
                        <br />Quem&nbsp;<input type="text" name="txt_qt01_Nome" value="${formulario.qt01_Nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />Parentesco&nbsp;<input type="text" name="txt_qt01_Parentesco" value="${formulario.qt01_Parentesco}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />Programa&nbsp;<input type="text" name="txt_qt01_Programa" value="${formulario.qt01_Programa}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />Ano&nbsp;<input type="text" name="txt_qt01_Ano" value="${formulario.qt01_Ano}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                    </td>
                </tr>
                <tr> 
                    <td><hr />QUESTÃO 02:</td>
                </tr>
                <tr>
                    <td>
                        Programa/atendimento solicitado
                        <br />Alimentação:&nbsp;
                        <input type="radio" name="opt_qt02_Alimentacao" value="Sim" <c:if test="${formulario.qt02_Alimentacao == 'Sim'}"> selected</c:if>>Sim
                        <input type="radio" name="opt_qt02_Alimentacao" value="Nao" <c:if test="${formulario.qt02_Alimentacao == 'Nao'}"> selected</c:if>>Não
                        <br />Manutenção:&nbsp;
                        <input type="radio" name="opt_qt02_Manutenção" value="Sim" <c:if test="${formulario.qt02_Manutenção == 'Sim'}"> selected</c:if>>Sim
                        <input type="radio" name="opt_qt02_Manutenção" value="Nao" <c:if test="${formulario.qt02_Manutenção == 'Nao'}"> selected</c:if>>Não
                        <br />Moradia:&nbsp;
                        <input type="radio" name="opt_qt02_Moradia" value="Sim" <c:if test="${formulario.qt02_Moradia == 'Sim'}"> selected</c:if>>Sim
                        <input type="radio" name="opt_qt02_Moradia" value="Nao" <c:if test="${formulario.qt02_Moradia == 'Nao'}"> selected</c:if>>Não
                        <br />Transporte:&nbsp;
                        <input type="radio" name="opt_qt02_Transporte" value="Sim" <c:if test="${formulario.qt02_Transporte == 'Sim'}"> selected</c:if>>Sim
                        <input type="radio" name="opt_qt02_Transporte" value="Nao" <c:if test="${formulario.qt02_Transporte == 'Nao'}"> selected</c:if>>Não
                        <br />Outro:&nbsp;
                        <input type="text" name="txt_qt02_Outro" value="${formulario.qt02_Outro}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                    </td>
                </tr>
                <tr> 
                    <td><hr />QUESTÃO 03:</td>
                </tr>
                <tr>
                    <td>Qual o principal meio de transporte utilizado para chegar ao IF Sudeste MG?<br />
                        <select name="opt_qt03_Transporte" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="" <c:if test="${formulario.qt03_Transporte == null}"> selected</c:if>> </option>
                            <option value="a pé / de bicicleta" <c:if test="${formulario.qt03_Transporte == 'a pé / de bicicleta'}"> selected</c:if>>a pé / de bicicleta</option>
                            <option value="carona" <c:if test="${formulario.qt03_Transporte == 'carona'}"> selected</c:if>>carona</option>
                            <option value="transporte coletivo com recursos próprios" <c:if test="${formulario.qt03_Transporte == 'transporte coletivo com recursos próprios'}"> selected</c:if>>transporte coletivo com recursos próprios</option>
                            <option value="transporte locado" <c:if test="${formulario.qt03_Transporte == 'transporte locado'}"> selected</c:if>>transporte locado</option>
                            <option value="transporte gratuito de Prefeitura / Escola" <c:if test="${formulario.qt03_Transporte == 'transporte gratuito de Prefeitura / Escola'}"> selected</c:if>>transporte gratuito de Prefeitura / Escola</option>
                            <option value="transporte próprio" <c:if test="${formulario.qt03_Transporte == 'transporte próprio'}"> selected</c:if>>transporte próprio</option>
                            <option value="Outro" <c:if test="${formulario.qt03_Transporte == 'Outro'}"> selected</c:if>>Outro</option>
                        </select>
                        <br />Informe:
                        <br />Se a pé / de bicicleta - Tempo gasto no trajeto&nbsp;<input type="text" name="txt_qt03_Tempo" value="${formulario.qt03_Tempo}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />Se transporte coletivo com recursos próprios - Gasto diário&nbsp;<input type="text" name="txt_qt03_ValorGastoDiario" value="${formulario.qt03_ValorGastodiario}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />Se transporte locado - Gasto mensal&nbsp;<input type="text" name="txt_qt03_ValorGastoMensal" value="${formulario.qt03_ValorGastoMensal}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />Se Outro - Especifique&nbsp;<input type="text" name="txt_qt03_Outro" value="${formulario.qt03_Outro}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                    </td>
                </tr>
                <tr> 
                    <td><hr />QUESTÃO 04:</td>
                </tr>
                <tr>
                    <td>A instituição de ensino na qual cursou o ensino fundamental é:<br />
                        <select name="opt_qt04_InstituicaoEnsinoFundamental" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="" <c:if test="${formulario.qt04_InstituicaoEnsinoFundamental == null}"> selected</c:if>> </option>
                            <option value="pública" <c:if test="${formulario.qt04_InstituicaoEnsinoFundamental == 'pública'}"> selected</c:if>>pública</option>
                            <option value="particular" <c:if test="${formulario.qt04_InstituicaoEnsinoFundamental == 'particular'}"> selected</c:if>>particular</option>
                            <option value="parte em pública e depois em particular" <c:if test="${formulario.qt04_InstituicaoEnsinoFundamental == 'parte em pública e depois em particular'}"> selected</c:if>>parte em pública e depois em particular</option>
                            <option value="parte em particular e depois em pública" <c:if test="${formulario.qt04_InstituicaoEnsinoFundamental == 'parte em particular e depois em pública'}"> selected</c:if>>parte em particular e depois em pública</option>
                            <option value="particular com bolsa" <c:if test="${formulario.qt04_InstituicaoEnsinoFundamental == 'particular com bolsa'}"> selected</c:if>>particular com bolsa</option>
                        </select>
                    </td>
                </tr>
                <tr> 
                    <td><hr />QUESTÃO 05:</td>
                </tr>
                <tr>
                    <td>A instituição de ensino na qual cursou o ensino médio é:<br />
                        <select name="opt_qt05_InstituicaoEnsinoMedio" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="" <c:if test="${formulario.qt05_InstituicaoEnsinoMedio == null}"> selected</c:if>> </option>
                            <option value="pública" <c:if test="${formulario.qt05_InstituicaoEnsinoMedio == 'pública'}"> selected</c:if>>pública</option>
                            <option value="particular" <c:if test="${formulario.qt05_InstituicaoEnsinoMedio == 'particular'}"> selected</c:if>>particular</option>
                            <option value="parte em pública e depois em particular" <c:if test="${formulario.qt05_InstituicaoEnsinoMedio == 'parte em pública e depois em particular'}"> selected</c:if>>parte em pública e depois em particular</option>
                            <option value="parte em particular e depois em pública" <c:if test="${formulario.qt05_InstituicaoEnsinoMedio == 'parte em particular e depois em pública'}"> selected</c:if>>parte em particular e depois em pública</option>
                            <option value="particular com bolsa" <c:if test="${formulario.qt05_InstituicaoEnsinoMedio == 'particular com bolsa'}"> selected</c:if>>particular com bolsa</option>
                        </select>
                    </td>
                </tr>
                <tr> 
                    <td><hr />QUESTÃO 06:</td>
                </tr>
                <tr>
                    <td>Você está inserido em alguma atividade acadêmica remunerada?<br />
                        <select name="opt_qt06_AtividadeRemunerada" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="" <c:if test="${formulario.qt06_AtividadeRemunerada == null}"> selected</c:if>> </option>
                            <option value="Sim, estágio" <c:if test="${formulario.qt06_AtividadeRemunerada == 'Sim, estágio'}"> selected</c:if>>Sim, estágio</option>
                            <option value="Sim, iniciação científica" <c:if test="${formulario.qt06_AtividadeRemunerada == 'Sim, iniciação científica'}"> selected</c:if>>Sim, iniciação científica</option>
                            <option value="Sim, treinamento profissional" <c:if test="${formulario.qt06_AtividadeRemunerada == 'Sim, treinamento profissional'}"> selected</c:if>>Sim, treinamento profissional</option>
                            <option value="Sim, outra" <c:if test="${formulario.qt06_AtividadeRemunerada == 'Sim, outra'}"> selected</c:if>>Sim, outra</option>
                            <option value="Não" <c:if test="${formulario.qt06_AtividadeRemunerada == 'Não'}"> selected</c:if>>Não</option>
                        </select>
                        <br />Informe:
                        <br />Se estágio - Valor mensal&nbsp;<input type="text" name="txt_qt06_ValorBolsaEstagio" value="${formulario.qt06_ValorBolsaEstagio}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />Se iniciação científica - Qual&nbsp;<input type="text" name="txt_qt06_ProjetoIniciacao" value="${formulario.qt06_ProjetoIniciacao}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>&nbsp;e&nbsp;Valor mensal&nbsp;<input type="text" name="txt_qt06_ValorBolsaIniciacao" value="${formulario.qt06_ValorBolsaIniciacao}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />Se treinamento profissional - Qual&nbsp;<input type="text" name="txt_qt06_ProjetoTreinamento" value="${formulario.qt06_ProjetoTreinamento}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>&nbsp;e&nbsp;Valor mensal&nbsp;<input type="text" name="txt_qt06_ValorBolsaTreinamento" value="${formulario.qt06_ValorBolsaTreinamento}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />Se Outra - Qual&nbsp;<input type="text" name="txt_qt06_Outro" value="${formulario.qt06_Outro}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>&nbsp;e&nbsp;Valor mensal&nbsp;<input type="text" name="txt_qt06_ValorBolsaOutro" value="${formulario.qt06_ValorBolsaOutro}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                    </td>
                </tr>
                <tr> 
                    <td><hr />QUESTÃO 07:</td>
                </tr>
                <tr>
                    <td>Você trabalha atualmente em alguma outra atividade remunerada?<br />
                        <input type="radio" name="opt_qt07_TrabalhoRemunerado" value="Sim" <c:if test="${formulario.qt07_TrabalhoRemunerado == 'Sim'}"> selected</c:if>>Sim
                        <input type="radio" name="opt_qt07_TrabalhoRemunerado" value="Nao" <c:if test="${formulario.qt07_TrabalhoRemunerado == 'Nao'}"> selected</c:if>>Não
                        <br />Se Sim, informe:
                        <br />Qual a carga horária mensal?&nbsp;<input type="text" name="txt_qt07_HorasSemanais" value="${formulario.qt07_HorasSemanais}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />Qual o salário mensal?&nbsp;<input type="text" name="txt_qt07_Salario" value="${formulario.qt07_Salario}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                    </td>
                </tr>
                <tr> 
                    <td><hr />QUESTÃO 08:</td>
                </tr>
                <tr>
                    <td>Qual a sua condição de manutenção?<br />
                        <select name="opt_qt08_Manutencao" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="" <c:if test="${formulario.qt08_Manutencao == null}"> selected</c:if>> </option>
                            <option value="Sou responsável pelo meu próprio sustento" <c:if test="${formulario.qt08_Manutencao == 'Sou responsável pelo meu próprio sustento'}"> selected</c:if>>Sou responsável pelo meu próprio sustento</option>
                            <option value="Sou sustentado pelos meus pais" <c:if test="${formulario.qt08_Manutencao == 'Sou sustentado pelos meus pais'}"> selected</c:if>>Sou sustentado pelos meus pais</option>
                            <option value="Recebo ajuda de parentes" <c:if test="${formulario.qt08_Manutencao == 'Recebo ajuda de parentes'}"> selected</c:if>>Recebo ajuda de parentes</option>
                            <option value="Tenho bolsa de estudo" <c:if test="${formulario.qt08_Manutencao == 'Tenho bolsa de estudo'}"> selected</c:if>>Tenho bolsa de estudo</option>
                            <option value="Outra" <c:if test="${formulario.qt08_Manutencao == 'Outra'}"> selected</c:if>>Outra</option>
                        </select>
                        <br />Se Outra, informe qual:&nbsp;<input type="text" name="txt_qt08_Outra" value="${formulario.qt08_Outra}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                    </td>
                </tr>
                <tr> 
                    <td><hr />QUESTÃO 09:</td>
                </tr>
                <tr>
                    <td>Você mora:<br />
                        <select name="opt_qt09_Moradia" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="" <c:if test="${formulario.qt09_Moradia == null}"> selected</c:if>> </option>
                            <option value="Sozinho" <c:if test="${formulario.qt09_Moradia == 'Sozinho'}"> selected</c:if>>Sozinho</option>
                            <option value="Com pais" <c:if test="${formulario.qt09_Moradia == 'Com pais'}"> selected</c:if>>Com pais</option>
                            <option value="Com cônjuge/companheiro(a)" <c:if test="${formulario.qt09_Moradia == 'Com cônjuge/companheiro(a)'}"> selected</c:if>>Com cônjuge/companheiro(a)</option>
                            <option value="Em casa de familiares ou amigos da família" <c:if test="${formulario.qt09_Moradia == 'Em casa de familiares ou amigos da família'}"> selected</c:if>>Em casa de familiares ou amigos da família</option>
                            <option value="Em repúnlica/quarto/pensão/pensionato" <c:if test="${formulario.qt09_Moradia == 'Em repúnlica/quarto/pensão/pensionato'}"> selected</c:if>>Em repúnlica/quarto/pensão/pensionato</option>
                            <option value="Outra situação" <c:if test="${formulario.qt09_Moradia == 'Outra situação'}"> selected</c:if>>Outra situação</option>
                        </select>
                        <br />Se Outra situação, informe qual:&nbsp;<input type="text" name="txt_qt09_Outra" value="${formulario.qt09_Outra}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                    </td>
                </tr>
                <tr> 
                    <td><hr />QUESTÃO 10:</td>
                </tr>
                <tr>
                    <td>Quem é(são) o(s) responsável(is) pela manutenção financeira do grupo familiar?<br />
                        <select name="opt_qt10_ResponsavelFinanceiro" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="" <c:if test="${formulario.qt10_ResponsavelFinanceiro == null}"> selected</c:if>> </option>
                            <option value="Pai/mãe" <c:if test="${formulario.qt10_ResponsavelFinanceiro == 'Pai/mãe'}"> selected</c:if>>Pai/mãe</option>
                            <option value="Um dos pais" <c:if test="${formulario.qt10_ResponsavelFinanceiro == 'Um dos pais'}"> selected</c:if>>Um dos pais</option>
                            <option value="Outros membros do grupo familiar" <c:if test="${formulario.qt10_ResponsavelFinanceiro == 'Outros membros do grupo familiar'}"> selected</c:if>>Outros membros do grupo familiar</option>
                            <option value="Próprio estudante" <c:if test="${formulario.qt10_ResponsavelFinanceiro == 'Próprio estudante'}"> selected</c:if>>Próprio estudante</option>
                            <option value="Outros" <c:if test="${formulario.qt10_ResponsavelFinanceiro == 'Outros'}"> selected</c:if>>Outros</option>
                        </select>
                        <br />Se Outros, informe quem:&nbsp;<input type="text" name="txt_qt10_Outros" value="${formulario.qt10_Outros}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                    </td>
                </tr>
                <tr> 
                    <td><hr />QUESTÃO 11:</td>
                </tr>
                <tr>
                    <td>
                        O bairro e a casa onde mora a família tem:
                        <br />Rede de esgoto:&nbsp;
                        <input type="radio" name="opt_qt11_Esgoto" value="Sim" <c:if test="${formulario.qt11_Esgoto == 'Sim'}"> selected</c:if>>Sim
                        <input type="radio" name="opt_qt11_Esgoto" value="Nao" <c:if test="${formulario.qt11_Esgoto == 'Nao'}"> selected</c:if>>Não
                        <br />Água tratada:&nbsp;
                        <input type="radio" name="opt_qt11_Agua" value="Sim" <c:if test="${formulario.qt11_Agua == 'Sim'}"> selected</c:if>>Sim
                        <input type="radio" name="opt_qt11_Agua" value="Nao" <c:if test="${formulario.qt11_Agua == 'Nao'}"> selected</c:if>>Não
                        <br />Iluminação pública:&nbsp;
                        <input type="radio" name="opt_qt11_Iluminacao" value="Sim" <c:if test="${formulario.qt11_Iluminacao == 'Sim'}"> selected</c:if>>Sim
                        <input type="radio" name="opt_qt11_Iluminacao" value="Nao" <c:if test="${formulario.qt11_Iluminacao == 'Nao'}"> selected</c:if>>Não
                        <br />Coleta de Lixo:&nbsp;
                        <input type="radio" name="opt_qt11_Lixo" value="Sim" <c:if test="${formulario.qt11_Lixo == 'Sim'}"> selected</c:if>>Sim
                        <input type="radio" name="opt_qt11_Lixo" value="Nao" <c:if test="${formulario.qt11_Lixo == 'Nao'}"> selected</c:if>>Não
                        <br />Ruas pavimentadas:&nbsp;
                        <input type="radio" name="opt_qt11_Pavimentacao" value="Sim" <c:if test="${formulario.qt11_Pavimentacao == 'Sim'}"> selected</c:if>>Sim
                        <input type="radio" name="opt_qt11_Pavimentacao" value="Nao" <c:if test="${formulario.qt11_Pavimentacao == 'Nao'}"> selected</c:if>>Não
                    </td>
                </tr>
                <tr> 
                    <td><hr />QUESTÃO 12:</td>
                </tr>
                <tr>
                    <td>Sua família reside em:<br />
                        <select name="opt_qt12_Residencia" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="" <c:if test="${formulario.qt12_Residencia == null}"> selected</c:if>> </option>
                            <option value="Vila ou aglomerado" <c:if test="${formulario.qt12_Residencia == 'Vila ou aglomerado'}"> selected</c:if>>Vila ou aglomerado</option>
                            <option value="Bairro padrão popular" <c:if test="${formulario.qt12_Residencia == 'Bairro padrão popular'}"> selected</c:if>>Bairro padrão popular</option>
                            <option value="Bairro padrão médio" <c:if test="${formulario.qt12_Residencia == 'Bairro padrão médio'}"> selected</c:if>>Bairro padrão médio</option>
                            <option value="Bairro padrão alto e luxo" <c:if test="${formulario.qt12_Residencia == 'Bairro padrão alto e luxo'}"> selected</c:if>>Bairro padrão alto e luxo</option>
                            <option value="Fora do perímetro urbano" <c:if test="${formulario.qt12_Residencia == 'Fora do perímetro urbano'}"> selected</c:if>>Fora do perímetro urbano</option>
                            <option value="Outro" <c:if test="${formulario.qt12_Residencia == 'Outro'}"> selected</c:if>>Outro</option>
                        </select>
                        <br />Se Outro, especifique:&nbsp;<input type="text" name="txt_qt12_Outro" value="${formulario.qt12_Outro}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                    </td>
                </tr>
                <tr> 
                    <td><hr />QUESTÃO 13:</td>
                </tr>
                <tr>
                    <td>Sua família reside em imóvel:<br />
                        <select name="opt_qt13_Imovel" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                            <option value="" <c:if test="${formulario.qt13_Imovel == null}"> selected</c:if>> </option>
                            <option value="Alugado" <c:if test="${formulario.qt13_Imovel == 'Alugado'}"> selected</c:if>>Alugado</option>
                            <option value="Próprio - já quitado" <c:if test="${formulario.qt13_Imovel == 'Próprio - já quitado'}"> selected</c:if>>Próprio - já quitado</option>
                            <option value="Próprio - por herança" <c:if test="${formulario.qt13_Imovel == 'Próprio - por herança'}"> selected</c:if>>Próprio - por herança</option>
                            <option value="Próprio - em pagamento" <c:if test="${formulario.qt13_Imovel == 'Próprio - em pagamento'}"> selected</c:if>>Próprio - em pagamento</option>
                            <option value="Emprestado ou cedido" <c:if test="${formulario.qt13_Imovel == 'Emprestado ou cedido'}"> selected</c:if>>Emprestado ou cedido</option>
                            <option value="Construído em lote de parente" <c:if test="${formulario.qt13_Imovel == 'Construído em lote de parente'}"> selected</c:if>>Construído em lote de parente</option>
                            <option value="Outra situação" <c:if test="${formulario.qt13_Imovel == 'Outra situação'}"> selected</c:if>>Outra situação</option>
                        </select>
                        <br />Informe:
                        <br />Se alugado - Valor do aluguel&nbsp;<input type="text" name="txt_qt13_ValorAluguel" value="${formulario.qt13_ValorAluguel}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />Se próprio em pagamento - Valor da prestação&nbsp;<input type="text" name="txt_qt13_ValorPrestacao" value="${formulario.qt13_ValorPrestacao}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />Se emprestado ou cedido - Por quem?&nbsp;<input type="text" name="txt_qt13_Nome" value="${formulario.qt13_Nome}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />Se Outra situação- Qual?&nbsp;<input type="text" name="txt_qt13_Outro" value="${formulario.qt13_Outro}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                    </td>
                </tr>
                <tr> 
                    <td><hr />QUESTÃO 14:</td>
                </tr>
                <tr>
                    <td>
                        Marque a característica que melhor descreve a sua casa:
                        <br /><input type="radio" name="opt_qt14_Acabamento" value="Sim" <c:if test="${formulario.qt14_Acabamento == 'Sim'}"> selected</c:if>>Residência com acabamento
                        <br /><input type="radio" name="opt_qt14_Acabamento" value="Nao" <c:if test="${formulario.qt14_Acabamento == 'Nao'}"> selected</c:if>>Residência sem acabamento
                    </td>
                </tr>
                <tr> 
                    <td><hr />QUESTÃO 15:</td>
                </tr>
                <tr>
                    <td>A família possui outros imóveis além do que habita? (lotes, sítios, fazendas, casa na praia, aptos, salas, barracões ou outros)<br />
                        <input type="radio" name="opt_qt15_OutrosImoveis" value="Sim" <c:if test="${formulario.qt15_OutrosImoveis == 'Sim'}"> selected</c:if>>Sim
                        <input type="radio" name="opt_qt15_OutrosImoveis" value="Nao" <c:if test="${formulario.qt15_OutrosImoveis == 'Nao'}"> selected</c:if>>Não
                        <br /> Se sim - especifique tipo e local de cada imóvel
                        <br /><textarea rows="2" cols="100" name="qt15_DescricaoImoveis" value="${formulario.qt15_DescricaoImoveis}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></textarea>
                    </td>
                </tr>
                <tr> 
                    <td><hr />QUESTÃO 16</td>
                </tr>
                <tr>
                    <td>
                        Em relação à casa de sua família, especifique a quantidade de:
                        <br />01) Automóvel&nbsp;<input type="text" name="txt_qt16_QuantCarro" value="${formulario.qt16_QuantCarro}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />02) Televisão&nbsp;<input type="text" name="txt_qt16_QuantTV" value="${formulario.qt16_QuantTV}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />03) Máquina de lavar roupa&nbsp;<input type="text" name="txt_qt16_QuantMaqLavar" value="${formulario.qt16_QuantMaqLavar}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />04) Geladeira&nbsp;<input type="text" name="txt_qt16_QuantGeladeira" value="${formulario.qt16_QuantGeladeira}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />05) TV a cabo&nbsp;<input type="text" name="txt_qt16_QuantTVCabo" value="${formulario.qt16_QuantTVCabo}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />06) Computador&nbsp;<input type="text" name="txt_qt16_QuantComputador" value="${formulario.qt16_QuantComputador}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />07) Internet paga&nbsp;<input type="text" name="txt_qt16_QuantInternetPaga" value="${formulario.qt16_QuantInternetPaga}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />08) Empregada mensalista&nbsp;<input type="text" name="txt_qt16_QuantEmpregadaMensalista" value="${formulario.qt16_QuantEmpregadaMensalista}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />09) Empregada diarista&nbsp;<input type="text" name="txt_qt16_QuantEmpregadaDiarista" value="${formulario.qt16_QuantEmpregadaDiarista}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />10) Banheiro&nbsp;<input type="text" name="txt_qt16_QuantBanheiro" value="${formulario.qt16_QuantBanheiro}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />11) Quarto&nbsp;<input type="text" name="txt_qt16_QuantQuarto" value="${formulario.qt16_QuantQuarto}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                    </td>
                </tr>
                <tr> 
                    <td><hr />QUESTÃO 17:</td>
                </tr>
                <tr>
                    <td>Há problemas de saúde existentes entre as pessoas que moram com sua família, inclusive você?<br />
                        <input type="radio" name="opt_qt17_ProblemaSaude" value="Sim" <c:if test="${formulario.qt17_ProblemaSaude == 'Sim'}"> selected</c:if>>Sim
                        <input type="radio" name="opt_qt17_ProblemaSaude" value="Nao" <c:if test="${formulario.qt17_ProblemaSaude == 'Nao'}"> selected</c:if>>Não
                    </td>
                </tr>
                <tr> 
                    <td><hr />QUESTÃO 18:</td>
                </tr>
                <tr>
                    <td>XX</td>
                </tr>
                <tr> 
                    <td><hr />QUESTÃO 19:</td>
                </tr>
                <tr>
                    <td>
                        Despesa familiar mensal:
                        <br />(excluir despesas do estudante do IF Sudeste MG que reside fora)
                        <br />01) Água&nbsp;<input type="text" name="txt_qt19_ValorAgua" value="${formulario.qt19_ValorAgua}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />02) Luz&nbsp;<input type="text" name="txt_qt19_ValorLuz" value="${formulario.qt19_ValorLuz}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />03) Telefone&nbsp;<input type="text" name="txt_qt19_ValorTelefone" value="${formulario.qt19_ValorTelefone}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />04) Condomínio&nbsp;<input type="text" name="txt_qt19_ValorCondominio" value="${formulario.qt19_ValorCondominio}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />05) Mensalidade escolar&nbsp;<input type="text" name="txt_qt19_ValorMensalidadeEscolar" value="${formulario.qt19_ValorMensalidadeEscolar}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />06) Alimentação&nbsp;<input type="text" name="txt_qt19_ValorAlimentacao" value="${formulario.qt19_ValorAlimentacao}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />07) Saúde&nbsp;<input type="text" name="txt_qt19_ValorSaude" value="${formulario.qt19_ValorSaude}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />08) Transporte&nbsp;<input type="text" name="txt_qt19_ValorTransporte" value="${formulario.qt19_ValorTransporte}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />09) IPTU anual&nbsp;<input type="text" name="txt_qt19_ValorIptuAnual" value="${formulario.qt19_ValorIptuAnual}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />10) Aluguel / prestação casa&nbsp;<input type="text" name="txt_qt19_ValorAluguel" value="${formulario.qt19_ValorAluguel}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />11) Pensão alimentícia&nbsp;<input type="text" name="txt_qt19_ValorPensao" value="${formulario.qt19_ValorPensao}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />11) Outros&nbsp;<input type="text" name="txt_qt19_ValorOutros" value="${formulario.qt19_ValorOutros}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                    </td>
                </tr>
                <tr> 
                    <td><hr />QUESTÃO 20:</td>
                </tr>
                <tr>
                    <td>
                        Despesa do estudante do IF Sudeste MG com moradia:
                        <br />(registrar apenas a parcela que cabe ao estudante, no caso de república ou similar)
                        <br />01) Água&nbsp;<input type="text" name="txt_qt20_ValorAgua" value="${formulario.qt20_ValorAgua}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />02) Luz&nbsp;<input type="text" name="txt_qt20_ValorLuz" value="${formulario.qt20_ValorLuz}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />03) Telefone&nbsp;<input type="text" name="txt_qt20_ValorTelefone" value="${formulario.qt20_ValorTelefone}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />04) Condomínio&nbsp;<input type="text" name="txt_qt20_ValorCondominio" value="${formulario.qt20_ValorCondominio}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />05) Aluguel&nbsp;<input type="text" name="txt_qt20_ValorAluguel" value="${formulario.qt20_ValorAluguel}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                        <br />06) IPTU anual&nbsp;<input type="text" name="txt_qt20_ValorIptuAnual" value="${formulario.qt20_ValorIptuAnual}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>>
                    </td>
                </tr>
                <tr> 
                    <td><hr />QUESTÃO 21:</td>
                </tr>
                <tr>
                    <td>
                        Informe ou esclareça sobre dados não contemplados neste formulário ou situações especiais que julgar conveniente:
                        <br /><textarea rows="5" cols="100" name="txt_qt21_Esclarecimentos" value="${formulario.qt21_Esclarecimentos}" <c:if test="${operacao == 'Excluir'}"> readonly</c:if>></textarea>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
