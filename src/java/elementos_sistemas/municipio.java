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
public class municipio {
    
    int id;
    String municipio;
    float recargo;

    public municipio(int id, String municipio) {
        this.id = id;
        this.municipio = municipio;
    }

    public municipio(int id, String municipio, float recargo) {
        this.id = id;
        this.municipio = municipio;
        this.recargo = recargo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMunicipio() {
        return municipio;
    }

    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    public float getRecargo() {
        return recargo;
    }

    public void setRecargo(float recargo) {
        this.recargo = recargo;
    }
    
    
    
}
