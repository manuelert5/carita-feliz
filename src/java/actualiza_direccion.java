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
import BD.procesos;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Manuelert5-Acer
 */
@WebServlet(urlPatterns = {"/actualiza_direccion"})
public class actualiza_direccion extends HttpServlet {

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
            int id_dir= Integer.parseInt(request.getParameter("id_dir"));
            String departamento= request.getParameter("departamento");
            String muncipio=request.getParameter("municipio");
            String referencia=request.getParameter("referencia");
            String direccion=request.getParameter("direccion");
            
            
           String resultado;
           
           procesos proc =new procesos();
           proc.setCadenas("departamento", departamento);
           proc.setCadenas("municipio", muncipio);
           proc.setCadenas("referencia", referencia);
           proc.setCadenas("direccion", direccion);
           proc.setEnteros("id_dir", id_dir);
           
           
           
            
            try {
                proc.crea_conexion();
                resultado=proc.sp_invoca(" { call actualiza_direccion(?,?,?,?,?,?)}");
                System.err.println(resultado);
                if("0".equals(resultado))//si el resultado es correcto
                {
                    out.print(resultado);
                    
                }
                else
                {
                    out.print(resultado);//le regresamos el error
                }
                
            }
            catch (Exception e) {
                System.err.println(e);
            }
            
            finally
            {
                try {
                    proc.cierra_conexion();
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
