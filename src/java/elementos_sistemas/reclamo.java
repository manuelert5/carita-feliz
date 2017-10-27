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
public class reclamo {
    int idFactura;
    int idDetFac;
    String motivo;
    String descipcion;

    public reclamo() {
    }

    public reclamo(int idFactura, int idDetFac, String motivo, String descipcion) {
        this.idFactura = idFactura;
        this.idDetFac = idDetFac;
        this.motivo = motivo;
        this.descipcion = descipcion;
    }

    public int getIdFactura() {
        return idFactura;
    }

    public void setIdFactura(int idFactura) {
        this.idFactura = idFactura;
    }

    public int getIdDetFac() {
        return idDetFac;
    }

    public void setIdDetFac(int idDetFac) {
        this.idDetFac = idDetFac;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getDescipcion() {
        return descipcion;
    }

    public void setDescipcion(String descipcion) {
        this.descipcion = descipcion;
    }
    
    
    
    
    
    
}
