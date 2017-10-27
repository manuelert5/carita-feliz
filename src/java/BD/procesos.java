/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BD;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Manuelert5-Acer
 */
public class procesos extends conexion{
    
    ArrayList<cadena> cadenas=new ArrayList<>();
    ArrayList<entero> enteros=new ArrayList<>();
    ArrayList<decimales> decimal_entrada=new ArrayList<>();



    ArrayList<cadena> cadenasSalida=new ArrayList<>();
    ArrayList<entero> enterosSalida=new ArrayList<>();
    CallableStatement llamada=null;
    ResultSet lectura_db=null;


      public String sp_invoca(String cadena_sp) throws SQLException{
      //cadnea sp es la cadena para llamar al proceidiemtno almacenado
      //tipo de ejecucion  0=no retorna datos masivamente  y 1=recotnara datos masivamente
        
        
        llamada=BD.prepareCall(cadena_sp);
        llamada.registerOutParameter("retorno", java.sql.Types.VARCHAR);//esta sera el valor de retorno del sp, no dira si existio algun error


        
        for(int x=0; x!=cadenas.size(); x++)//recorre los valores de tipo string para enviarlos al sp
        {
            llamada.setString(cadenas.get(x).identificdor, cadenas.get(x).cadenas);
        }
        
        for(int x=0; x!=enteros.size(); x++)//recorre los valores de tipo integer para enviarlos al sp
        {
            llamada.setInt(enteros.get(x).idenficador, enteros.get(x).num);
        }
        
        
        for(int x=0; x!=decimal_entrada.size(); x++)//recorre los valores de tipo float para enviarlos al sp
        {
            llamada.setFloat(decimal_entrada.get(x).identificador, decimal_entrada.get(x).valor);
        }
        
        for(int x=0; x!=cadenasSalida.size(); x++)//recorre los valores de tipo string para enviarlos al sp pero representaran valores de salida
        {
            llamada.registerOutParameter(cadenasSalida.get(x).identificdor, java.sql.Types.VARCHAR);
        }
        
        for(int x=0; x!=enterosSalida.size(); x++)//recorre los valores de tipo integer para enviarlos al sp pero representaran valores de salida
        {
            llamada.registerOutParameter(enterosSalida.get(x).idenficador, java.sql.Types.INTEGER);
        }
        
        
        
        llamada.execute();//ejecuta el sp
        
  
        
        

        
        return llamada.getString("retorno");//retorna el valor del resultado del sp
        
    }
    
    public ResultSet invoca_funcion(String cadena_funcion) throws SQLException{
      //cadnea sp es la cadena para llamar al proceidiemtno almacenado
      //tipo de ejecucion  0=no retorna datos masivamente  y 1=recotnara datos masivamente
        
        
        llamada=BD.prepareCall(cadena_funcion);


        
        for(int x=0; x!=cadenas.size(); x++)//recorre los valores de tipo string para enviarlos al sp
        {
            llamada.setString(cadenas.get(x).identificdor, cadenas.get(x).cadenas);
        }
        
        for(int x=0; x!=enteros.size(); x++)//recorre los valores de tipo integer para enviarlos al sp
        {
            llamada.setInt(enteros.get(x).idenficador, enteros.get(x).num);
        }
        
        
        for(int x=0; x!=decimal_entrada.size(); x++)//recorre los valores de tipo float para enviarlos al sp
        {
            llamada.setFloat(decimal_entrada.get(x).identificador, decimal_entrada.get(x).valor);
        }
        
        for(int x=0; x!=cadenasSalida.size(); x++)//recorre los valores de tipo string para enviarlos al sp pero representaran valores de salida
        {
            llamada.registerOutParameter(cadenasSalida.get(x).identificdor, java.sql.Types.VARCHAR);
        }
        
        for(int x=0; x!=enterosSalida.size(); x++)//recorre los valores de tipo integer para enviarlos al sp pero representaran valores de salida
        {
            llamada.registerOutParameter(enterosSalida.get(x).idenficador, java.sql.Types.INTEGER);
        }
        
        return llamada.executeQuery();//ejecuta el sp
        
    }

     public void vaciaCadenas(){
         cadenas.clear();
     }

     public void vaciaEnteros(){
         enteros.clear();
     }

     public void vaciaDecimal_entrada(){
         decimal_entrada.clear();
     }

     public void vaciaCadenasSalida(){
          cadenasSalida.clear();
     }
     public void vaciaEnteroSalida(){
          enterosSalida.clear();
     }
    
   
    
    public int getIntSalida(String parametro) throws SQLException{//recupera un entero de salida
        return llamada.getInt(parametro);
    }
    
    public String getStringSalida(String parametro) throws SQLException{//recupera un string de salida
        return llamada.getString(parametro);
    }
    public int getEnteroSalida(String parametro) throws SQLException{//recupera un string de salida
        return llamada.getInt(parametro);
    }
    
    public void setCadenas(String identificador, String valor) {///establece un dato tip string que se enviara al sp
        cadenas.add(new cadena(identificador,valor));
    }

    public void setEnteros(String identificador, Integer valor) {//establece un dato tip integer que se enviara al sp
        enteros.add(new entero(identificador, valor));
    }
    
    public void setCadenasSalida(String identificador, String valor) {//establece un dato tipo string que se enviara al sp, pero este sera un dato de salida del sp
        cadenasSalida.add(new cadena(identificador,valor));
    }

    public void setEnterosSalida(String identificador, Integer valor) {//establece un dato tipo entero que se enviara al sp, pero este sera un dato de salida del sp
        enterosSalida.add(new entero(identificador, valor));
    }
    
    
    public void setDecimal_entrada(String identificador, Float Valor) {
        decimal_entrada.add(new decimales(identificador, Valor));
    }
    
    
    public ResultSet retorna_carrito() throws SQLException{
        llamada=BD.prepareCall("SELECT id_carrito, nombre,marca,precio,cantidad,estado,url_imagen,id_producto FROM retorna_carrito WHERE id_persona=2");
        ResultSet rs=llamada.executeQuery();
        return rs;
    }
    
    
    public ResultSet retorna_carrito2() throws SQLException{
        llamada=BD.prepareCall("SELECT nombre,precio, cantidad FROM retorna_carrito WHERE id_persona=2");
        ResultSet rs=llamada.executeQuery();
        return rs;
    }
    
    public ResultSet getLectura_db() {
        return lectura_db;
    }

    public void setLectura_db(ResultSet lectura_db) {
        this.lectura_db = lectura_db;
    }
    
    
    public ResultSet llama_funcion(String nombre_funcion, String parametros) throws SQLException{
        llamada=BD.prepareCall("select * from "+nombre_funcion+"("+parametros+")");
        ResultSet rs=llamada.executeQuery();
        return rs;
    }
    
    
    
    
    
}