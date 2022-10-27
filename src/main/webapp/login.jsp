<%-- 
    Document   : login
    Created on : 03/10/2022, 06:28:13 PM
    Author     : edicz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body style = "font-family: Lucida Bright,Georgia,serif;">
        <div class="container-fluid d-grid gap-3 align-items-center">
            <%@include file="/header.jsp"%>
            <br><br><br><br>
            <div class="row align-items-center sidebar" >
                <%
                    String x=(String) request.getAttribute("mensaje");
                    String a="";
                    if(x!=null)
                        a=x;
                %> 
                <div class="col-sm text-center"></div>
                <div class="col-sm text-center">
                    <div class="card">

                        <div class="card-header">
                            <h4>Iniciar Sesion</h4>
                        </div>
                        <div >
                            <ul class="nav nav-tabs">
                                <li class="nav-item">
                                  <a class="nav-link active text-dark" href="login.jsp">Usuario</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link text-dark" href="loginAlbergue.jsp">Albergue</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card-doby">
                            <br>
                            <br>
                            <div class="d-flex justify-content-center form_container">
                                <form method="post" action="ServletSesion">
                                    <input type="hidden" name="tipo" value="sesionUsuario">	
                                    <div class="input-group mb-3" id="busqueda-cerrar">
                                        <div class="input-group-append">
                                            <span class="input-group-text busqueda-etiqueta"><i class="fas fa-user"></i></span>
                                        </div>
                                        <input type="email" name="txtlogin" class="form-control input_user form-submit" value="" placeholder="Correo">
                                    </div>
                                    <div class="input-group mb-2" id="busqueda-cerrar">
                                        <div class="input-group-append">
                                            <span class="input-group-text"><i class="fas fa-key"></i></span>
                                        </div>
                                        <input type= "password" name="txtpass" class="form-control form-submit input_pass" value="" placeholder="Contraseña">
                                    </div>
                                    <div class="container-login100-form-btn">
                                        <div class="wrap-login100-form-btn">
                                            <input type="submit" id="busqueda-submit"  class="btn btn-dark me-2" value="Iniciar" />
                                             
                                        </div>
                                        <br>
                                        <div class="wrap-login100-form-btn">
                                            <p align="center" ><a href="registrarUsuario.jsp" class="btn btn-dark me-2">Registrar</a>
                                            <h5 align="center"><%=a %></h5>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="card-footer"><br></div>
                    </div>
                </div>
                <div class="col-sm text-center"></div>
            </div>
            <br><br><br><br>
            <%@include file="/footer.jsp"%>
        </div>
    </body>
</html>
