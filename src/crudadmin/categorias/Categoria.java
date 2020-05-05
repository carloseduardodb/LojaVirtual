package crudadmin.categorias;

public class Categoria {
    private int id;
    private String nome;
    private String slug;
    private String ativo;
    private String icone;

    public Categoria(){

    }

    public Categoria(int id, String nome, String slug, String ativo, String icone) {
        this.id = id;
        this.nome = nome;
        this.slug = slug;
        this.ativo = ativo;
        this.icone = icone;
    }

    public Categoria(String nome, String slug, String ativo, String icone) {
        this.nome = nome;
        this.slug = slug;
        this.ativo = ativo;
        this.icone = icone;
    }

    public Categoria(String nome, String slug, String ativo) {
        this.nome = nome;
        this.slug = slug;
        this.ativo = ativo;
    }

    public Categoria(int id, String nome) {
        this.id = id;
        this.nome = nome;
    }

    public int getId() {
        return id;
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

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public String getAtivo() {
        return ativo;
    }

    public void setAtivo(String ativo) {
        this.ativo = ativo;
    }

    public String getIcone() {
        return icone;
    }

    public void setIcone(String icone) {
        this.icone = icone;
    }
}
