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
public class pago {

    int idUser;
    int tarjeta;
    String fechaExpira;
    String año;

    public pago(int idUser, int tarjeta, String fechaExpira, String año) {
        this.idUser = idUser;
        this.tarjeta = tarjeta;
        this.fechaExpira = fechaExpira;
        this.año = año;
    }
    
    

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getTarjeta() {
        return tarjeta;
    }

    public void setTarjeta(int tarjeta) {
        this.tarjeta = tarjeta;
    }

    public String getFechaExpira() {
        return fechaExpira;
    }

    public void setFechaExpira(String fechaExpira) {
        this.fechaExpira = fechaExpira;
    }

    public String getAño() {
        return año;
    }

    public void setAño(String año) {
        this.año = año;
    }

    
    
    
}
