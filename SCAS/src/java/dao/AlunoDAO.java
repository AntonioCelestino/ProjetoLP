package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import modelo.Aluno;

public class AlunoDAO {
    public static List<Aluno> obterAlunos() throws ClassNotFoundException{
        Connection conexao = null;
        Statement comando = null;
        List<Aluno> Alunos = new ArrayList<Aluno>();
        try{
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from ALUNO, USUARIO where ALUNO.USUARIO_ID = USUARIO.USUARIO_ID");
            while(rs.next()){
                Aluno aluno = new Aluno(
                        rs.getInt("MATRICULA"),
                        rs.getInt("ANO_INGRESSO"),
                        rs.getString("BOLSISTA"),null, null);
                aluno.setCodUsuario(rs.getInt("USUARIO_ID"));
                aluno.setCodCurso(rs.getInt("CURSO_ID"));
                Alunos.add(aluno);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            fecharConexao(conexao, comando);
        }
        return Alunos;
    }
    
    public static Aluno obterAluno(int codAluno) throws ClassNotFoundException{
        Connection conexao = null;
        Statement comando = null;
        Aluno aluno = null;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from ALUNO where MATRICULA = " + codAluno);
            rs.first();
            aluno = new Aluno(
                    rs.getInt("MATRICULA"),
                    rs.getInt("ANO_INGRESSO"),
                    rs.getString("BOLSISTA"),null, null);
                    aluno.setCodUsuario(rs.getInt("USUARIO_ID"));
                    aluno.setCodCurso(rs.getInt("CURSO_ID"));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return aluno;
    }
    
    public static void gravar(Aluno aluno) throws SQLException, ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = BD.getConexao();
            String sql = "insert into aluno (MATRICULA, ANO_INGRESSO, BOLSISTA, USUARIO_ID, CURSO_ID) values (?,?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1, aluno.getMatricula());
            comando.setInt(2, aluno.getAnoIngresso());
            comando.setString(3, aluno.getBolsista());
            
            if (aluno.getUsuario() == null){
                comando.setNull(4, Types.NULL);
            }else{
                comando.setInt(4, aluno.getCodUsuario());
            }
            
            if (aluno.getCurso()== null){
                comando.setNull(5, Types.NULL);
            }else{
                comando.setInt(5, aluno.getCodCurso());
            } 
            
            comando.execute();
            comando.close();
            conexao.close();
        }catch (SQLException e){
            throw e;
        }
    }
    
    public static void alterar(Aluno aluno) throws SQLException, ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = BD.getConexao();
            String sql = "update aluno set ANO_INGRESSO = ?, BOLSISTA = ?, USUARIO_ID = ?, CURSO_ID = ? where MATRICULA = ?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1, aluno.getAnoIngresso());
            comando.setString(2, aluno.getBolsista());
            
            if (aluno.getUsuario() == null){
                comando.setNull(3, Types.NULL);
            }else{
                comando.setInt(3, aluno.getCodUsuario());
            }
            
            if (aluno.getCurso()== null){
                comando.setNull(4, Types.NULL);
            }else{
                comando.setInt(4, aluno.getCodCurso());
            } 
            comando.setInt(5, aluno.getMatricula());
            comando.execute();
            comando.close();
            conexao.close();
        }catch (SQLException e){
            throw e;
        }
    }

    public static void excluir(Aluno aluno) throws SQLException, ClassNotFoundException{
        Connection conexao = null;
        Statement comando = null;
        String stringSQL;
        try{
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            stringSQL = "delete from ALUNO where MATRICULA = " + aluno.getMatricula();
            comando.execute(stringSQL);
        }catch (SQLException e) {
            throw e;
        }finally {
            fecharConexao(conexao, comando);
        }
    }

    private static void fecharConexao(Connection conexao, Statement comando) {
        try{
            if(comando != null){
                comando.close();
            }
            if(conexao != null){
                conexao.close();
            }
        }catch(SQLException e){
        }
    }
}
