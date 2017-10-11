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
public class producto_en_el_carrrito {
    int id_carrito;
    String nombre;
    String marca;
    Float precio;
    int cantidad;
    String estado;
    String url_imagen;
    int id_producto;
    
    
    public producto_en_el_carrrito(int id, String nombre, String marca, Float precio, int cantidad, String estado, String ur_imagen, int id_producto) {
        this.id_carrito = id;
        this.nombre = nombre;
        this.marca = marca;
        this.precio = precio;
        this.cantidad = cantidad;
        this.estado = estado;
        this.url_imagen = ur_imagen;
        this.id_producto=id_producto;
    }

    public Float getPrecio() {
        return precio;
    }

    public void setPrecio(Float precio) {
        this.precio = precio;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }
    
    

    public int getIdCarrito() {
        return id_carrito;
    }

    public void setIdCarrito(int id) {
        this.id_carrito = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }



    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getUr_imagen() {
        return url_imagen;
    }

    public void setUr_imagen(String ur_imagen) {
        this.url_imagen = ur_imagen;
    }
    
    
    
    

    
    
    
    
}
