package modelo;

import dao.AlunoDAO;
import dao.CursoDAO;
import dao.UsuarioDAO;
import java.sql.SQLException;
import java.util.List;

public class Aluno {
    private int matricula;
    private int anoIngresso;
    private String periodoCurso;
    private Curso curso;
    private Usuario usuario;
    
    private int codCurso;
    private int codUsuario;

    public Aluno(int matricula, int anoIngresso, String periodoCurso, Curso curso, Usuario usuario) {
        this.matricula = matricula;
        this.anoIngresso = anoIngresso;
        this.periodoCurso = periodoCurso;
        this.curso = curso;
        this.usuario = usuario;
    }
    
    public static List<Aluno> obterAlunos() throws ClassNotFoundException{
        return AlunoDAO.obterAlunos();
    }
    
    public static Aluno obterAluno(int codAluno) throws ClassNotFoundException{
        return AlunoDAO.obterAluno(codAluno);
    }

    public int getMatricula() {
        return matricula;
    }

    public void setMatricula(int matricula) {
        this.matricula = matricula;
    }
    
    public int getAnoIngresso() {
        return anoIngresso;
    }

    public void setAnoIngresso(int anoIngresso) {
        this.anoIngresso = anoIngresso;
    }
    
    public String getPeriodoCurso() {
        return periodoCurso;
    }

    public void setPeriodoCurso(String periodoCurso) {
        this.periodoCurso = periodoCurso;
    }
    
    public int getCodCurso() {
        return codCurso;
    }

    public void setCodCurso(int codCurso) {
        this.codCurso = codCurso;
    }

    public int getCodUsuario() {
        return codUsuario;
    }

    public void setCodUsuario(int codUsuario) {
        this.codUsuario = codUsuario;
    }

    public Curso getCurso() throws ClassNotFoundException{
        if ((codCurso != 0) && (curso == null)){
            curso = CursoDAO.obterCurso(codCurso);
        }
        return curso;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }

    public Usuario getUsuario() throws ClassNotFoundException {
        if ((codUsuario != 0) && (usuario == null)) {
            usuario = UsuarioDAO.obterUsuario(codUsuario);
        }
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    public void gravar() throws SQLException, ClassNotFoundException {
        AlunoDAO.gravar(this);
    }

    public void alterar() throws SQLException, ClassNotFoundException{
        AlunoDAO.alterar(this);
    }

    public void excluir() throws SQLException, ClassNotFoundException{
        AlunoDAO.excluir(this);
    }
    
}
