/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import BD.procesos;
import com.google.gson.Gson;
import elementos_sistemas.producto_en_el_carrrito;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Manuelert5-Acer
 */
@WebServlet(urlPatterns = {"/retorna_carrito"})
public class retorna_carrito extends HttpServlet {

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
            
            
            ArrayList<producto_en_el_carrrito> lista_carrito=new ArrayList();//arreglo que guardara los elementos del carrito
            Gson json=new Gson();
            procesos data=new procesos();
            HttpSession session=request.getSession();
            
            
            try{
                int  id_seleccion_carrito= (int) session.getAttribute("id_seleccion_carrito");

                data.crea_conexion();
                ResultSet rs=data.llama_funcion("retorna_carrito", Integer.toString(id_seleccion_carrito));
            
                while(rs.next())//cargamos el arreglo de informacion
                {
                    lista_carrito.add(new producto_en_el_carrrito( rs.getInt("id_carrito"),
                                                            rs.getString("nombre"), 
                                                            rs.getString("marca"),
                                                            rs.getFloat("precio"), 
                                                            rs.getInt("cantidad"),
                                                            rs.getString("estado"),
                                                            rs.getString("url_imagen"),
                                                            rs.getInt("id_producto")));

                } 
                String js=json.toJson(lista_carrito);
                out.print(js);//retronameos el arreglo en forma de json



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
        
        try (PrintWriter out = response.getWriter()) {
            
            

            
            
            
            
        }
    
    
    
    
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
