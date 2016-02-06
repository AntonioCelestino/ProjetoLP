package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.Usuario;

public class UsuarioDAO {

    public static List<Usuario> obterUsuarios() throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        List<Usuario> usuarios = new ArrayList<Usuario>();
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from USUARIO");
            while (rs.next()) {
                Usuario usuario = new Usuario(
                        rs.getInt("USUARIO_ID"),
                        rs.getString("NOME"),
                        rs.getString("CPF"),
                        rs.getString("TELEFONE_FIXO"),
                        rs.getString("TELEFONE_CELULAR"),
                        rs.getString("EMAIL"),
                        rs.getString("ENDERECO"),
                        rs.getString("CIDADE"),
                        rs.getString("UF"),
                        rs.getString("LOGIN"),
                        rs.getString("SENHA"));
                usuarios.add(usuario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return usuarios;
    }

    public static Usuario obterUsuario(int codUsuario) throws ClassNotFoundException {
        Connection conexao = null;
        Statement comando = null;
        Usuario usuario = null;
        try {
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            ResultSet rs = comando.executeQuery("select * from USUARIO where USUARIO_ID = " + codUsuario);
            rs.first();
            usuario = new Usuario(
                    rs.getInt("USUARIO_ID"),
                    rs.getString("NOME"),
                    rs.getString("CPF"),
                    rs.getString("TELEFONE_FIXO"),
                    rs.getString("TELEFONE_CELULAR"),
                    rs.getString("EMAIL"),
                    rs.getString("ENDERECO"),
                    rs.getString("CIDADE"),
                    rs.getString("UF"),
                    rs.getString("LOGIN"),
                    rs.getString("SENHA"));
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            fecharConexao(conexao, comando);
        }
        return usuario;
    }

    public static void gravar(Usuario usuario) throws SQLException, ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = BD.getConexao();
            String sql = "insert into usuario (USUARIO_ID, NOME, CPF, TELEFONE_FIXO, TELEFONE_CELULAR, EMAIL, ENDERECO, CIDADE, UF, LOGIN, SENHA) values (?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1, usuario.getCodUsuario());
            comando.setString(2, usuario.getNome());
            comando.setString(3, usuario.getCpf());
            comando.setString(4, usuario.getTelefoneFixo());
            comando.setString(5, usuario.getTelefoneCelular());
            comando.setString(6, usuario.getEmail());
            comando.setString(7, usuario.getEndereco());
            comando.setString(8, usuario.getCidade());
            comando.setString(9, usuario.getUf());
            comando.setString(10, usuario.getLogin());
            comando.setString(11, usuario.getSenha());
            comando.execute();
            comando.close();
            conexao.close();
        }catch (SQLException e){
            throw e;
        }
    }

    public static void alterar(Usuario usuario) throws SQLException, ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = BD.getConexao();
            String sql = "update usuario set NOME = ?, CPF = ?, TELEFONE_FIXO = ?, TELEFONE_CELULAR = ?, EMAIL = ?, ENDERECO = ?, CIDADE = ?, UF = ?, LOGIN = ?, SENHA = ? where USUARIO_ID = ?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setInt(1, usuario.getCodUsuario());
            comando.setString(2, usuario.getNome());
            comando.setString(3, usuario.getCpf());
            comando.setString(4, usuario.getTelefoneFixo());
            comando.setString(5, usuario.getTelefoneCelular());
            comando.setString(6, usuario.getEmail());
            comando.setString(7, usuario.getEndereco());
            comando.setString(8, usuario.getCidade());
            comando.setString(9, usuario.getUf());
            comando.setString(10, usuario.getLogin());
            comando.setString(11, usuario.getSenha());
            comando.execute();
            comando.close();
            conexao.close();
        }catch (SQLException e){
            throw e;
        }
    }

    public static void excluir(Usuario usuario) throws SQLException, ClassNotFoundException{
        Connection conexao = null;
        Statement comando = null;
        String stringSQL;
        try{
            conexao = BD.getConexao();
            comando = conexao.createStatement();
            stringSQL = "delete from USUARIO where USUARIO_ID = " + usuario.getCodUsuario();
            comando.execute(stringSQL);
        }catch (SQLException e) {
            throw e;
        }finally {
            fecharConexao(conexao, comando);
        }
    }
    
    private static void fecharConexao(Connection conexao, Statement comando) {
        try {
            if (comando != null) {
                comando.close();
            }
            if (conexao != null) {
                conexao.close();
            }
        } catch (SQLException e) {
        }
    }
}
