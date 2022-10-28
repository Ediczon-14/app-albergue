<%-- 
    Document   : listarSolicitudUsuario
    Created on : 11/10/2022, 01:31:45 PM
    Author     : edicz
--%>

<%@page import="Entidad.Usuario"%>
<%@page import="Entidad.Albergue"%>
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
        <%   Albergue al = (Albergue) request.getAttribute("data2"); %>
        <%   Usuario a2 = (Usuario) request.getAttribute("data3"); %>
        <div class="container-fluid d-grid gap-3 align-items-center">
            <%@include file="/header.jsp"%>
            <header class="p-3 mb-3 border-bottom">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0"></ul>
                    <div class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
                        <span><%=a2.getNombreUsuario()%> <%=a2.getApellidoUsuario()%></span>
                    </div>
                    <div class="dropdown text-end">
                        <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="https://us.123rf.com/450wm/martialred/martialred1608/martialred160800018/61263271-cuenta-de-usuario-perfil-del-icono-del-c%C3%ADrculo-plana-para-aplicaciones-y-sitios-web.jpg?ver=6" alt="mdo" width="32" height="32" class="rounded-circle">
                        </a>
                        <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1" style="">
                            <li><a class="btn btn-outline-dark my-2 my-sm-0 form-control" href="#">Perfil</a></li>
                            <li>
                                <form action="ServletMascota">
                                    <input type="hidden" name="tipo" value="listarSolicitud">
                                    <div class="form-group" style="display: none">
                                        <input type="number" name="idAlbergue" required class="form-control" value="<%=al.getIdAlbergue()%>">
                                    </div>
                                    <div class="form-group" style="display: none">
                                        <input type="number" name="idUsuario" required class="form-control" value="<%=a2.getIdUsuario()%>">
                                    </div>
                                    <input type="submit" value="Solicitud" class="btn btn-outline-dark my-2 my-sm-0 form-control">                                                            
                                </form>
                            </li>
                            <li><a class="btn btn-outline-dark my-2 my-sm-0 form-control" href="login.jsp">Salir</a></li>
                        </ul>
                    </div>
                </div>
            </header>
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
                                <input type="text" readonly="" class="form-control" value="<%=a2.getNombreUsuario()%>">
                                <label>Apellidos: </label>
                                <input type="text" readonly="" class="form-control" value="<%=a2.getApellidoUsuario()%>">
                                <label>Codigo Usuario: </label>
                                <input type="text" value="<%=a2.getIdUsuario()%>" readonly="" class="form-control">
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
            </div>
            <%@include file="/footer.jsp"%>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
