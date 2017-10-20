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
public class detalle_factura {
    
    int id_detalle;
    String producto;
    String url_imagen;
    int cantidad;
    float precio_unitario;
    float subTotal;

    detalle_factura() {
    }

    public detalle_factura(int id_detalle, String producto, String url_imagen, int cantidad, float precio_unitario, float subTotal) {
        this.id_detalle = id_detalle;
        this.producto = producto;
        this.url_imagen = url_imagen;
        this.cantidad = cantidad;
        this.precio_unitario = precio_unitario;
        this.subTotal = subTotal;
    }
    
    
    
    public int getId_detalle() {
        return id_detalle;
    }

    public void setId_detalle(int id_detalle) {
        this.id_detalle = id_detalle;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getUrl_imagen() {
        return url_imagen;
    }

    public void setUrl_imagen(String url_imagen) {
        this.url_imagen = url_imagen;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public float getPrecio_unitario() {
        return precio_unitario;
    }

    public void setPrecio_unitario(float precio_unitario) {
        this.precio_unitario = precio_unitario;
    }

    public float getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(float subTotal) {
        this.subTotal = subTotal;
    }
    
    
    
    
}
