package Controlador;

import Modelo.conexion;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

import Modelo.productos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


@WebServlet(name = "srvproducto", urlPatterns = {"/srvproducto"})
public class srvproducto extends HttpServlet {

    
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los datos del formulario
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        double precio = Double.parseDouble(request.getParameter("precio"));
        String descripcion = request.getParameter("descripcion");
        //imagen agregando
        Part filePart = request.getPart("imagen"); 
        InputStream inputStream = filePart.getInputStream();    
        byte[] imagen = inputStream.readAllBytes(); 
        // Crear el objeto producto
        productos producto = new productos(id,nombre, precio, descripcion, imagen);

        // Guardar el producto (aquí solo lo mostramos por simplicidad)
        // En una aplicación real, deberías guardar este producto en una base de datos.

        request.setAttribute("producto", producto);
        request.getRequestDispatcher("/producto-agregado.jsp").forward(request, response);
    }
  
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idProducto = request.getParameter("id");
        String sql = "SELECT imagen FROM productos WHERE id = ?";
        
        try (Connection conn = conexion.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, Integer.parseInt(idProducto));
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    byte[] imagen = rs.getBytes("imagen");
                    response.setContentType("image/jpeg");
                    OutputStream out = response.getOutputStream();
                    out.write(imagen);
                    out.flush();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
  

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  

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
