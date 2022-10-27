<%-- 
    Document   : mascotaDetalles
    Created on : 11/10/2022, 12:15:11 PM
    Author     : edicz
--%>

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
        <div class="container-fluid d-grid gap-3 align-items-center">
            <%@include file="/header.jsp"%>
            <%@include file="/menuUsuario.jsp"%>
            <div class="container">
                <div class="text-center">
                    <h2 class="bg-light text-dark"><jsp:getProperty name="aBean" property ="nombreAlbergue"/></h2>
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
                                                <input type="number" name="idUsuario" required class="form-control" value="<jsp:getProperty name="usuarioBean" property ="idUsuario"/>">
                                            </div>
                                            <div class="form-group" style="display: none">
                                                <input type="number" name="idAlbergue" required class="form-control" value="<jsp:getProperty name="aBean" property ="idAlbergue"/>">
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
    </body>
</html>
