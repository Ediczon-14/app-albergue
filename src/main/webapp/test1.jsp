<%-- 
    Document   : test1
    Created on : 06/10/2022, 04:27:13 PM
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
            <%@include file="/menuUsuario.jsp"%>
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
                            <input type="number" value="<jsp:getProperty name="aBean" property ="idAlbergue"/>" name="id" class="form-control form-submit" >
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
    </body>
</html>
