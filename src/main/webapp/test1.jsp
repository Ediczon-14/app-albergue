<%-- 
    Document   : test1
    Created on : 06/10/2022, 04:27:13 PM
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
                <div class="row card">
                    <h2 class="text-center">Test – Recursos para la tenencia de una mascota</h2>
                    <form action="ServletTest">
                        <input type="hidden" name="tipo" value="test1" >
                        <div class="form-group">
                            <h5 class="text-dark">1.¿Actualmente donde vives?</h5>
                            <select name="pregunta1" class="form-select" multiple required>
                                <option value="50">○ Casa/Departamento propio</option>
                                <option value="50">○ Casa/Departamento de un familiar</option>
                                <option value="0">○ Habitación Alquilada</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <h5 class="text-dark">2.¿Cuántos años tengo?</h5>
                            <select name="pregunta2" class="form-select" multiple required>
                                <option value="0">○ Menor de edad.</option>
                                <option value="200">○ Mayor de edad</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <h5 class="text-dark">3.¿Cuál es el espacio que tienes en casa?</h5>
                            <select name="pregunta3" class="form-select" multiple required>
                                <option value="0">○ menos de 10m</option>
                                <option value="30">○ de 10m a 50m</option>
                                <option value="50">○ de 50m a 80m</option>
                                <option value="50">○ mas de 80m</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <h5 class="text-dark">4.¿Dispones de dinero para tener un perro?</h5>
                            <select name="pregunta4" class="form-select" multiple required>
                                <option value="50">○ Si</option>
                                <option value="30">○ No</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <h5 class="text-dark">5.¿Padeces alguna enfermedad que requiera un cuidado especial?</h5>
                            <select name="pregunta5" class="form-select" multiple required>
                                <option value="0">○ Si</option>
                                <option value="50">○ No</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <h5 class="text-dark">6.¿Recibe algún tipo de ayuda economica gubernamental?</h5>
                            <select name="pregunta6" class="form-select" multiple required>
                                <option value="0">○ Si</option>
                                <option value="50">○ No</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <h5 class="text-dark">7.¿Eres tolerante a los pelos?</h5>
                            <select name="pregunta7" class="form-select" multiple required>
                                <option value="50">○ Si</option>
                                <option value="0">○ No</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <h5 class="text-dark">8.¿Dispones de tiempo para criar una mascota?</h5>
                            <select name="pregunta8" class="form-select" multiple required>
                                <option value="50">○ Si</option>
                                <option value="0">○ No</option>
                            </select>
                        </div>
                        <div style="visibility: hidden">
                            <input type="number" value="<%=a2.getIdUsuario()%>" name="idUsuario" class="form-control form-submit" >
                        </div>
                        <div style="visibility: hidden">
                            <input type="number" value="<%=al.getIdAlbergue()%>" name="idAlbergue" class="form-control form-submit" >
                        </div>
                        <br>
                        <div class="text-center">
                            <input type="submit" value="Siguiente" class="btn btn-dark form-control">
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
