/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.DAOUSUARIO;
import Modelo.usuario;
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
 * @author aleja
 */
@WebServlet(name = "srvUsuario", urlPatterns = {"/srvUsuario"})
public class srvUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");

        try {
            if (accion != null) {

                switch (accion) {
                    case "verificar":
                        verificar(request, response);
                        break;
                    case "cerrar":
                        cerrarsesion(request, response);
                    default:

                }

            } else {
                response.sendRedirect("identificar.jsp");
            }
        } catch (Exception e) {
            try {
                this.getServletConfig().getServletContext().getRequestDispatcher("/mensaje.jsp").forward(request, response);
            } catch (Exception ex) {
                System.err.println("error" + e.getMessage());
            }
        }

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet srvUsuario</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet srvUsuario at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

    private void verificar(HttpServletRequest request, HttpServletResponse response) throws Exception {
       
        
     HttpSession sesion;
        DAOUSUARIO dao;
        usuario usuario;
        usuario=this.obtenerUsuario(request);
     
        dao =new DAOUSUARIO();
        usuario=dao.identificar(usuario);
        if(usuario != null && usuario.getCargo().getNombreCargo().equals("ADMINISTRADOR")){
            sesion=request.getSession();
            sesion.setAttribute("usuario",usuario);
            request.setAttribute("msje", "bienvenido al sistema");
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/index.jsp").forward(request, response);
        }else if(usuario !=null && usuario.getCargo().getNombreCargo().equals("VENDEDOR")){
            sesion=request.getSession();
            sesion.setAttribute("vendedor",usuario);
            request.setAttribute("msje", "bienvenido al sistema");
            this.getServletConfig().getServletContext().getRequestDispatcher("/vistas/formVendedor.jsp").forward(request, response);
        }else{
            request.setAttribute("msje", "credenciales incorrectas");
            request.getRequestDispatcher("identificar.jsp").forward(request, response);
        }
        
    }

    private void cerrarsesion(HttpServletRequest request, HttpServletResponse response)throws Exception {
     HttpSession sesion=request.getSession();
     sesion.setAttribute("usuario", null);
     sesion.invalidate();
     response.sendRedirect("identificar.jsp");
    }

    private usuario obtenerUsuario(HttpServletRequest request) {
     
        usuario u=new usuario();
        u.setNombreusuario(request.getParameter("txtUsu"));
        u.setClave(request.getParameter("txtPass"));
        return u;
    }

}
