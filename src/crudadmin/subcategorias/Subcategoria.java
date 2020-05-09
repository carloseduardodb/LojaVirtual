package crudadmin.subcategorias;

public class Subcategoria {

    int id;
    String nome;
    String ativo;
    String id_categoria;
    String nome_categoria;

    public Subcategoria() {
    }

    public Subcategoria(int id, String nome) {
        this.id = id;
        this.nome = nome;
    }

    public int getId() {
        return id;
    }

    public Subcategoria(int id, String nome, String ativo, String id_categoria, String nome_categoria) {
        this.id = id;
        this.nome = nome;
        this.ativo = ativo;
        this.id_categoria = id_categoria;
        this.nome_categoria = nome_categoria;
    }

    public Subcategoria(String nome, String ativo, String id_categoria, String nome_categoria) {
        this.nome = nome;
        this.ativo = ativo;
        this.id_categoria = id_categoria;
        this.nome_categoria = nome_categoria;
    }

    public Subcategoria(String nome, String ativo, String id_categoria) {
        this.nome = nome;
        this.ativo = ativo;
        this.id_categoria = id_categoria;
    }

    public Subcategoria(int id, String nome, String ativo, String id_categoria) {
        this.id = id;
        this.nome = nome;
        this.ativo = ativo;
        this.id_categoria = id_categoria;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getAtivo() {
        return ativo;
    }

    public void setAtivo(String ativo) {
        this.ativo = ativo;
    }

    public String getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(String id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getNome_categoria() {
        return nome_categoria;
    }

    public void setNome_categoria(String nome_categoria) {
        this.nome_categoria = nome_categoria;
    }
}
