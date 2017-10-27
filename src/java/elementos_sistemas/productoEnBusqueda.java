/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package elementos_sistemas;


public class productoEnBusqueda {
    int id_product;
    String nombre;
    int id_categoria;
    String categoria;

    public productoEnBusqueda(int id_product, String nombre, int id_categoria, String categoria) {
        this.id_product = id_product;
        this.nombre = nombre;
        this.id_categoria = id_categoria;
        this.categoria = categoria;
    }

    

    public productoEnBusqueda() {
    }

    public int getId_product() {
        return id_product;
    }

    public void setId_product(int id_product) {
        this.id_product = id_product;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
    
    
    
}
