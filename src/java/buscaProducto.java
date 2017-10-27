/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import BD.procesos;
import com.google.gson.Gson;
import elementos_sistemas.direccion;
import elementos_sistemas.productoEnBusqueda;
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
import javax.xml.bind.ParseConversionEvent;

/**
 *
 * @author Manuelert5-Acer
 */
@WebServlet(urlPatterns = {"/buscaProducto"})
public class buscaProducto extends HttpServlet {

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

            String tipo_busqueda = request.getParameter("tipoBusqueda");
            int id_categoria = Integer.parseInt(request.getParameter("categoria"));
            String valor = request.getParameter("valor");

            ArrayList<productoEnBusqueda> producto = new ArrayList();
            Gson json = new Gson();

            procesos data = new procesos();

            try {
                ResultSet rs = null;
                data.crea_conexion();
                if ("nombre".equals(tipo_busqueda) && id_categoria == 0)///si selecciono buscar por nombre y por la categoria es cualquiera
                {
                    rs = data.llama_funcion("busca_productoXnombre", "'" + valor + "'");
                }
                if ("nombre".equals(tipo_busqueda) && id_categoria != 0)///si selecciono buscar por nombre y por la categoria no es cualquiera
                {
                    rs = data.llama_funcion("busca_productoXnombreYcategoria", "'" + valor + "'," + id_categoria);

                }
                if ("id".equals(tipo_busqueda) && id_categoria == 0)//si selecciono buscar por id y no selecciono categoria
                {
                    rs = data.llama_funcion("busca_productoXid", valor);
                }

                while (rs.next())//cargamos el arreglo de informacion
                {

                    producto.add(new productoEnBusqueda(rs.getInt("id_producto"),
                            rs.getString("nombre"),
                            rs.getInt("id_categoria"),
                            rs.getString("categoraia")));

                }
                String jSon = json.toJson(producto);
                out.print(jSon);//retronameos el arreglo en forma de json

            } catch (Exception e) {
                out.print(e);

            } finally {
                try {
                    data.cierra_conexion();
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
