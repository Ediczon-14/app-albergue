<%-- 
    Document   : test3
    Created on : 07/10/2022, 09:50:33 AM
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
                            <input type="number" value="<jsp:getProperty name="aBean" property ="idAlbergue"/>" name="id" class="form-control form-submit" >
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
    </body>
</html>
