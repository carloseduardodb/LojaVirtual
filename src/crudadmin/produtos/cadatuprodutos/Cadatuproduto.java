package crudadmin.produtos.cadatuprodutos;

//utilizo essa classe pra tornar um objeto os ids e nomes de categoria subcategoria e fabricante
public class Cadatuproduto {
    private int id_categoria;
    private String categoria;

    private int id_subcategoria;
    private String subcategoria;

    private int id_fabricante;
    private String fabricante;

    public Cadatuproduto(
            int id_categoria, String categoria,
            int id_subcategoria, String subcategoria,
            int id_fabricante, String fabricante) {

        this.id_categoria = id_categoria;
        this.categoria = categoria;
        this.id_subcategoria = id_subcategoria;
        this.subcategoria = subcategoria;
        this.id_fabricante = id_fabricante;
        this.fabricante = fabricante;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getId_subcategoria() {
        return id_subcategoria;
    }

    public void setId_subcategoria(int id_subcategoria) {
        this.id_subcategoria = id_subcategoria;
    }

    public String getSubcategoria() {
        return subcategoria;
    }

    public void setSubcategoria(String subcategoria) {
        this.subcategoria = subcategoria;
    }

    public int getId_fabricante() {
        return id_fabricante;
    }

    public void setId_fabricante(int id_fabricante) {
        this.id_fabricante = id_fabricante;
    }

    public String getFabricante() {
        return fabricante;
    }

    public void setFabricante(String fabricante) {
        this.fabricante = fabricante;
    }
}
