/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package elementos_sistemas;

/**
 *
 * @author Manuelert5-Acer
 */
public class categoria {
    
    int id_categoria;
    String caetegoria;

    public categoria(int id_categoria, String caetegoria) {
        this.id_categoria = id_categoria;
        this.caetegoria = caetegoria;
    }

    public categoria() {
    }

    
    
    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getCaetegoria() {
        return caetegoria;
    }

    public void setCaetegoria(String caetegoria) {
        this.caetegoria = caetegoria;
    }
    
    
    
    

}

