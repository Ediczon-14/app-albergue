<%-- 
    Document   : mascotaIdeal
    Created on : 10/10/2022, 07:26:36 PM
    Author     : edicz
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="Entidad.Mascota"%>


<%
    List<Mascota> da= (List<Mascota>)request.getAttribute("data");
%>

<%
    List<Mascota> da2= (List<Mascota>)request.getAttribute("data2");
%>

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
                <div class="text-center bg-light text-dark pre-scrollable" >
                    <h2><strong><jsp:getProperty name="aBean" property ="nombreAlbergue"/></strong></h2>
                </div>
                
                <div class="card">
                    <div class="card-title text-center bg-dark text-light">
                        <h3>Mascota Ideal</h3>
                    </div>
                    <div class="card-body">
                        <div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3">
                        <%
                            if(da!=null)
                                {
                                    for(Mascota a:da)
                                        {
                        %>
                                            <div class="col"><br>
                                                <div class="card" style="width: 11rem;">
                                                    <img class="card-img-top" width="140" height="140"  src="<%=a.getFoto()%>"  alt="Card image cap">
                                                    <div class="card-body">
                                                        <h6 class="card-title"><strong>Nombre: </strong></h6><p><%=a.getNombreMascota()%></p>
                                                        <h6 class="card-title"><strong>Meses: </strong></h6><p><%=a.getMeses()%></p>
                                                        <h6 class="card-title"><strong>Color: </strong></h6><p><%=a.getColor()%></p>
                                                        <a href="ServletMascota?tipo=MascotaDetalles&id=<%=a.getIdMascota()%>" class="btn btn-outline-dark text-center">Ver Mas</a>                                              
                                                    </div>
                                                </div>
                                            </div>
                        <%
                                        }
                                }
                        %>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="card">
                    <div class="card-title text-center bg-dark text-light">
                        <h3>Catalogo</h3>
                    </div>
                    <div class="card-body">
                        <div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3">
                        <%
                            if(da2!=null)
                                {
                                    for(Mascota a:da2)
                                        {
                        %>
                                            <div class="col"><br>
                                                <div class="card" style="width: 11rem;">
                                                    <img class="card-img-top" width="140" height="140"  src="<%=a.getFoto()%>"  alt="Card image cap">
                                                    <div class="card-body">
                                                        <h6 class="card-title"><strong>Nombre: </strong></h6><p><%=a.getNombreMascota()%></p>
                                                        <h6 class="card-title"><strong>Meses: </strong></h6><p><%=a.getMeses()%></p>
                                                        <h6 class="card-title"><strong>Color: </strong></h6><p><%=a.getColor()%></p>
                                                        <a href="ServletMascota?tipo=MascotaDetalles&id=<%=a.getIdMascota()%>" class="btn btn-outline-dark text-center">Ver Mas</a>                                               
                                                    </div>
                                                </div>
                                            </div>
                        <%
                                        }
                                }
                        %>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="/footer.jsp"%>
        </div>
    </body>
</html>