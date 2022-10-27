<%-- 
    Document   : listarSolicitudUsuario
    Created on : 11/10/2022, 01:31:45 PM
    Author     : edicz
--%>

<%@page import="java.util.List"%>
<%@page import="Entidad.Solicitud"%>
<%@page import="java.util.Collections"%>
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
            <%@include file="/header.jsp"%>
            <%@include file="/menuUsuario.jsp"%>
            <div class="container">
                <br>
                <div class="row">
                    <div class="col-3">
                        <div class="card">
                            <div class="card-header">
                                <h3>Datos de Cuenta</h3>
                            </div>
                            <div class="card-body">
                                <label>Nombres: </label>
                                <input type="text" readonly="" class="form-control" value="<jsp:getProperty name="usuarioBean" property ="nombreUsuario" />">
                                <label>Apellidos: </label>
                                <input type="text" readonly="" class="form-control" value="<jsp:getProperty name="usuarioBean" property ="apellidoUsuario" />">
                                <label>Codigo Usuario: </label>
                                <input type="text" value="<jsp:getProperty name="usuarioBean" property ="idUsuario" />" readonly="" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="col-9 card">
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
                                            <th>FOTO</th>
                                            <th>NOMBRE DE MASCOTA</th>
                                            <th>ESTADO</th>
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
                                            <td><img width="40" height="40"  src="<%=a.getFotoMascota()%>"  alt="Card image cap"></td>
                                            <td><%=a.getNombreMascota()%></td>
                                            <td><%=a.getEstado()%></td>
                                        </tr>
                                    <%
                                        }
                                    }
                                    %>
                                    </tbody>
                                </table>
                                <a href="javascript: history.go(-1)"  class="btn btn-dark my-2 my-sm-0 form-control">Regresar</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>+
            <%@include file="/footer.jsp"%>
        </div>
    </body>
</html>
