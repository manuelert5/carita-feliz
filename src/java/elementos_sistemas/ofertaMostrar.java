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
public class ofertaMostrar {
    int id_producto;
    String nombre;
    String descripcion;
    float calificacion_global;
    float precio;
    int porcentajeDescuento;

    public ofertaMostrar(int id_producto, String nombre, String descripcion, float calificacion_global, float precio, int porcentajeDescuento) {
        this.id_producto = id_producto;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.calificacion_global = calificacion_global;
        this.precio = precio;
        this.porcentajeDescuento = porcentajeDescuento;
    }
    public ofertaMostrar(int id_producto, String nombre, String descripcion, float calificacion_global, float precio) {
        this.id_producto = id_producto;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.calificacion_global = calificacion_global;
        this.precio = precio;
    }
    

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public float getCalificacion_global() {
        return calificacion_global;
    }

    public void setCalificacion_global(float calificacion_global) {
        this.calificacion_global = calificacion_global;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public int getPorcentajeDescuento() {
        return porcentajeDescuento;
    }

    public void setPorcentajeDescuento(int porcentajeDescuento) {
        this.porcentajeDescuento = porcentajeDescuento;
    }
    
    
    
    
}
