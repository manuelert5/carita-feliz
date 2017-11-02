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
public class paginaCatalago {
    
    int idPagina;
    int pagina;
    int idCatalago;
    String pathImagen;

    public paginaCatalago(int idPagina, int pagina, int idCatalago, String pathImagen) {
        this.idPagina = idPagina;
        this.pagina = pagina;
        this.idCatalago = idCatalago;
        this.pathImagen = pathImagen;
    }

    public paginaCatalago() {
    }

    public int getIdPagina() {
        return idPagina;
    }

    public void setIdPagina(int idPagina) {
        this.idPagina = idPagina;
    }

    public int getPagina() {
        return pagina;
    }

    public void setPagina(int pagina) {
        this.pagina = pagina;
    }

    public int getIdCatalago() {
        return idCatalago;
    }

    public void setIdCatalago(int idCatalago) {
        this.idCatalago = idCatalago;
    }

    public String getPathImagen() {
        return pathImagen;
    }

    public void setPathImagen(String pathImagen) {
        this.pathImagen = pathImagen;
    }
    
    
    
    
    
    
}
