<%-- 
    Document   : mascotaDetalles
    Created on : 11/10/2022, 12:15:11 PM
    Author     : edicz
--%>

<%@page import="Entidad.Usuario"%>
<%@page import="Entidad.Albergue"%>
<%@page import="Entidad.Mascota"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style = "font-family: Lucida Bright,Georgia,serif;">
        <%   Mascota a = (Mascota) request.getAttribute("data"); %>
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
                <div class="text-center">
                    <h2 class="bg-light text-dark"><%=al.getNombreAlbergue()%></h2>
                </div>
                <div class="row">
                    <hr>
                    <div class="col-sm card ">
                        <h1 class="text-center bg-dark text-light"><%= a.getNombreMascota()%></h1>
                        <hr>
                        <div class="form-group" >
                            <form action="ServletMascota">
                                <input type="hidden" name="tipo" value="Adoptar">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-sm-5 col-md-6 card">
                                            <img src="<%= a.getFoto()%>">
                                        </div>
                                        <div class="col-sm-5 offset-sm-2 col-md-6 offset-md-0 card">
                                            <div class="form-group">
                                                <h4>Meses:</h4><p><%= a.getMeses()%></p>
                                            </div><hr>
                                            <div class="form-group">
                                                <h4>Color: </h4><p><%= a.getColor()%></p>
                                            </div><hr>
                                            <div class="form-group">
                                                <h4>Tamaño: </h4><p><%= a.getTamano()%></p>
                                            </div><hr>
                                            <div class="form-group">
                                                <h4>Caracter: </h4><p><%= a.getCaracter()%></p>
                                            </div><hr>
                                            <div class="form-group">
                                                <h4>Pelaje: </h4><p><%= a.getPelaje()%></p>
                                            </div><hr>
                                            <div class="form-group">
                                                <h4>Sexo: </h4><p><%= a.getSexo()%></p>
                                            </div>
                                            <div class="form-group" style="display: none">
                                                <input type="text" name="fechaSolicitud" required class="form-control" id="fecha" readonly="">
                                                <script>
                                                    var f = new Date();
                                                    document.getElementById("fecha").value =(f.getFullYear()+ "-" +(f.getMonth() +1) + "-" + f.getDate() );
                                                </script>
                                            </div>
                                            <div class="form-group" style="display: none">
                                                <input type="number" name="idMascota" required class="form-control" value="<%= a.getIdMascota()%>">
                                            </div>
                                            <div class="form-group" style="display: none">
                                                <input type="number" name="idEstado" required class="form-control" value="1">
                                            </div>
                                            <div class="form-group" style="display: none">
                                                <input type="number" name="idUsuario" required class="form-control" value="<%=a2.getIdUsuario()%>">
                                            </div>
                                            <div class="form-group" style="display: none">
                                                <input type="number" name="idAlbergue" required class="form-control" value="<%=al.getIdAlbergue()%>">
                                            </div>
                                        </div>
                                    </div>
                                </div><hr><br>
                                <input type="submit" value="Adoptar" class="btn btn-dark my-2 my-sm-0 form-control"><br><br>
                                <a href="javascript: history.go(-1)"  class="btn btn-dark my-2 my-sm-0 form-control">Ver Catalogo</a>
                            </form>
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
