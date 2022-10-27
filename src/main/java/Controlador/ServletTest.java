/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Entidad.Mascota;
import Modelo.ModeloMascota;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author edicz
 */
@WebServlet(name = "ServletTest", urlPatterns = {"/ServletTest"})
public class ServletTest extends HttpServlet {

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
            out.println("<title>Servlet ServletTest</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletTest at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    protected void service(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException 
    {
        String tipo=request.getParameter("tipo");
        if(tipo.equals("test1"))
	{
            test1(request, response);
	}else if(tipo.equals("test2"))
            {
                test2(request, response);
            }else if(tipo.equals("test3"))
                {
                    test3(request, response);
                }
    }
    protected void test1(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
	//Se obtiene los parametros
        
        String pregunta1 = request.getParameter("pregunta1");
        String pregunta2 = request.getParameter("pregunta2");
        String pregunta3 = request.getParameter("pregunta3");
        String pregunta4= request.getParameter("pregunta4");
        String pregunta5 = request.getParameter("pregunta5");
        String pregunta6 = request.getParameter("pregunta6");
        String pregunta7 = request.getParameter("pregunta7");
        String pregunta8 = request.getParameter("pregunta8");
        String idAlbergue = request.getParameter("id");
        
        int i=530;
        int p1= Integer.parseInt(pregunta1);
        int p2= Integer.parseInt(pregunta2);
        int p3= Integer.parseInt(pregunta3);
        int p4= Integer.parseInt(pregunta4);
        int p5= Integer.parseInt(pregunta5);
        int p6= Integer.parseInt(pregunta6);
        int p7= Integer.parseInt(pregunta7);
        int p8= Integer.parseInt(pregunta8);
        
        int puntos=p1+p2+p3+p4+p5+p6+p7+p8;
        
        
        if(i<=puntos)
        {
            request.getRequestDispatcher("test2.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("ServletMascota?tipo=listarMascotaAlbergue&id="+idAlbergue).forward(request, response);
        }
    }
    protected void test2(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
	//Se obtiene los parametros
        
        String pregunta1 = request.getParameter("pregunta1");
        String pregunta2 = request.getParameter("pregunta2");
        String pregunta3 = request.getParameter("pregunta3");
        String pregunta4= request.getParameter("pregunta4");
        String pregunta5 = request.getParameter("pregunta5");
        String pregunta6 = request.getParameter("pregunta6");
        String pregunta7 = request.getParameter("pregunta7");
        String idAlbergue = request.getParameter("id");
        
        int i=200;
        int p1= Integer.parseInt(pregunta1);
        int p2= Integer.parseInt(pregunta2);
        int p3= Integer.parseInt(pregunta3);
        int p4= Integer.parseInt(pregunta4);
        int p5= Integer.parseInt(pregunta5);
        int p6= Integer.parseInt(pregunta6);
        int p7= Integer.parseInt(pregunta7);
        
        int puntos=p1+p2+p3+p4+p5+p6+p7;
        
        
        if(i<=puntos)
        {
            request.getRequestDispatcher("test3.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("ServletMascota?tipo=listarMascotaAlbergue&id="+idAlbergue).forward(request, response);
        }
    }
    protected void test3(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
	//Se obtiene los parametros
            
        String tamano = request.getParameter("tamano");
        String pelaje= request.getParameter("pelaje");
        String caracter = request.getParameter("caracter");
        String id = request.getParameter("id");
        
        int IdAlbergue=Integer.parseInt(id);
        int IdTamano=Integer.parseInt(tamano);
        int IdPelaje=Integer.parseInt(pelaje);
        int IdCaracter=Integer.parseInt(caracter);
   
        List<Mascota> info = new ModeloMascota().BuscarMascotaIdeal(IdAlbergue, IdTamano, IdPelaje, IdCaracter);
        //Se almacena en memoria llamada request
        request.setAttribute("data",info);
        //Se reenvia el request(con los datos) al jsp catalogo.jsp
        
        //Se obtiene los parametros
        //Se inserta a la BD el cursos
        List<Mascota> info2 = new ModeloMascota().listarMascota(IdAlbergue);
        //Se almacena en memoria llamada request
        request.setAttribute("data2",info2);
        //Se reenvia el request(con los datos) al jsp catalogo.jsp
        request.getRequestDispatcher("mascotaIdeal.jsp").forward(request, response);
        
        


    }
}
