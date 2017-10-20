/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package elementos_sistemas;

import java.util.ArrayList;

/**
 *
 * @author Manuelert5-Acer
 */
public class pedido {
    int id_pedido;
    String codigo_rastreo;
    float peso;
    String estado;
    String direccion;
    String telefono;
    String fecha;
    ArrayList<seguimiento> seguimiento=new ArrayList();
    


    
    
    
    
    public pedido(){
    }
    
    
    public void agregarSeguimiento(String fecha, String descrpicion){
        seguimiento.add(new seguimiento(fecha,descrpicion));
    }

    public ArrayList<seguimiento> getSeguimiento() {
        return seguimiento;
    }

    public void setSeguimiento(ArrayList<seguimiento> seguimiento) {
        this.seguimiento = seguimiento;
    }
    

    
    
    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public String getCodigo_rastreo() {
        return codigo_rastreo;
    }

    public void setCodigo_rastreo(String codigo_rastreo) {
        this.codigo_rastreo = codigo_rastreo;
    }

    public float getPeso() {
        return peso;
    }

    public void setPeso(float peso) {
        this.peso = peso;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
    
}
