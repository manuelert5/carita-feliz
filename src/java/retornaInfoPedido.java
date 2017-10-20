/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import BD.procesos;
import com.google.gson.Gson;
import elementos_sistemas.pedido;
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
import javax.xml.bind.ParseConversionEvent;

/**
 *
 * @author Manuelert5-Acer
 */
@WebServlet(urlPatterns = {"/retornaInfoPedido"})
public class retornaInfoPedido extends HttpServlet {

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

            int idFactura =Integer.parseInt(request.getParameter("idFactura"));
            procesos bd=new procesos();
            pedido ped=new  pedido();


            
            try
            {
                bd.crea_conexion();
                ResultSet rs=bd.llama_funcion("retorna_pedido", Integer.toString(idFactura));
                
                while(rs.next())
                {
                    ped.setId_pedido(rs.getInt("id_pedido"));
                    ped.setCodigo_rastreo(rs.getString("cod_rastreo"));
                    ped.setPeso(rs.getFloat("peso"));
                    ped.setEstado(rs.getString("estado"));
                    ped.setDireccion(rs.getString("dir"));
                    ped.setTelefono(rs.getString("telefono"));
                    ped.setFecha(rs.getString("fecha"));
                    
                    ResultSet rs2=bd.llama_funcion("retorna_seguimientos", Integer.toString(ped.getId_pedido()));
                    while (rs2.next())
                    {
                        ped.agregarSeguimiento(rs2.getString("fech"), rs2.getString("descripcion"));
                    }
                    
                }
                
                Gson gson=new Gson();
                String json=gson.toJson(ped);
                out.print(json);
                
                
                
                
                
            }
            catch(Exception e)
            {
                out.print(e);
                
            }
            finally
            {
                try {
                    bd.cierra_conexion();
                } catch (SQLException ex) {
                    Logger.getLogger(retornaInfoPedido.class.getName()).log(Level.SEVERE, null, ex);
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
