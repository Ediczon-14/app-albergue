<%-- 
    Document   : atenderSolicitud
    Created on : 11/10/2022, 03:01:23 PM
    Author     : edicz
--%>

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
        <div class="container-fluid d-grid gap-3 align-items-center">
            <%@include file="/header.jsp" %>
            
            <div class="row">
                <div class="col-3">
                    <%@include file="/menuAlbergue.jsp"%>
                </div>
                <div class="col-8 card text-center">
                    <h1>Solicitud</h1>
                    <hr>
                    <div class="col-sm card">
                        <hr>
                        <div class="form-group" >
                            <form action="ServletMascota">
                                <input type="hidden" name="tipo" value="actualizarSolicitud">
                                <input type="hidden" name="id" value="<%= a.getIdSolicitud()%>" >	
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
                                        <input type="number" name="idAlbergue" required class="form-control"  value="<jsp:getProperty name="albergueBean" property ="idAlbergue"/>">
                                    </div>
                                    <hr>
                                    <input type="submit" value="Enviar" class="btn btn-info form-control" ><hr>
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
