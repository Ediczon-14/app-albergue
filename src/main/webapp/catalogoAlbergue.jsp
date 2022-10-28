<%-- 
    Document   : catalogoAlbergue
    Created on : 06/10/2022, 03:38:05 PM
    Author     : edicz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="Entidad.Mascota"%>
<%@page import="Entidad.Albergue"%>


<%
    List<Mascota> da= (List<Mascota>)request.getAttribute("data");
%>

<%   Albergue al = (Albergue) request.getAttribute("data2"); %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style = "font-family: Lucida Bright,Georgia,serif;">
        <div class="container-fluid d-grid gap-3 align-items-center">
            <%@include file="/header.jsp"%>
            <%-- <%@include file="/menuUsuario.jsp"%>--%>
            <div class="container">
                
                <div class="text-center">
                    <h2 class="bg-light text-dark"><%=al.getNombreAlbergue()%> </h2>
                </div>
                <div class="text-center">
                    <a href="test1.jsp" class="btn btn-outline-dark my-2 my-sm-0">Adoptar</a>
                </div>
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
                                                    <h6 class="card-title">Nombre:</h6><p><%=a.getNombreMascota()%></p>
                                                    <h6 class="card-title">Meses:</h6><p><%=a.getMeses()%></p>
                                                    <h6 class="card-title">Color:</h6><p><%=a.getColor()%></p>
                                                    <%-- <p class="card-text"><%=a.get()%>-<%=a.getUnidadDeMedida()%></p>
                                                    <p class="card-text"><%=a.getMarcaProducto()%></p> --%>
                                                    <%--<a href="ServletMascota?tipo=buscarMascota&id=<%=a.getIdMascota()%>" class="btn btn-outline-info my-2 my-sm-0">Actualizar</a>
                                                    <hr>--%>                                                
                                                </div>
                                            </div>
                                        </div>
                <%
                                    }
                                }
                        }
                %>
                </div>
            </div>
            <%@include file="/footer.jsp"%>
        </div>
    </body>
</html>
