/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import BD.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Manuelert5-Acer
 */
@WebServlet(urlPatterns = {"/crea_usuario"})
public class crea_usuario extends HttpServlet {

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
            String nombre       =   request.getParameter("Text_nombres");
            String apellidos    =   request.getParameter("Text_apellidos");
            String telefono     =   request.getParameter("Text_telefono");
            String email        =   request.getParameter("Text_email");
            String password     =   request.getParameter("Text_password");
            Integer socio       =   Integer.parseInt(request.getParameter("Text_socio"));
            String  direccion   =   request.getParameter("Text_direccion");
            Integer municipio   =   Integer.parseInt(request.getParameter("Text_municipio"));
            Integer departamento =  Integer.parseInt(request.getParameter("select_depto"));
            String referencia   =   request.getParameter("Text_referencia");            
            String nit          =   request.getParameter("Text_nit");
            Integer rol         =   Integer.parseInt(request.getParameter("Text_rol"));

            
            procesos proc=new procesos();
            proc.setCadenas("nombre", nombre);
            proc.setCadenas("apellido", apellidos);
            proc.setCadenas("email", email);
            proc.setCadenas("contraseña", password);
            proc.setCadenas("nit", nit);
            proc.setEnteros("departamento", departamento);
            proc.setEnteros("municipio", municipio);
            proc.setCadenas("referencia", referencia);
            proc.setCadenas("telefono", telefono);
            proc.setCadenas("direccion", direccion);
            proc.setEnteros("rol", rol);
            proc.setEnteros("socio", socio);
                                    


           String resultado;
            
            try {
                proc.crea_conexion();
                resultado=proc.sp_invoca(" { call crea_usuario(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
                System.err.println(resultado);
                if("0".equals(resultado))//si el resultado es correcto
                {
                    out.print(resultado);
                    proc.cierra_conexion();
                    
                }
                else
                {
                    out.print(resultado);//le regresamos el error
                    proc.cierra_conexion();
                }
                
            }
            catch (Exception e) {
                System.err.println(e);
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
