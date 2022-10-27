<%-- 
    Document   : listarSolicitudAlbergue
    Created on : 11/10/2022, 02:09:58 PM
    Author     : edicz
--%>

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
        <div class="container-fluid d-grid gap-3 align-items-center">
            <%@include file="/header.jsp" %>
            
            <div class="row">
                <div class="col-3">
                    <%@include file="/menuAlbergue.jsp"%>
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
                                            <td><a href="ServletMascota?tipo=buscarSolicitud&id=<%=a.getIdSolicitud()%>"  class="btn btn-outline-dark my-2 my-sm-0 form-control">Atender</a></td>
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
