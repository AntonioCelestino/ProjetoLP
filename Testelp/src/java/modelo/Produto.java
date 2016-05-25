package modelo;

import dao.ProdutoDAO;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "produto")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Produto.findAll", query = "SELECT p FROM Produto p"),
    @NamedQuery(name = "Produto.findById", query = "SELECT p FROM Produto p WHERE p.id = :id"),
    @NamedQuery(name = "Produto.findByNome", query = "SELECT p FROM Produto p WHERE p.nome = :nome"),
    @NamedQuery(name = "Produto.findByPreco", query = "SELECT p FROM Produto p WHERE p.preco = :preco"),
    @NamedQuery(name = "Produto.findByQuantidade", query = "SELECT p FROM Produto p WHERE p.quantidade = :quantidade")})
public class Produto implements Serializable {
    
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID", nullable = false)
    private Integer id;
    @Size(max = 45)
    @Column(name = "NOME", length = 45)
    private String nome;
    @Size(max = 45)
    @Column(name = "PRECO", length = 45)
    private double preco;
    @Column(name = "QUANTIDADE")
    private Integer quantidade;
    @JoinColumn(name = "FORNECEDOR_ID", referencedColumnName = "ID", nullable = false)
    @ManyToOne(optional = false)
    private Fornecedor fornecedorId;

    public Produto() {
    }
    
    public static List<Produto> obterProdutos() throws ClassNotFoundException{
        return ProdutoDAO.obterProdutos();
    }
    
    public static Produto obterProduto(int codProduto) throws ClassNotFoundException{
        return ProdutoDAO.obterProduto(codProduto);
    }

    public Produto(Integer id) {
        this.id = id;
    }

    public Produto(Integer id, String nome, double preco, Integer quantidade, Fornecedor fornecedorId) {
        this.id = id;
        this.nome = nome;
        this.preco = preco;
        this.quantidade = quantidade;
        this.fornecedorId = fornecedorId;
    }
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }

    public Fornecedor getFornecedorId() {
        return fornecedorId;
    }

    public void setFornecedorId(Fornecedor fornecedorId) {
        this.fornecedorId = fornecedorId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Produto)) {
            return false;
        }
        Produto other = (Produto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Produto[ id=" + id + " ]";
    }
    
    public void salvar() throws SQLException, ClassNotFoundException {
        ProdutoDAO.getInstance().salvar(this);
    }

    public void alterar() throws SQLException, ClassNotFoundException{
        ProdutoDAO.getInstance().alterar(this);
    }

    public void excluir() throws SQLException, ClassNotFoundException{
        ProdutoDAO.getInstance().excluir(this);
    }
}
