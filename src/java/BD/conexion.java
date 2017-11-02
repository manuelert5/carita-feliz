/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Manuelert5-Acer
 */
public class conexion {
    Connection BD=null;

    
    public void crea_conexion() {
        try{
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        //    BD=DriverManager.getConnection("jdbc:sqlserver://mssql6.gear.host:1433;databaseName=desarrolloWeb","desarrolloweb","1helado!");
            BD=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=desarrolloWeb","jproyecto","123");
        
        }
        catch(Exception e)
        {
            System.out.println("Error de conexion a la BD");
        }
    }
    
    
    public void cierra_conexion() throws SQLException{
        BD.close();
    }
    
    public void commit() throws SQLException{
        BD.commit();
    }
    
    public void rollback() throws SQLException{
        BD.rollback();
    }
    
    public void AutCommit(Boolean b) throws SQLException{
        BD.setAutoCommit(b);
    }
    
    

}
