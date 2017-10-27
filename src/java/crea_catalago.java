/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import BD.procesos;
import com.google.gson.Gson;
import elementos_sistemas.catalago;
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
@WebServlet(urlPatterns = {"/crea_catalago"})
public class crea_catalago extends HttpServlet {

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

            Gson gSon=new Gson();
            catalago cat=gSon.fromJson(request.getParameter("catalago"), catalago.class);
            procesos data=new procesos();
            data.setCadenas("nombre", cat.getNombre());
            data.setCadenas("fechaI", cat.getFechaInicio());
            data.setCadenas("fechaF", cat.getFechaFinaliza());
            data.setEnteros("paginas", cat.getNumeroPaginas());
            data.setEnterosSalida("idCatatalago", Integer.SIZE);
            
            
            try{
                data.crea_conexion();
                String resultado_sp=data.sp_invoca(" { call crea_catalago(?,?,?,?,?,?)}");
                mensjae msj=new mensjae(Integer.parseInt(resultado_sp), data.getIntSalida("idCatatalago"));
                String jSon=gSon.toJson(msj);
                out.print(jSon);
                
            }
            catch (Exception e){
                out.print(e);
            }

            
            finally{
                try {
                    data.cierra_conexion();
                } catch (SQLException ex) {
                    Logger.getLogger(crea_catalago.class.getName()).log(Level.SEVERE, null, ex);
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

    private class mensjae{
        int resultado;
        int     idCat;

        public mensjae(int resultado_sp, int idCat) {
            this.resultado = resultado_sp;
            this.idCat = idCat;
        }

        public int getResultado_sp() {
            return resultado;
        }

        public void setResultado_sp(int resultado_sp) {
            this.resultado = resultado_sp;
        }


        public int getIdCat() {
            return idCat;
        }

        public void setIdCat(int idCat) {
            this.idCat = idCat;
        }
        
        
    }
    
}


