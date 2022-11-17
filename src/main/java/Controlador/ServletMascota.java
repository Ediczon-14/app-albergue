/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Entidad.Albergue;
import Entidad.Caracter;
import Entidad.Mascota;
import Entidad.Pelaje;
import Entidad.Sexo;
import Entidad.Solicitud;
import Entidad.Tamano;
import Entidad.Usuario;
import Modelo.ModeloAlbergue;
import Modelo.ModeloMascota;
import Modelo.ModeloUsuario;
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
@WebServlet(name = "ServletMascota", urlPatterns = {"/ServletMascota"})
public class ServletMascota extends HttpServlet {

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
            out.println("<title>Servlet ServletMascota</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletMascota at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException 
    {
        String tipo=request.getParameter("tipo");
        if(tipo.equals("listarMascota"))
	{
            listarMascota(request, response);
	}else if(tipo.equals("registrarMascota"))
            {
                registrarMascota(request, response);
            }else if(tipo.equals("eliminarMascota"))
                {
                    eliminarMascota(request, response);
                }
                else if(tipo.equals("actualizarMascota"))
                    {
                        actualizarMascota(request, response);
                    }
                    else if(tipo.equals("listarCaracteristicas"))
                        {
                            listarCaracteristicas(request, response);
                        }
                        else if(tipo.equals("listarMascotaAlbergue"))
                            {
                                listarMascotaAlbergue(request, response);
                            }
                            else if(tipo.equals("MascotaDetalles"))
                                {
                                    MascotaDetalles(request, response);
                                }
                                else if(tipo.equals("Adoptar"))
                                    {
                                        Adoptar(request, response);
                                    }
                                    else if(tipo.equals("listarSolicitud"))
                                        {
                                            listarSolicitud(request, response);
                                        }
                                        else if(tipo.equals("listarSolicitudAlbergue"))
                                            {
                                                listarSolicitudAlbergue(request, response);
                                            }
                                            else if(tipo.equals("actualizarSolicitud"))
                                                {
                                                    actualizarSolicitud(request, response);
                                                }
                                                else if(tipo.equals("buscarSolicitud"))
                                                    {
                                                        buscarSolicitud(request, response);
                                                    } else if(tipo.equals("listarMascotasAdoptadas"))
                                                        {
                                                            listarMascotasAdoptadas(request, response);
                                                        }
                                                        else if(tipo.equals("EstadisticaMascotas"))
                                                            {
                                                                EstadisticaMascotas(request, response);
                                                            }else if(tipo.equals("modificarMascota"))
                                                                {
                                                                    modificarMascota(request, response);
                                                                }else if(tipo.equals("GraficoMascotas"))
                                                                        {
                                                                            GraficoMascotas(request, response);
                                                                        }else if(tipo.equals("GraficoInformacion"))
                                                                            {
                                                                                GraficoInformacion(request, response);
                                                                            }
    }
    protected void listarMascota(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
        //Se obtiene los parametros
        String idMascota = request.getParameter("idMascota");
        String idAlbergue = request.getParameter("idAlbergue");
        
        //Se inserta a la BD el cursos
        List<Mascota> info = new ModeloMascota().listarMascota(Integer.parseInt(idMascota));
        //Se almacena en memoria llamada request
        
        ModeloAlbergue model = new ModeloAlbergue();
        Albergue a = model.buscaAlbergue(Integer.parseInt(idAlbergue));
        
        request.setAttribute("data",info);
        request.setAttribute("data2",a);
        
        //Se reenvia el request(con los datos) al jsp catalogo.jsp
        request.getRequestDispatcher("catalogo.jsp").forward(request, response);
    }
    protected void listarMascotaAlbergue(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
        //Se obtiene los parametros
        String idMascota = request.getParameter("idMascota");
        String idUsuario = request.getParameter("idUsuario");
        //Se inserta a la BD el cursos
        List<Mascota> info = new ModeloMascota().listarMascota(Integer.parseInt(idMascota));
        
        ModeloAlbergue model = new ModeloAlbergue();
        Albergue a = model.buscaAlbergue(Integer.parseInt(idMascota));
        
        ModeloUsuario model2 = new ModeloUsuario();
        Usuario a2 = model2.buscaUsuario(Integer.parseInt(idUsuario));
        //Se almacena en memoria llamada request
        request.setAttribute("data",info);
        
        request.setAttribute("data2",a);
        request.setAttribute("data3",a2);
        //Se reenvia el request(con los datos) al jsp catalogoAlbergue.jsp
        request.getRequestDispatcher("catalogoAlbergue.jsp").forward(request, response);
    }
    protected void registrarMascota(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
	//Se obtiene los parametros
        
        String nombreMascota = request.getParameter("nombreMascota");
        String foto = request.getParameter("foto");
        String meses = request.getParameter("meses");
        String Color= request.getParameter("color");
        String idTamano = request.getParameter("idTamano");
        String idCaracter = request.getParameter("idCaracter");
        String idPelaje = request.getParameter("idPelaje");
        String idSexo = request.getParameter("idSexo");
        String estado = "1";
        String idAlbergue = request.getParameter("idAlbergue");
        //se Crea el objeto 
        Mascota a = new Mascota();
        a.setNombreMascota(nombreMascota);
        a.setFoto(foto);
        a.setMeses(Integer.parseInt(meses));
        a.setColor(Color);
        a.setEstado(Integer.parseInt(estado));
        a.setIdTamano(Integer.parseInt(idTamano));        
        a.setIdCaracter(Integer.parseInt(idCaracter));
        a.setIdPelaje(Integer.parseInt(idPelaje));
        a.setIdSexo(Integer.parseInt(idSexo));
        a.setIdAlbergue(Integer.parseInt(idAlbergue));
                
        //Se inserta a la BD 
        
        ModeloMascota model = new ModeloMascota();
        model.insertaMascota(a);
            
        request.getRequestDispatcher("ServletMascota?tipo=listarMascota&idMascota="+idAlbergue+"&idAlbergue="+idAlbergue).forward(request, response);
    }
    protected void eliminarMascota(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
        //Se obtiene los parametros
        String idAlbergue = request.getParameter("idAlbergue");
        String idMascota = request.getParameter("idMascota");
		
        //Se inserta a la BD el cursos
        ModeloMascota model = new ModeloMascota();
        model.eliminaMascota(Integer.parseInt(idMascota));
        //Se lista todos los cursos
        
        request.getRequestDispatcher("ServletMascota?tipo=listarMascota&idMascota="+idAlbergue+"&idAlbergue="+idAlbergue).forward(request, response);
        
    }
    protected void actualizarMascota(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
    {
        //Se obtiene los parametros}
        String nombreMascota = request.getParameter("nombreMascota");
        String foto = request.getParameter("foto");
        String meses = request.getParameter("meses");
        String Color= request.getParameter("Color");
        String idTamano = request.getParameter("idTamano");        
        String idCaracter = request.getParameter("idCaracter");
        String idPelaje = request.getParameter("idPelaje");
        String idSexo = request.getParameter("idSexo");
        String idAlbergue = request.getParameter("idAlbergue");
                
        String id = request.getParameter("id");
		
        //se Crea el objeto cursos
        Mascota a = new Mascota();
        a.setNombreMascota(nombreMascota);
        a.setFoto(foto);
        a.setMeses(Integer.parseInt(meses));
        a.setColor(Color);
        a.setIdTamano(Integer.parseInt(idTamano));
        a.setIdCaracter(Integer.parseInt(idCaracter));
        a.setIdPelaje(Integer.parseInt(idPelaje));
        a.setIdSexo(Integer.parseInt(idSexo));
        a.setIdAlbergue(Integer.parseInt(idAlbergue));

        //Se inserta a la BD el cursos
        ModeloMascota model = new ModeloMascota();
        model.actualizaMascota(a);

        //Se lista todos los cursos
        listarMascota(request, response);
				
    }
    protected void buscarMascota(HttpServletRequest request, HttpServletResponse response) 
                    throws ServletException, IOException 
    {
        //Se obtiene los parametros
        String id = request.getParameter("id");

        //Se inserta a la BD el cursos
        ModeloMascota model = new ModeloMascota();
        Mascota a = model.buscaMascota(Integer.parseInt(id));

        //Se almacena en memoria llamada request
        request.setAttribute("data",a);

        //Se reenvia el request(con los datos) al jsp listaCursos.jsp
        request.getRequestDispatcher("/actualizaMascota.jsp").forward(request, response);

    }
    protected void modificarMascota(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
    {
        String idAlbergue = request.getParameter("idAlbergue");
        String idMascota = request.getParameter("idMascota");
        	
        //se Crea el objeto cursos
        Mascota a = new Mascota();
        a.setEstado(2);
        a.setIdMascota(Integer.parseInt(idMascota));

        //Se inserta a la BD el cursos
        ModeloMascota model = new ModeloMascota();
        model.modificarMascota(a);

        //Se lista todos los cursos
        request.getRequestDispatcher("ServletMascota?tipo=listarMascota&idMascota="+idAlbergue+"&idAlbergue="+idAlbergue).forward(request, response);
				
    }
    protected void listarCaracteristicas(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
        String idAlbergue = request.getParameter("idAlbergue");
        //Se inserta a la BD el cursos
        List<Caracter> info = new ModeloMascota().listarCaracter();
        List<Pelaje> info2=new ModeloMascota().listarPelaje();
        List<Sexo> info3 = new ModeloMascota().listarSexo();
        List<Tamano> info4=new ModeloMascota().listarTamano();
        //Se almacena en memoria llamada request
        request.setAttribute("data",info);
        request.setAttribute("data2",info2);
        request.setAttribute("data3",info3);
        request.setAttribute("data4",info4);
        
        
        
        
        ModeloAlbergue model2 = new ModeloAlbergue();
        Albergue a2 = model2.buscaAlbergue(Integer.parseInt(idAlbergue));
        
        request.setAttribute("data5",a2);
        
        //Se reenvia el request(con los datos) al jsp listaCursos.jsp
        request.getRequestDispatcher("/registrarMascota.jsp").forward(request, response);
    }
    protected void MascotaDetalles(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
        //Se obtiene los parametros
        String idMascota = request.getParameter("idMascota");
        String idAlbergue = request.getParameter("idAlbergue");
        String idUsuario = request.getParameter("idUsuario");

        //Se inserta a la BD el cursos
        ModeloMascota model = new ModeloMascota();
        Mascota a = model.listarMascotaDetallado(Integer.parseInt(idMascota));

        //Se almacena en memoria llamada request
        request.setAttribute("data",a);
        
        
        ModeloAlbergue model2 = new ModeloAlbergue();
        Albergue a2 = model2.buscaAlbergue(Integer.parseInt(idAlbergue));

        ModeloUsuario model3 = new ModeloUsuario();
        Usuario a3 = model3.buscaUsuario(Integer.parseInt(idUsuario));
        //Se almacena en memoria llamada request

        request.setAttribute("data2",a2);
        request.setAttribute("data3",a3);

        //Se reenvia el request(con los datos) al jsp listaCursos.jsp
        request.getRequestDispatcher("/mascotaDetalles.jsp").forward(request, response);
    }
    protected void Adoptar(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
	//Se obtiene los parametros
        
        
        String fechaSolicitud = request.getParameter("fechaSolicitud");
        String idMascota = request.getParameter("idMascota");
        String idEstado = request.getParameter("idEstado");
        String idUsuario = request.getParameter("idUsuario");
        String idAlbergue = request.getParameter("idAlbergue");
        //se Crea el objeto 
        Solicitud a = new Solicitud();
        a.setFechaSolicitud(fechaSolicitud);
        a.setIdMascota(Integer.parseInt(idMascota));        
        a.setIdEstado(Integer.parseInt(idEstado));
        a.setIdUsuario(Integer.parseInt(idUsuario));
                
        //Se inserta a la BD 
        
        ModeloMascota model = new ModeloMascota();
        model.insertaSolicitud(a);
        
        ModeloAlbergue model2 = new ModeloAlbergue();
        Albergue a2 = model2.buscaAlbergue(Integer.parseInt(idAlbergue));

        ModeloUsuario model3 = new ModeloUsuario();
        Usuario a3 = model3.buscaUsuario(Integer.parseInt(idUsuario));
        //Se almacena en memoria llamada request

        request.setAttribute("data2",a2);
        request.setAttribute("data3",a3);
        
            
        request.getRequestDispatcher("ServletMascota?tipo=listarMascotaAlbergue&idMascota="+idAlbergue+"&idAlbergue="+idAlbergue+"&idUsuario="+idUsuario).forward(request, response);
    }
    protected void listarSolicitud(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
        
        //Se obtiene los parametros
        String idUsuario = request.getParameter("idUsuario");
        String idAlbergue = request.getParameter("idAlbergue");
        //Se inserta a la BD el cursos
        List<Solicitud> info = new ModeloMascota().listarSolicitud(Integer.parseInt(idUsuario));
        //Se almacena en memoria llamada request
        request.setAttribute("data",info);
        
        ModeloAlbergue model2 = new ModeloAlbergue();
        Albergue a2 = model2.buscaAlbergue(Integer.parseInt(idAlbergue));

        ModeloUsuario model3 = new ModeloUsuario();
        Usuario a3 = model3.buscaUsuario(Integer.parseInt(idUsuario));
        
        request.setAttribute("data2",a2);
        request.setAttribute("data3",a3);
        
        //Se reenvia el request(con los datos) al jsp catalogo.jsp
        request.getRequestDispatcher("listarSolicitudUsuario.jsp").forward(request, response);
    }
    protected void listarSolicitudAlbergue(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
        
        //Se obtiene los parametros
        String idAlbergue = request.getParameter("idAlbergue");
        //Se inserta a la BD el cursos
        List<Solicitud> info = new ModeloMascota().listarSolicitudAlbergue(Integer.parseInt(idAlbergue));
        //Se almacena en memoria llamada request
        request.setAttribute("data",info);
        
        ModeloAlbergue model2 = new ModeloAlbergue();
        Albergue a2 = model2.buscaAlbergue(Integer.parseInt(idAlbergue));
        //Se almacena en memoria llamada request

        request.setAttribute("data2",a2);
        //Se reenvia el request(con los datos) al jsp catalogo.jsp
        request.getRequestDispatcher("listarSolicitudAlbergue.jsp").forward(request, response);
    }
    protected void actualizarSolicitud(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException
    {
        //Se obtiene los parametros}
        String fechaSolicitud = request.getParameter("fechaSolicitud");
        String fechaEntrega = request.getParameter("fechaEntrega");
        String idEstado= request.getParameter("idEstado");
        String idAlbergue = request.getParameter("idAlbergue");       
        String id = request.getParameter("idSolicitud");
		
        //se Crea el objeto cursos
        Solicitud a = new Solicitud();
        a.setIdSolicitud(Integer.parseInt(id));
        a.setFechaSolicitud(fechaSolicitud);
        a.setFechaEntrega(fechaEntrega);
        a.setIdEstado(Integer.parseInt(idEstado));

        //Se inserta a la BD el cursos
        ModeloMascota model = new ModeloMascota();
        model.actualizaSolicitud(a);

        //Se lista todos los cursos
        request.getRequestDispatcher("ServletMascota?tipo=listarSolicitudAlbergue&idAlbergue="+idAlbergue).forward(request, response);
				
    }
    protected void buscarSolicitud(HttpServletRequest request, HttpServletResponse response) 
                    throws ServletException, IOException 
    {
        //Se obtiene los parametros
        String idAlbergue = request.getParameter("idAlbergue");
        String idSolicitud = request.getParameter("idSolicitud");

        //Se inserta a la BD el cursos
        ModeloMascota model = new ModeloMascota();
        Solicitud a = model.buscaSolicitud(Integer.parseInt(idSolicitud));

        //Se almacena en memoria llamada request
        
        ModeloAlbergue model2 = new ModeloAlbergue();
        Albergue a2 = model2.buscaAlbergue(Integer.parseInt(idAlbergue));
        //Se almacena en memoria llamada request

        request.setAttribute("data2",a2);
        
        request.setAttribute("data",a);

        //Se reenvia el request(con los datos) al jsp listaCursos.jsp
        request.getRequestDispatcher("atenderSolicitud.jsp").forward(request, response);

    }
    protected void listarMascotasAdoptadas(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
        
        //Se obtiene los parametros
        String id = request.getParameter("id");
        //Se inserta a la BD el cursos
        List<Solicitud> info = new ModeloMascota().listarSolicitudAlbergue(Integer.parseInt(id));
        //Se almacena en memoria llamada request
        request.setAttribute("data",info);
        
        
        ModeloAlbergue model2 = new ModeloAlbergue();
        Albergue a3 = model2.buscaAlbergue(Integer.parseInt(id));
        request.setAttribute("data3",a3);
        //Se reenvia el request(con los datos) al jsp catalogo.jsp
        request.getRequestDispatcher("tables.jsp").forward(request, response);
    }
    protected void EstadisticaMascotas(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
 
        //Se obtiene los parametros
        String idAlbergue = request.getParameter("idAlbergue");
        //Se inserta a la BD el cursos
        List<Solicitud> info = new ModeloMascota().listarSolicitudAlbergue(Integer.parseInt(idAlbergue));
        List<Mascota> info2 = new ModeloMascota().listarMascota(Integer.parseInt(idAlbergue));
        //Se almacena en memoria llamada request
        
        ModeloAlbergue model2 = new ModeloAlbergue();
        Albergue a3 = model2.buscaAlbergue(Integer.parseInt(idAlbergue));
        //Se almacena en memoria llamada request

        request.setAttribute("data3",a3);
        
        request.setAttribute("data",info);
        request.setAttribute("data2",info2);
        //Se reenvia el request(con los datos) al jsp catalogo.jsp
        request.getRequestDispatcher("estadistica.jsp").forward(request, response);
    }
    protected void GraficoMascotas(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
 
        //Se obtiene los parametros
        String id = request.getParameter("id");
        //Se inserta a la BD el cursos
        List<Solicitud> info = new ModeloMascota().listarSolicitudAlbergue(Integer.parseInt(id));
        List<Mascota> info2 = new ModeloMascota().listarMascota(Integer.parseInt(id));
        //Se almacena en memoria llamada request
        request.setAttribute("data",info);
        request.setAttribute("data2",info2);
        
        
        ModeloAlbergue model2 = new ModeloAlbergue();
        Albergue a3 = model2.buscaAlbergue(Integer.parseInt(id));
        request.setAttribute("data3",a3);
        
        //Se reenvia el request(con los datos) al jsp catalogo.jsp
        request.getRequestDispatcher("charts.jsp").forward(request, response);
    }
    protected void GraficoInformacion(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
 
        //Se obtiene los parametros
        String id = request.getParameter("id");
        //Se inserta a la BD el cursos
        List<Solicitud> info = new ModeloMascota().listarSolicitudAlbergue(Integer.parseInt(id));
        List<Mascota> info2 = new ModeloMascota().listarMascota(Integer.parseInt(id));
        //Se almacena en memoria llamada request
        request.setAttribute("data",info);
        request.setAttribute("data2",info2);
        
        
        ModeloAlbergue model2 = new ModeloAlbergue();
        Albergue a3 = model2.buscaAlbergue(Integer.parseInt(id));
        request.setAttribute("data3",a3);
        
        //Se reenvia el request(con los datos) al jsp catalogo.jsp
        request.getRequestDispatcher("GraficosInformacion.jsp").forward(request, response);
    }
}
