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
public class oferta {
    int id_oferta;
    String nombre;
    String descipcion;
    String fechaInicio;
    String fechaFinaliza;

    public oferta(int id_oferta, String nombre, String descipcion, String fechaInicio, String fechaFinaliza) {
        this.id_oferta = id_oferta;
        this.nombre = nombre;
        this.descipcion = descipcion;
        this.fechaInicio = fechaInicio;
        this.fechaFinaliza = fechaFinaliza;
    }

    public oferta(int id_oferta, String nombre, String fechaInicio, String fechaFinaliza) {
        this.id_oferta = id_oferta;
        this.nombre = nombre;
        this.fechaInicio = fechaInicio;
        this.fechaFinaliza = fechaFinaliza;
    }


    

    
    public oferta() {
    }

    public int getId_oferta() {
        return id_oferta;
    }

    public void setId_oferta(int id_oferta) {
        this.id_oferta = id_oferta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescipcion() {
        return descipcion;
    }

    public void setDescipcion(String descipcion) {
        this.descipcion = descipcion;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getFechaFinaliza() {
        return fechaFinaliza;
    }

    public void setFechaFinaliza(String fechaFinaliza) {
        this.fechaFinaliza = fechaFinaliza;
    }
    
    
    
    
    
}
