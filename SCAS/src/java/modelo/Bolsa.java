package modelo;

import dao.BolsaDAO;
import dao.AlunoDAO;
import dao.SelecaoDAO;
import java.sql.SQLException;
import java.util.List;

public class Bolsa {
    
    private int codBolsa;
    private String dataInicio;
    private String dataFim;
    
    private Aluno aluno;
    private Selecao selecao;
    
    private int codAluno;
    private int codSelecao;
    
    
    public Bolsa(int codBolsa, String dataInicio, String dataFim, Aluno aluno, Selecao selecao) {
        this.codBolsa = codBolsa;
        this.dataInicio = dataInicio;
        this.dataFim = dataFim;
        this.aluno = aluno;
        this.selecao = selecao;
    }
    
    public static List<Bolsa> obterBolsas() throws ClassNotFoundException{
        return BolsaDAO.obterBolsas();
    }

    public static Bolsa obterBolsa(int codBolsa) throws ClassNotFoundException {
        return BolsaDAO.obterBolsa(codBolsa);
    }

    public int getCodBolsa() {
        return codBolsa;
    }

    public void setCodBolsa(int codBolsa) {
        this.codBolsa = codBolsa;
    }

    public String getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(String dataInicio) {
        this.dataInicio = dataInicio;
    }

    public String getDataFim() {
        return dataFim;
    }

    public void setDataFim(String dataFim) {
        this.dataFim = dataFim;
    }

    public int getCodAluno() {
        return codAluno;
    }

    public void setCodAluno(int codAluno) {
        this.codAluno = codAluno;
    }

    public int getCodSelecao() {
        return codSelecao;
    }

    public void setCodSelecao(int codSelecao) {
        this.codSelecao = codSelecao;
    }

    public Aluno getAluno() throws ClassNotFoundException {
        if ((codAluno != 0) && (aluno == null)){
            aluno = AlunoDAO.obterAluno(codAluno);
        }
        return aluno;
    }

    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }

    public Selecao getSelecao() throws ClassNotFoundException {
        if ((codSelecao != 0) && (selecao == null)){
            selecao = SelecaoDAO.obterSelecao(codSelecao);
        }
        return selecao;
    }

    public void setSelecao(Selecao selecao) {
        this.selecao = selecao;
    }
    
    public void gravar() throws SQLException, ClassNotFoundException {
        BolsaDAO.gravar(this);
    }

    public void alterar() throws SQLException, ClassNotFoundException {
        BolsaDAO.alterar(this);
    }

    public void excluir() throws SQLException, ClassNotFoundException{
        BolsaDAO.excluir(this);
    }
    
}
