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
public class factura {
    
    int id_factua;
    String fecha;
    float total;
    
    ArrayList<detalle_factura> detalle=new ArrayList();
    
    
    

    factura() {
    }

    public factura(int id_factua, String fecha, float total) {
        this.id_factua = id_factua;
        this.fecha = fecha;
        this.total = total;
    }

    
    
    
    
    public int getId_factua() {
        return id_factua;
    }

    public void setId_factua(int id_factua) {
        this.id_factua = id_factua;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }
    
    
    public void agregarDetalle(int id_detalle, String producto, String url_imagen, int cantidad, float precio_unitario, float subTotal){
        detalle.add(new detalle_factura(id_detalle, producto, url_imagen, cantidad, precio_unitario, subTotal));
    }

    public ArrayList<detalle_factura> getDetalle() {
        return detalle;
    }

    public void setDetalle(ArrayList<detalle_factura> detalle) {
        this.detalle = detalle;
    }
    

            
    
    
    
}
