<%-- 
    Document   : test3
    Created on : 07/10/2022, 09:50:33 AM
    Author     : edicz
--%>
<%@page import="Entidad.Usuario"%>
<%@page import="Entidad.Albergue"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style = "font-family: Lucida Bright,Georgia,serif;">
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
                            <li><a class="dropdown-item" href="#">Perfil</a></li>
                            <li><a class="dropdown-item" href="ServletMascota?tipo=listarSolicitud&id=<%=a2.getIdUsuario()%>">Solicitud</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="login.jsp">Salir</a></li>
                        </ul>
                    </div>
                </div>
            </header>
            <div class="container">
                <div class="row card">
                    <h2 class="text-center">Test de Compatibilidad</h2>
                    <form action="ServletTest">
                        <input type="hidden" name="tipo" value="test3" >
                        <div class="form-group">
                            <h5 class="text-dark">1. ¿Cuántas mascotas tuviste?</h5>
                            <select name="pregunta1" class="form-select" multiple required>
                                <option value="1">○ 0</option>
                                <option value="2">○ 1</option>
                                <option value="3">○ Más de 1</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <h5 class="text-dark">2. ¿Qué tamaño desea que sea su mascota?</h5>
                            <select name="tamano" class="form-select" multiple required>
                                <option value="1">○ Pequeño</option>
                                <option value="2">○ Mediano</option>
                                <option value="3">○ Grande</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <h5 class="text-dark">3. ¿Qué carácter desea que tenga la mascota?</h5>
                            <select name="caracter" class="form-select" multiple required>
                                <option value="1">○ Tímido</option>
                                <option value="2">○ Sociable</option>
                                <option value="3">○ Pasivo-agresivo.</option>
                                <option value="4">○ Independiente</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <h5 class="text-dark">4. ¿Qué tipo de pelaje desea que su mascota tenga?</h5>
                            <select name="pelaje" class="form-select" multiple required>
                                <option value="1">○ Duro</option>
                                <option value="2">○ Rizado</option>
                                <option value="3">○ Corto</option>
                                <option value="4">○ Largo</option>

                            </select>
                        </div>
                        
                        <br>
                        <div style="visibility: hidden">
                            <input type="number" value="<%=a2.getIdUsuario()%>" name="idUsuario" class="form-control form-submit" >
                        </div>
                        <div style="visibility: hidden">
                            <input type="number" value="<%=al.getIdAlbergue()%>" name="idAlbergue" class="form-control form-submit" >
                        </div>
                        <br>
                        <div class="text-center">
                            <input type="submit" value="Encontrar a mi mascota ideal" class="btn btn-dark form-control">
                        </div>
                    </form>
                    <br>
                </div>
            </div>
            <%@include file="/footer.jsp"%>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
