/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Entidad.Albergue;
import Modelo.ModeloAlbergue;
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
@WebServlet(name = "ServletAlbergue", urlPatterns = {"/ServletAlbergue"})
public class ServletAlbergue extends HttpServlet {

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
            out.println("<title>Servlet ServletAlbergue</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletAlbergue at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    Modelo.ModeloAlbergue m = new ModeloAlbergue();
    protected void service(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException 
    {
        String tipo=request.getParameter("tipo");
        if(tipo.equals("registrarAlbergue"))
	{
            registrarAlbergue(request, response);
	}
    }
    protected void registrarAlbergue(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
	//Se obtiene los parametros
	String nombreAlbergue = request.getParameter("nombreAlbergue");	
        String passwordAlbergue = request.getParameter("passwordAlbergue");
        
        String telefonoAlbergue = request.getParameter("telefonoAlbergue");
        String correoAlbergue = request.getParameter("correoAlbergue");
        String direccionAlbergue = request.getParameter("direccionAlbergue");
        String longitud = request.getParameter("longitud");
        String latitud = request.getParameter("latitud");
       
        //se Crea el objeto 
        Albergue a = new Albergue();
        a.setNombreAlbergue(nombreAlbergue);
        a.setPasswordAlbergue(passwordAlbergue);
        a.setTelefono(Integer.parseInt(telefonoAlbergue));
        a.setCorreoAlbergue(correoAlbergue);
        a.setDireccionAlbergue(direccionAlbergue);
        a.setLongitud(longitud);
        a.setLatitud(latitud);
                
        //Se inserta a la BD 
        ModeloAlbergue model = new ModeloAlbergue();
        model.insertaAlbergue(a);
            
        request.getRequestDispatcher("loginAlbergue.jsp").forward(request,response);
    }

}
