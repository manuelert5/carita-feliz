/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import BD.procesos;
import com.google.gson.Gson;
import elementos_sistemas.oferta;
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

/**
 *
 * @author Manuelert5-Acer
 */
@WebServlet(urlPatterns = {"/busca_ofertas"})
public class busca_ofertas extends HttpServlet {

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
            String fechaI=request.getParameter("fechaInicio");
            String fechaF=request.getParameter("fechaFin");
            procesos data=new procesos();
            ArrayList <oferta> ArrOferta=new ArrayList();
            
            
            try{
                
                data.crea_conexion();
                ResultSet rs=data.llama_funcion("retrona_ofertasXfecha", "'"+fechaI+"','"+fechaF+"'");
                while(rs.next())
                {
                    ArrOferta.add(new oferta(rs.getInt("id_ofertaCat"),
                                             rs.getString("nombre"),
                                             rs.getString("descripcion"),
                                             rs.getString("fechaInicio"),
                                             rs.getString("fechaFin")));
                    
                }
                Gson gSon=new Gson();
                out.print(gSon.toJson(ArrOferta));
                
            }
            catch(Exception e){
                out.print(e);
            }
            finally{
                try {
                    data.cierra_conexion();
                } catch (SQLException ex) {
                    Logger.getLogger(busca_ofertas.class.getName()).log(Level.SEVERE, null, ex);
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
