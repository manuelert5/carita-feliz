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
public class ofertaDetalle {
    
    
    int idDetalle;
    int id_cat;
    int idOferta;
    String categoria;
    int pocentaje;

    public ofertaDetalle(int id_cat, int idOferta, String categoria, int pocentaje) {
        this.id_cat = id_cat;
        this.idOferta = idOferta;
        this.categoria = categoria;
        this.pocentaje = pocentaje;
    }
    
    
    public ofertaDetalle(int idDetalle, int id_cat, int pocentaje, String categoria) {
        this.idDetalle=idDetalle;
        this.id_cat = id_cat;
        this.categoria = categoria;
        this.pocentaje = pocentaje;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    public ofertaDetalle() {
    }

    public int getIdOferta() {
        return idOferta;
    }

    public void setIdOferta(int idOferta) {
        this.idOferta = idOferta;
    }

    
    public int getId_cat() {
        return id_cat;
    }

    public void setId_cat(int id_cat) {
        this.id_cat = id_cat;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getPocentaje() {
        return pocentaje;
    }

    public void setPocentaje(int pocentaje) {
        this.pocentaje = pocentaje;
    }
}
