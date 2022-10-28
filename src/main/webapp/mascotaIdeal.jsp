<%-- 
    Document   : mascotaIdeal
    Created on : 10/10/2022, 07:26:36 PM
    Author     : edicz
--%>
<%@page import="Entidad.Usuario"%>
<%@page import="Entidad.Albergue"%>
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
        <%   Albergue al = (Albergue) request.getAttribute("data3"); %>
        <%   Usuario a2 = (Usuario) request.getAttribute("data4"); %>
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
                            <li><a class="dropdown-item" href="#">Perfil</a></li>
                            <li><a class="dropdown-item" href="ServletMascota?tipo=listarSolicitud&id=<%=a2.getIdUsuario()%>">Solicitud</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="login.jsp">Salir</a></li>
                        </ul>
                    </div>
                </div>
            </header>
            
            <div class="container">
                <div class="text-center bg-light text-dark pre-scrollable" >
                    <h2><strong><%=al.getNombreAlbergue()%></strong></h2>
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
                                            if(a.getEstado()==1)
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
                                }
                        %>
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