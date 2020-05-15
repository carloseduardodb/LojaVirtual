package crudadmin.slideshow;

public class Slideshow {
    private int id_slideshow;
    private String titulo, imagem, url, ativo;

    public Slideshow(int id_slideshow, String titulo, String imagem, String url, String ativo) {
        this.id_slideshow = id_slideshow;
        this.titulo = titulo;
        this.imagem = imagem;
        this.url = url;
        this.ativo = ativo;
    }

    public Slideshow(String titulo, String imagem, String url, String ativo) {
        this.titulo = titulo;
        this.imagem = imagem;
        this.url = url;
        this.ativo = ativo;
    }

    public int getId_slideshow() {
        return id_slideshow;
    }

    public void setId_slideshow(int id_slideshow) {
        this.id_slideshow = id_slideshow;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getAtivo() {
        return ativo;
    }

    public void setAtivo(String ativo) {
        this.ativo = ativo;
    }
}
