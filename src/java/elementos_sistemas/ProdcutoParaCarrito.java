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
public class ProdcutoParaCarrito {
    Integer idUser;
    Integer idProducto;
    Integer Cantidad;

    public ProdcutoParaCarrito(Integer idUsr, Integer idProducto, Integer Cantidad) {
        this.idUser = idUsr;
        this.idProducto = idProducto;
        this.Cantidad = Cantidad;
    }

    public Integer getIdUsr() {
        return idUser;
    }

    public void setIdUsr(Integer idUsr) {
        this.idUser = idUsr;
    }

    public Integer getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Integer idProducto) {
        this.idProducto = idProducto;
    }

    public Integer getCantidad() {
        return Cantidad;
    }

    public void setCantidad(Integer Cantidad) {
        this.Cantidad = Cantidad;
    }
    
    
    
    
    
    
}
