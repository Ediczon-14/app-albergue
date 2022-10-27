/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Entidad.Usuario;
import Modelo.ModeloUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author edicz
 */
@WebServlet(name = "ServletUsuario", urlPatterns = {"/ServletUsuario"})
public class ServletUsuario extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletUsuario</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletUsuario at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    Modelo.ModeloUsuario m = new ModeloUsuario();
    protected void service(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException 
    {
        String tipo=request.getParameter("tipo");
        if(tipo.equals("registrarUsuario"))
	{
            registrarUsuario(request, response);
	}
    }
    protected void registrarUsuario(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
	//Se obtiene los parametros
        String passwordUsuario = request.getParameter("passwordUsuario");
	String nombreUsuario = request.getParameter("nombreUsuario");	
        String apellidoUsuario = request.getParameter("apellidoUsuario");
        String edad = request.getParameter("edad");
        String direccionUsuario = request.getParameter("direccionUsuario");
        String telefonoUsuario = request.getParameter("telefonoUsuario");
        String dni = request.getParameter("dni");
        String correoUsuario = request.getParameter("correoUsuario");
        
       
        //se Crea el objeto 
        Usuario a = new Usuario();
        a.setPasswordUsuario(passwordUsuario);
        a.setNombreUsuario(nombreUsuario);
        a.setApellidoUsuario(apellidoUsuario);
        a.setEdad(Integer.parseInt(edad));
        a.setDireccionUsuario(direccionUsuario);
        a.setTelefonoUsuario(Integer.parseInt(telefonoUsuario));
        a.setDni(Integer.parseInt(dni));
        a.setCorreoUsuario(correoUsuario);
                
        //Se inserta a la BD 
        ModeloUsuario model = new ModeloUsuario();
        model.insertaUsuario(a);
            
        request.getRequestDispatcher("login.jsp").forward(request,response);
    }

}
