/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BD;

import java.util.ArrayList;

/**
 *
 * @author Manuelert5-Acer
 */
public class cadena {
        String cadenas;
        String identificdor;

    public cadena(String A_idenficador, String A_cadenas) {
        cadenas=A_cadenas;
        identificdor=A_idenficador;
    }

    public String getCadenas() {
        return cadenas;
    }

    public void setCadenas(String cadenas) {
        this.cadenas = cadenas;
    }

    public String getIdentificdor() {
        return identificdor;
    }

    public void setIdentificdor(String identificdor) {
        this.identificdor = identificdor;
    }

        
        

}
