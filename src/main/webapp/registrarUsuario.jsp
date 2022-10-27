<%-- 
    Document   : registrarUsuario
    Created on : 03/10/2022, 06:39:04 PM
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
            <%@include file="/header.jsp"%>
            <br><br>
            <div class="row">
                <div class="col-3">                   
                </div>
                <div class="col-6 card ">
                    <h1 class="text-center">Registrar Usuario</h1>
                    <hr><br>
                    <div class="form-group" >
                        <form action="ServletUsuario">
                            <input type="hidden" name="tipo" value="registrarUsuario">	
                            <table>
                                <div class="form-group">
                                    <label>Nombres</label>
                                    <input type="text" name="nombreUsuario" required class="form-control" id="exampleFormControlInput1">
                                </div>
                                <div class="form-group">
                                    <label>Apellidos</label>
                                    <input type="text" name="apellidoUsuario" required class="form-control" id="exampleFormControlInput1">
                                </div>
                                <div class="form-group">
                                    <label>Telefono</label>
                                    <input type="number" name="telefonoUsuario" required class="form-control" oninput="maxLengthCheck(this)" maxlength="9" min="0" max="999999999">
                                </div>
                                <div class="form-group">
                                    <label>Correo</label>
                                    <input type="email" name="correoUsuario" required class="form-control" id="exampleFormControlInput1">
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" name="passwordUsuario" required class="form-control" id="exampleFormControlInput1">
                                </div>
                                <div class="form-group">
                                    <label>Edad</label>
                                    <input type="number" name="edad" required class="form-control" oninput="maxLengthCheck(this)" type="number" maxlength="8" min="0" max="99999999">
                                </div>
                                <div class="form-group">
                                    <label>DNI</label>
                                    <input type="number" name="dni" required class="form-control" oninput="maxLengthCheck(this)" type="number" maxlength="8" min="0" max="99999999">
                                </div>
                                <div class="form-group">
                                    <label>Direccion</label>
                                    <input type="text" name="direccionUsuario" required class="form-control" id="exampleFormControlInput1">
                                </div>
                                <br>
                                <input type="submit" value="Registrar Usuario" class="btn btn-dark form-control" >
                                <script>
                                      // This is an old version, for a more recent version look at
                                      // https://jsfiddle.net/DRSDavidSoft/zb4ft1qq/2/
                                      function maxLengthCheck(object)
                                      {
                                        if (object.value.length > object.maxLength)
                                          object.value = object.value.slice(0, object.maxLength)
                                      }
                                </script>
                            </table><br>
                        </form>
                    </div>        
                </div> 
                <div class="col-3"></div>
            </div>
            
            <br><br>
            <%@include file="/footer.jsp"%>
        </div>
    </body>
</html>
