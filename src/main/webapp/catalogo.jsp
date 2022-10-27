<%-- 
    Document   : catalogo
    Created on : 05/10/2022, 10:40:57 AM
    Author     : edicz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="Entidad.Mascota"%>

<%
    List<Mascota> da= (List<Mascota>)request.getAttribute("data");
%>

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
                    <h1>Catalogo</h1>
                    <hr>
                    <form action="ServletMascota">
                        <input type="hidden" name="id" value="<jsp:getProperty name="albergueBean" property ="idAlbergue"/>" >	
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link text-dark active" href="ServletMascota?tipo=listarMascota&id=<jsp:getProperty name="albergueBean" property ="idAlbergue"/>">Catalogo</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-dark" href="ServletMascota?tipo=listarCaracteristicas">Agregar Mascota</a>
                            </li>
                        </ul>
                        <div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3">
                        <%
                            if(da!=null)
                                {
                                    for(Mascota a:da)
                                        {
                                            if(a.getEstado()==1)
                                            {
                        %>
                                                <div class="col"><br>
                                                    <div class="card" style="width: 11rem;">
                                                        <img class="card-img-top" width="140" height="140"  src="<%=a.getFoto()%>"  alt="Card image cap">
                                                        <div class="card-body">
                                                            <h5 class="card-title"><%=a.getNombreMascota()%></h5>
                                                            <%-- <p class="card-text"><%=a.get()%>-<%=a.getUnidadDeMedida()%></p>
                                                            <p class="card-text"><%=a.getMarcaProducto()%></p> --%>
                                                            <%--<a href="ServletMascota?tipo=buscarMascota&id=<%=a.getIdMascota()%>" class="btn btn-outline-info my-2 my-sm-0">Actualizar</a>
                                                            <hr>--%>
                                                            <a href="ServletMascota?tipo=eliminarMascota&id=<%=a.getIdMascota()%>" class="btn btn-outline-dark my-2 my-sm-0">Eliminar</a>
                                                            <a href="ServletMascota?tipo=modificarMascota&id=<%=a.getIdMascota()%>" class="btn btn-outline-dark my-2 my-sm-0">Ocultar</a>
                                                        </div>
                                                    </div>
                                                </div>
                        <%
                                            }else{}
                                        }
                                }
                        %>
                        </div>
                    </form> 
                </div><br><br>    
            </div>
            <br> 
            <br>
            <br>
            <%@include file="/footer.jsp"%>
        </div>
    </body>
</html>
