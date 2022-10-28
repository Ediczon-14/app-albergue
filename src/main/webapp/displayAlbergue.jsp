<%-- 
    Document   : displayAlbergue
    Created on : 04/10/2022, 04:59:34 PM
    Author     : edicz
--%>

<%@page import="Entidad.Albergue"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    Albergue emp = (Albergue) request.getAttribute("albergue");
%>

<jsp:useBean id="albergueBean" class="JavaBeans.AlbergueBean" scope="session"></jsp:useBean>   
<jsp:setProperty name="albergueBean" property ="idAlbergue" value="<%=emp.getIdAlbergue()%>"/>    
<jsp:setProperty name="albergueBean" property ="nombreAlbergue" value="<%=emp.getNombreAlbergue()%>" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style = "font-family: Lucida Bright,Georgia,serif;">
        <div class="container-fluid d-grid gap-3 align-items-center">
            <%@include file="/header.jsp"%>
                        
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
                <div class="col-9"></div>
            </div>
            
            <%@include file="/footer.jsp"%>
        </div>
    </body>
</html>
