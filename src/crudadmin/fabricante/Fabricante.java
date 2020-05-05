package crudadmin.fabricante;

public class Fabricante {
    private int id_fabricante;
    private String fabricante;
    private String ativo_fabricante;

    public Fabricante(int id_fabricante, String fabricante, String ativo_fabricante) {
        this.id_fabricante = id_fabricante;
        this.fabricante = fabricante;
        this.ativo_fabricante = ativo_fabricante;
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

    public String getAtivo_fabricante() {
        return ativo_fabricante;
    }

    public void setAtivo_fabricante(String ativo_fabricante) {
        this.ativo_fabricante = ativo_fabricante;
    }
}
