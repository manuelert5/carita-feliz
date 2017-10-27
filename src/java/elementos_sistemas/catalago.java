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
public class catalago {
    String nombre;
    int    numeroPaginas;
    String fechaInicio;
    String fechaFinaliza;

    public catalago(String nombre, int numeroPaginas, String fechaInicio, String fechaFinaliza) {
        this.nombre = nombre;
        this.numeroPaginas = numeroPaginas;
        this.fechaInicio = fechaInicio;
        this.fechaFinaliza = fechaFinaliza;
    }

    public catalago() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNumeroPaginas() {
        return numeroPaginas;
    }

    public void setNumeroPaginas(int numeroPaginas) {
        this.numeroPaginas = numeroPaginas;
    }

    public String getFechaInicio() {
        return fechaInicio.replace(" ", "");
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getFechaFinaliza() {
        return fechaFinaliza.replace(" ", "");
    }

    public void setFechaFinaliza(String fechaFinaliza) {
        this.fechaFinaliza = fechaFinaliza;
    }
    
    
    
}
