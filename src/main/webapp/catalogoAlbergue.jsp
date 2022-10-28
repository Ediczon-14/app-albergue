<%-- 
    Document   : catalogoAlbergue
    Created on : 06/10/2022, 03:38:05 PM
    Author     : edicz
--%>

<%@page import="Entidad.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="Entidad.Mascota"%>
<%@page import="Entidad.Albergue"%>


<%
    List<Mascota> da= (List<Mascota>)request.getAttribute("data");
%>

<%   Albergue al = (Albergue) request.getAttribute("data2"); %>
<%   Usuario a2 = (Usuario) request.getAttribute("data3"); %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style = "font-family: Lucida Bright,Georgia,serif;">
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
                
                <div class="text-center">
                    <h2 class="bg-light text-dark"><%=al.getNombreAlbergue()%> </h2>
                </div>
                <div class="text-center">
                    <form action="ServletTest">
                        <input type="hidden" name="tipo" value="listarDatos">
                        <div style="visibility: hidden">
                            <input type="hidden" value="<%=a2.getIdUsuario()%>" name="idUsuario" class="form-control form-submit input_pass" >
                        </div>
                        <div style="visibility: hidden">
                            <input type="hidden" value="<%=al.getIdAlbergue()%>" name="idAlbergue" class="form-control form-submit input_pass" >
                        </div>
                        <input type="submit" value="Adoptar" class="btn btn-dark form-control" ><br><br>
                    </form>
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
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
