<%-- 
    Document   : listarSolicitudAlbergue
    Created on : 11/10/2022, 02:09:58 PM
    Author     : edicz
--%>

<%@page import="Entidad.Albergue"%>
<%@page import="java.util.Collections"%>
<%@page import="Entidad.Solicitud"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Solicitud> da= (List<Solicitud>)request.getAttribute("data");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style = "font-family: Lucida Bright,Georgia,serif;">
        <% 
            Albergue emp = (Albergue) request.getAttribute("data2");
        %>
        <div class="container-fluid d-grid gap-3 align-items-center">
            <%@include file="/header.jsp" %>
            
            <div class="row">
                <div class="col-3">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-sm text-center card">
                                <img class="d-block w-100" src="https://cdn.create.vista.com/api/media/small/475557848/stock-vector-animal-house-shelter-canine-flat" width="120" height="300">
                            </div>
                        </div><br>
                        <div class="row align-items-center">
                            <div class="col-sm text-center card" id="busqueda-cerrar">
                                <span class="busqueda-etiqueta text-dark"><%=emp.getNombreAlbergue()%></span>
                            </div>
                        </div><br>
                        <div class="row align-items-center">
                            <div class="col-sm text-center card">
                                <br>
                                <div>
                                    <a class="btn btn-dark my-2 my-sm-0 form-control" href="loginAlbergue.jsp">Cerrar Sesion</a>
                                </div>
                                <br>
                                <div>
                                    <a class="btn btn-dark my-2 my-sm-0 form-control" href="#" >Mi Perfil</a>
                                </div>
                                <br>
                                <div>
                                    <form action="ServletMascota">
                                        <input type="hidden" name="tipo" value="listarMascota">
                                        <div class="form-group" style="display: none">
                                            <input type="number" name="idMascota" required class="form-control" value="<%=emp.getIdAlbergue()%>">
                                        </div>
                                        <div class="form-group" style="display: none">
                                            <input type="number" name="idAlbergue" required class="form-control" value="<%=emp.getIdAlbergue()%>">
                                        </div>
                                        <input type="submit" value="Mascotas" class="btn btn-dark my-2 my-sm-0 form-control">                                                            
                                    </form>
                                </div>
                                <br>
                                <div>
                                    <form action="ServletMascota">
                                        <input type="hidden" name="tipo" value="listarSolicitudAlbergue">
                                        <div class="form-group" style="display: none">
                                            <input type="number" name="idAlbergue" required class="form-control" value="<%=emp.getIdAlbergue()%>">
                                        </div>
                                        <input type="submit" value="Solicitudes" class="btn btn-dark my-2 my-sm-0 form-control">                                                            
                                    </form>
                                </div>
                                <br>
                                <div>
                                    <form action="ServletMascota">
                                        <input type="hidden" name="tipo" value="EstadisticaMascotas">
                                        <div class="form-group" style="display: none">
                                            <input type="number" name="idAlbergue" required class="form-control" value="<%=emp.getIdAlbergue()%>">
                                        </div>
                                        <input type="submit" value="Estadistica" class="btn btn-dark my-2 my-sm-0 form-control">                                                            
                                    </form>
                                </div>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-8 card">
                        <div class="text-center card-header">
                            <h1>Solicitudes</h1>
                        </div>
                        <div class="row">
                            <div class="col-sm card-body">
                                <table border="1" class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>CODIGO DE SOLICITUD</th>
                                            <th>FECHA DE SOLICITUD</th>
                                            <th>FECHA DE ENTREGA</th>
                                            <th>NOMBRE DE MASCOTA</th>
                                            <th>ESTADO</th>
                                            <th>NOMBRE DE USUARIO</th>
                                            <th>TELEFONO DE USUARIO</th>
                                            <th>DNI DE USUARIO</th>
                                            <th>ACCION</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                    if(da!=null)
                                    {
                                        Collections.reverse(da);
                                        for(Solicitud a:da)
                                        {
                                    %>
                                        <tr>
                                            <td><%=a.getIdSolicitud()%></td>
                                            <td><%=a.getFechaSolicitud()%></td>
                                            <td><%=a.getFechaEntrega()%></td>
                                            <td><%=a.getNombreMascota()%></td>
                                            <td><%=a.getEstado()%></td>
                                            <td><%=a.getNombreUsuario()%> <%=a.getApellidoUsuario()%></td>
                                            <td><%=a.getTelefono()%></td>
                                            <td><%=a.getDni()%></td>
                                            <td>
                                                <form action="ServletMascota">
                                                    <input type="hidden" name="tipo" value="buscarSolicitud">
                                                    <div class="form-group" style="display: none">
                                                        <input type="number" name="idSolicitud" required class="form-control" value="<%=a.getIdSolicitud()%>">
                                                    </div>
                                                    <div class="form-group" style="display: none">
                                                        <input type="number" name="idAlbergue" required class="form-control" value="<%=emp.getIdAlbergue()%>">
                                                    </div>
                                                    <input type="submit" value="Atender" class="btn btn-dark my-2 my-sm-0 form-control">                                                            
                                                </form>
                                        </tr>
                                    <%
                                        }
                                    }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div> <br><br>    
            </div>
            <br> 
            <br>
            <br>
            <%@include file="/footer.jsp"%>
        </div>
    </body>
</html>
