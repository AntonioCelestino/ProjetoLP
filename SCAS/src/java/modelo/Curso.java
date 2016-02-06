package modelo;

import dao.CursoDAO;
import java.sql.SQLException;
import java.util.List;

public class Curso {
    private int codCurso;
    private String nome;
    private String nivel;
    private String periodo;
    
    public static List<Curso> obterCursos() throws ClassNotFoundException{
        return CursoDAO.obterCursos();
    }
    
    public static Curso obterCurso(int codCurso) throws ClassNotFoundException{
        return CursoDAO.obterCurso(codCurso);
    }

    public Curso(int codCurso, String nome, String nivel, String periodo) {
        this.codCurso = codCurso;
        this.nome = nome;
        this.nivel = nivel;
        this.periodo = periodo;
    }

    public int getCodCurso() {
        return codCurso;
    }

    public void setCodCurso(int codCurso) {
        this.codCurso = codCurso;
    }
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNivel() {
        return nivel;
    }

    public void setNivel(String nivel) {
        this.nivel = nivel;
    }

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }
    
    public void gravar() throws SQLException, ClassNotFoundException {
        CursoDAO.gravar(this);
    }

    public void alterar() throws SQLException, ClassNotFoundException{
        CursoDAO.alterar(this);
    }

    public void excluir() throws SQLException, ClassNotFoundException{
        CursoDAO.excluir(this);
    }
    
}
