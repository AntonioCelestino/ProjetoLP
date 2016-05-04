package modelo;

import java.sql.SQLException;
import java.util.List;

public class Produto {
    private int codProduto;
    private String nome;
    private double preco;
    private int quantidade;
    private Fornecedor fornecedor;
    
    private int codFornecedor;

    public Produto(int codProduto, String nome, double preco, int quantidade, Fornecedor fornecedor) {
        this.codProduto = codProduto;
        this.nome = nome;
        this.preco = preco;
        this.quantidade = quantidade;
        this.fornecedor = fornecedor;
    }
    
    public static List<Produto> obterProdutos() throws ClassNotFoundException{
        return ProdutoDAO.obterProdutos();
    }
    
    public static Produto obterProduto(int codProduto) throws ClassNotFoundException{
        return ProdutoDAO.obterProduto(codProduto);
    }

    public int getCodProduto() {
        return codProduto;
    }

    public void setCodProduto(int codProduto) {
        this.codProduto = codProduto;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public Fornecedor getFornecedor() {
        return fornecedor;
    }

    public void setFornecedor(Fornecedor fornecedor) {
        this.fornecedor = fornecedor;
    }

    public int getCodFornecedor() {
        return codFornecedor;
    }

    public void setCodFornecedor(int codFornecedor) {
        this.codFornecedor = codFornecedor;
    }
    
    public void gravar() throws SQLException, ClassNotFoundException {
        
    }

    public void alterar() throws SQLException, ClassNotFoundException{
        
    }

    public void excluir() throws SQLException, ClassNotFoundException{
        
    }
}
