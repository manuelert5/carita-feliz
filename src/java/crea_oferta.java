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
@WebServlet(urlPatterns = {"/crea_oferta"})
public class crea_oferta extends HttpServlet {

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
            
            Gson gSon=new Gson();
            oferta ofer=gSon.fromJson(request.getParameter("oferta"), oferta.class);
            procesos data=new procesos();
            data.setCadenas("nombre", ofer.getNombre());
            data.setCadenas("descripcion", ofer.getDescipcion());
            data.setCadenas("fechaInicio", ofer.getFechaInicio());
            data.setCadenas("fechaFin", ofer.getFechaFinaliza());
            data.setEnterosSalida("idOferta", Integer.SIZE);
            
            
            try {
                data.crea_conexion();
                
                String resultado=data.sp_invoca("{ call crea_oferta(?,?,?,?,?,?) }");
                int idOferta=data.getEnteroSalida("idOferta");
                
                RetornoOferta retorno=new RetornoOferta();
                retorno.setIdOferta(idOferta);
                retorno.setResultado(resultado);
                
                out.print(gSon.toJson(retorno));
                
                
            } 
            catch (Exception e) {
                out.print(e);
            }
            finally{
                try {
                    data.cierra_conexion();
                } catch (SQLException ex) {
                    Logger.getLogger(crea_oferta.class.getName()).log(Level.SEVERE, null, ex);
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


class RetornoOferta{
    int idOferta;
    String resultado;

    public RetornoOferta() {
    }

    public int getIdOferta() {
        return idOferta;
    }

    public void setIdOferta(int idOferta) {
        this.idOferta = idOferta;
    }

    public String getResultado() {
        return resultado;
    }

    public void setResultado(String resultado) {
        this.resultado = resultado;
    }
    
    
    
}



