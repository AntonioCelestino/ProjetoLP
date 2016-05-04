package modelo;

import java.sql.SQLException;
import java.util.List;

public class Fornecedor {
    private int codFornecedor;
    private String nome;
    private String CNPJ;
    private String telefone;
    private String cidade;

    public Fornecedor(int codFornecedor, String nome, String CNPJ, String telefone, String cidade) {
        this.codFornecedor = codFornecedor;
        this.nome = nome;
        this.CNPJ = CNPJ;
        this.telefone = telefone;
        this.cidade = cidade;
    }
    
    public static List<Fornecedor> obterFornecedores() throws ClassNotFoundException{
        return FornecedorDAO.obterFornecedores();
    }
    
    public static Fornecedor obterFornecedor(int codFornecedor) throws ClassNotFoundException{
        return FornecedorDAO.obterFornecedor(codFornecedor);
    }

    public int getCodFornecedor() {
        return codFornecedor;
    }

    public void setCodFornecedor(int codFornecedor) {
        this.codFornecedor = codFornecedor;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCNPJ() {
        return CNPJ;
    }

    public void setCNPJ(String CNPJ) {
        this.CNPJ = CNPJ;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }
    
    public void gravar() throws SQLException, ClassNotFoundException {
        
    }

    public void alterar() throws SQLException, ClassNotFoundException{
        
    }

    public void excluir() throws SQLException, ClassNotFoundException{
        
    }
}
