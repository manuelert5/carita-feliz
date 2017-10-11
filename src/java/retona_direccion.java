/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import elementos_sistemas.producto_en_el_carrrito;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import BD.procesos;
import com.google.gson.Gson;
import elementos_sistemas.direccion;
import java.util.ArrayList;

/**
 *
 * @author Manuelert5-Acer
 */
@WebServlet(urlPatterns = {"/retona_direccion"})
public class retona_direccion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            ArrayList<direccion> lista_direccion=new ArrayList();
            Gson json=new Gson();
            
            procesos data=new procesos();
            data.setEnteros("id_usr", 11);
            
            try{
                ResultSet lectura_db;
                data.crea_conexion();
                lectura_db=data.llama_funcion("retorna_direccion","11");

            
                while(lectura_db.next())//cargamos el arreglo de informacion
                {
                    lista_direccion.add(new direccion(      lectura_db.getInt("id_direccion"),
                                                            lectura_db.getString("departamento"), 
                                                            lectura_db.getString("municipio"),
                                                            lectura_db.getString("referencia"),
                                                            lectura_db.getString("direccion")));

                } 
                String jSon=json.toJson(lista_direccion);
                out.print(jSon);//retronameos el arreglo en forma de json
            }
            catch(Exception e)
            {
                System.err.println(e);

            }
            finally
            {
                try {
                    data.cierra_conexion();
                } catch (SQLException ex) {
                    Logger.getLogger(retorna_carrito.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
            
            
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
