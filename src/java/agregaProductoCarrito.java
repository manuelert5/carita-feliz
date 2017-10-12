/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import elementos_sistemas.ProdcutoParaCarrito;
import BD.procesos;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Manuelert5-Acer
 */
@WebServlet(urlPatterns = {"/agregaProductoCarrito"})
public class agregaProductoCarrito extends HttpServlet {

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
            
            String json = request.getParameter("procutoAgragarCarrito");//obtiene el json
            Gson gSon=new Gson();//crea objeto del jSOn
            
            ProdcutoParaCarrito producto=gSon.fromJson(json, ProdcutoParaCarrito.class);//parsea el jSon a una clase
            procesos baseDatos=new  procesos();
            baseDatos.setEnteros("id_usr", producto.getIdUsr());
            baseDatos.setEnteros("id_producto", producto.getIdProducto());
            baseDatos.setEnteros("cantidad", producto.getCantidad());
            
            
            try 
            {
                baseDatos.crea_conexion();
                String resultado=baseDatos.sp_invoca("{call agregaProductoAlCarrito (?,?,?,?) }");
                out.print(resultado);
                
            } 
            catch (Exception e)
            {
                
            }
            finally
            {
                try {
                    baseDatos.cierra_conexion();
                } catch (SQLException ex) {
                    Logger.getLogger(agregaProductoCarrito.class.getName()).log(Level.SEVERE, null, ex);
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
