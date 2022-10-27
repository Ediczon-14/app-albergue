<%-- 
    Document   : menuAlbergue
    Created on : 03/10/2022, 07:32:03 PM
    Author     : edicz
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style = "font-family: Lucida Bright,Georgia,serif;">
        <div class="container-fluid d-grid gap-3 align-items-center">
             
            <br>
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-sm text-center card">
                        <img class="d-block w-100" src="https://cdn.create.vista.com/api/media/small/475557848/stock-vector-animal-house-shelter-canine-flat" width="120" height="300">
                    </div>
                </div><br>
                <div class="row align-items-center">
                    <div class="col-sm text-center card" id="busqueda-cerrar">
                        <span class="busqueda-etiqueta text-dark"><jsp:getProperty name="albergueBean" property ="nombreAlbergue" /></span>
                    </div>
                </div><br>
                <div class="row align-items-center">
                    <div class="col-sm text-center card"><br>
                        <a class="btn btn-dark " href="loginAlbergue.jsp">Cerrar Sesion</a>
                        <br>
                        <a class="btn btn-dark" href="#" >Mi Perfil</a>
                        <br>
                        <a class="btn btn-dark" href="ServletMascota?tipo=listarMascota&id=<jsp:getProperty name="albergueBean" property ="idAlbergue"/>">Mascotas</a>
                        <br>
                        <a class="btn btn-dark" href="ServletMascota?tipo=listarSolicitudAlbergue&id=<jsp:getProperty name="albergueBean" property ="idAlbergue"/>">Solicitudes</a>
                        <br>
                        <a class="btn btn-dark" href="ServletMascota?tipo=EstadisticaMascotas&id=<jsp:getProperty name="albergueBean" property ="idAlbergue"/>">Estadistica</a>
                        <br>
                    </div>
                </div>
            </div>
            <br> 
            <br>
        </div>
    </body>
</html>




