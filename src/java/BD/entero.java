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
public class entero {
        Integer  num;
        String idenficador;
        
    entero(String A_identificador, Integer A_enteros){
        idenficador=A_identificador;
        num=A_enteros;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getIdenficador() {
        return idenficador;
    }

    public void setIdenficador(String idenficador) {
        this.idenficador = idenficador;
    }       
        

    
}
