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
import javax.servlet.http.HttpSession;
import elementos_sistemas.persona;
/**
 *
 * @author Manuelert5-Acer
 */
@WebServlet(urlPatterns = {"/inicia_sesion"})
public class inicia_sesion extends HttpServlet {
    
    Integer id_usr =null;
    String  nombre_usr=null;
    Integer rol=null;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
                        
            String password=  request.getParameter("pass");
            String correo =request.getParameter("email");
            
            
            procesos consulta=new procesos();
            consulta.setCadenas("email", correo);
            consulta.setCadenas("pass", password);
            consulta.setEnterosSalida("id_usr", null);
            consulta.setCadenasSalida("nombre", null);
            consulta.setEnterosSalida("rol", null);
            
            try{
                consulta.crea_conexion();
                String resultado_logeo=consulta.sp_invoca("{ call loguea_user(?,?,?,?,?,?)}");

                

                if("0".equals(resultado_logeo))
                {   
                    id_usr= consulta.getIntSalida("id_usr");
                    nombre_usr=consulta.getStringSalida("nombre");
                    rol=consulta.getIntSalida("rol");
                    
                    persona usuario = new persona(id_usr, rol, nombre_usr, correo);                    
                    ///crea sesion y redirige
                    
                    HttpSession session = request.getSession();
                    
                    
                    session.setAttribute("usuario", usuario);//agrega atributo id a la sesion a la sesion
                    session.setMaxInactiveInterval(30*60); //la configura para que expire en 30 minutos
                    out.print(resultado_logeo);

                    
                }
                else
                {              
                    out.print(resultado_logeo);

                }
                
            }
            catch(Exception e)
            {
                out.print(e);
                
            }
            finally
            {
                consulta.cierra_conexion();
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(inicia_sesion.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(inicia_sesion.class.getName()).log(Level.SEVERE, null, ex);
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
