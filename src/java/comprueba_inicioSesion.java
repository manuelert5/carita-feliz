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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Manuelert5-Acer
 */
@WebServlet(urlPatterns = {"/comprueba_inicioSesion"})
public class comprueba_inicioSesion extends HttpServlet {

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
            
            HttpSession session = request.getSession();

            
            if( session.getAttribute("usuario")==null)
            {
                out.print("	                  <link rel='stylesheet' href='css/block_error.css'>	");
                out.print("	                  <script src='js/cuenta_regresiva.js'></script>	");
                out.print("	         <div class='container col-md-12'>	");
                out.print("	            <div id='myModal' class='modal fade in' >	");
                out.print("	                <div class='modal-dialog '>	");
                out.print("	                    <div class='modal-content' id='block_error'>	");
                out.print("	                            <div>	");
                out.print("	                                <h2>Error de logeo</h2>	");
                out.print("	                                <p><h3>Para acceder a esta parte del sitio debe iniciar sesión primero!</p></h3>    	");
                out.print("	                                <p><h3>Sera redireccionado  en <span id='seg'>6</span> segundos.</h3></p>	");
                out.print("	                            </div>	");
                out.print("	                    </div><!-- /.modal-content -->	");
                out.print("	                </div><!-- /.modal-dalog -->	");
                out.print("	            </div><!-- /.modal -->	");
                out.print("	        </div>	");

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
