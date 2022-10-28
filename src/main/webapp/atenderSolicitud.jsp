<%-- 
    Document   : atenderSolicitud
    Created on : 11/10/2022, 03:01:23 PM
    Author     : edicz
--%>

<%@page import="Entidad.Albergue"%>
<%@page import="Entidad.Solicitud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%   Solicitud a = (Solicitud) request.getAttribute("data"); %>
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
                <div class="col-8 card text-center">
                    <h1>Solicitud</h1>
                    <hr>
                    <div class="col-sm card">
                        <hr>
                        <div class="form-group" >
                            <form action="ServletMascota">
                                <input type="hidden" name="tipo" value="actualizarSolicitud">
                                <input type="hidden" name="idSolicitud" value="<%= a.getIdSolicitud()%>" >	
                                <table>
                                    <div class="form-group">
                                        <label>Fecha Solicitud</label>
                                        <input type="date" name="fechaSolicitud" required class="form-control"  value="<%= a.getFechaSolicitud()%>"> 
                                    </div>
                                    <div class="form-group">
                                        <label>Fecha Entrega</label>
                                        <input type="date" name="fechaEntrega" required class="form-control" value="<%= a.getFechaEntrega()%>">
                                    </div>
                                    <div class="form-group">
                                        <label>Estado</label>
                                        <select name="idEstado" class="form-select" required>
                                            <option value="1" selected>Pendiente</option>
                                            <option value="2">Finalizados</option>
                                        </select>
                                    </div>
                                    <div style="visibility: hidden">
                                        <input type="number" name="idAlbergue" required class="form-control"  value="<%=emp.getIdAlbergue()%>">
                                    </div>
                                    <hr>
                                    <input type="submit" value="Enviar" class="btn btn-dark form-control" ><hr>
                                </table>
                            </form>
                        </div> 
                    </div>
                </div><br><br>    
            </div>
            <br> 
            <br>
            <br>
            <%@include file="/footer.jsp"%>
        </div>
    </body>
</html>
