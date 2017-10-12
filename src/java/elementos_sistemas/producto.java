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
public class producto {
    
    String  nombre;
    Float   precio;
    String  cat;
    String  subCat;
    String  descripcion;
    String  existencia;
    String  pathImagen;
    Float   calificacion;

    public producto() {
        this.nombre = null;
        this.precio = null;
        this.cat = null;
        this.subCat = null;
        this.descripcion = null;
        this.existencia = null;
        this.pathImagen = null;
        
    }
    

    public producto(String nombre, Float precio, String cat, String subCat, String descripcion, String existencia, String pathImagen) {
        this.nombre = nombre;
        this.precio = precio;
        this.cat = cat;
        this.subCat = subCat;
        this.descripcion = descripcion;
        this.existencia = existencia;
        this.pathImagen = pathImagen;
    }

    public Float getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(Float calificacion) {
        this.calificacion = calificacion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Float getPrecio() {
        return precio;
    }

    public void setPrecio(Float precio) {
        this.precio = precio;
    }

    public String getCat() {
        return cat;
    }

    public void setCat(String cat) {
        this.cat = cat;
    }

    public String getSubCat() {
        return subCat;
    }

    public void setSubCat(String subCat) {
        this.subCat = subCat;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getExistencia() {
        return existencia;
    }

    public void setExistencia(String existencia) {
        this.existencia = existencia;
    }


    public String getPathImagen() {
        return pathImagen;
    }

    public void setPathImagen(String pathImagen) {
        this.pathImagen = pathImagen;
    }
    
    
    
    
    
    
}
