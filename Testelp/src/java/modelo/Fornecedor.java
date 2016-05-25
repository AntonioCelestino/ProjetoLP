package modelo;

import dao.FornecedorDAO;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;


@Entity
@Table(name = "fornecedor")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Fornecedor.findAll", query = "SELECT f FROM Fornecedor f"),
    @NamedQuery(name = "Fornecedor.findById", query = "SELECT f FROM Fornecedor f WHERE f.id = :id"),
    @NamedQuery(name = "Fornecedor.findByNome", query = "SELECT f FROM Fornecedor f WHERE f.nome = :nome"),
    @NamedQuery(name = "Fornecedor.findByCnpj", query = "SELECT f FROM Fornecedor f WHERE f.cnpj = :cnpj"),
    @NamedQuery(name = "Fornecedor.findByTelefone", query = "SELECT f FROM Fornecedor f WHERE f.telefone = :telefone"),
    @NamedQuery(name = "Fornecedor.findByCidade", query = "SELECT f FROM Fornecedor f WHERE f.cidade = :cidade")})
public class Fornecedor implements Serializable {
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
    @Column(name = "CNPJ", length = 45)
    private String cnpj;
    @Size(max = 45)
    @Column(name = "TELEFONE", length = 45)
    private String telefone;
    @Size(max = 45)
    @Column(name = "CIDADE", length = 45)
    private String cidade;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fornecedorId")
    private Collection<Produto> produtoCollection;

    public Fornecedor() {
    }
    
    public static List<Fornecedor> obterFornecedores() throws ClassNotFoundException{
        return FornecedorDAO.obterFornecedores();
    }
    
    public static Fornecedor obterFornecedor(int codFornecedor) throws ClassNotFoundException{
        return FornecedorDAO.obterFornecedor(codFornecedor);
    }
    
    public Fornecedor(Integer id) {
        this.id = id;
    }

    public Fornecedor(Integer id, String nome, String cnpj, String telefone, String cidade) {
        this.id = id;
        this.nome = nome;
        this.cnpj = cnpj;
        this.telefone = telefone;
        this.cidade = cidade;
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

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
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

    @XmlTransient
    public Collection<Produto> getProdutoCollection() {
        return produtoCollection;
    }

    public void setProdutoCollection(Collection<Produto> produtoCollection) {
        this.produtoCollection = produtoCollection;
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
        if (!(object instanceof Fornecedor)) {
            return false;
        }
        Fornecedor other = (Fornecedor) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Fornecedor[ id=" + id + " ]";
    }
    
    public void salvar() throws SQLException, ClassNotFoundException {
        FornecedorDAO.getInstance().salvar(this);
    }

    public void alterar() throws SQLException, ClassNotFoundException{
        FornecedorDAO.getInstance().alterar(this);
    }

    public void excluir() throws SQLException, ClassNotFoundException{
        FornecedorDAO.getInstance().excluir(this);
    }
}
