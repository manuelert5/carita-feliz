/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import BD.procesos;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Manuelert5-Acer
 */
@WebServlet(urlPatterns = {"/crea_producto"})
public class crea_producto extends HttpServlet {

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
            
            
            
            ///agrege marca y url de la imagen!!!!!
            
            String nombre_producto  =   request.getParameter("Text_nombre_prodcuto");
            String descripcion      =   request.getParameter("Text_descripcion");
            Integer lote            =   Integer.parseInt(request.getParameter("Text_lote"));
            Integer cantidad_lote   =   Integer.parseInt(request.getParameter("Text_cantidad_lote"));
            String cod_barras       =   request.getParameter("Text_cod_barras");
            Float costo             =   Float.parseFloat(request.getParameter("Text_costo"));
            Float peso              =   Float.parseFloat(request.getParameter("Text_peso"));
            Float precio_socio      =   Float.parseFloat(request.getParameter("Text_precio_socio"));
            Float precio_afiliado   =   Float.parseFloat(request.getParameter("Text_precio_afiliado"));
            Integer categoria       =   Integer.parseInt(request.getParameter("select_categoria"));
            String fecha_ingreso    =   request.getParameter("Text_fecha_ingreso");
            String fecha_expiracion =   request.getParameter("Text_fecha_expiracion");
            
                        
            procesos proc=new procesos();
            

            proc.setCadenas("nombre", nombre_producto);
            proc.setCadenas("descripcion", descripcion);
            proc.setEnteros("existencia", cantidad_lote);
            proc.setCadenas("codigo_barras", cod_barras);
            proc.setDecimal_entrada("peso", peso);
            proc.setDecimal_entrada("precio_socio", precio_socio);
            proc.setDecimal_entrada("precio_afiliado", precio_afiliado);
            proc.setEnteros("id_categoria", categoria);
            proc.setEnteros("numero_lote", lote);
            proc.setDecimal_entrada("costo_unidad", costo);
            proc.setCadenas("fecha_ingreso", fecha_ingreso);
            proc.setCadenas("fecha_expiracion", fecha_expiracion);
            

            
            

                        
            try {
                proc.crea_conexion();
                String x=proc.sp_invoca(" { call crea_producto(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
                out.print(x);
                 
                    
    
                
            }
            catch (Exception e) {
                out.print(e);
            }
            
            finally{
                try {
                    proc.cierra_conexion();
                } catch (SQLException ex) {
                    Logger.getLogger(crea_producto.class.getName()).log(Level.SEVERE, null, ex);
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
