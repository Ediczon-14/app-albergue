<%-- 
    Document   : registrarMascota
    Created on : 06/10/2022, 02:20:38 PM
    Author     : edicz
--%>
<%@page import="Entidad.Albergue"%>
<%@page import="java.util.List"%>
<%@page import="Entidad.Caracter"%>
<%@page import="Entidad.Pelaje"%>
<%@page import="Entidad.Sexo"%>
<%@page import="Entidad.Tamano"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style = "font-family: Lucida Bright,Georgia,serif;">
        <% 
            Albergue emp = (Albergue) request.getAttribute("data5");
        %>
        <div class="container-fluid d-grid gap-3 align-items-center">
            <%@include file="/header.jsp" %>
            
            <div class="row">
                <div class="col-3">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-sm text-center card">
                                <img class="d-block w-100" src="https://cdn.create.vista.com/api/media/small/475557848/stock-vector-animal-house-shelter-canine-flat" width="120" height="300">
                            </div>
                        </div><br>
                        <div class="row align-items-center">
                            <div class="col-sm text-center card" id="busqueda-cerrar">
                                <span class="busqueda-etiqueta text-dark"><%=emp.getNombreAlbergue()%></span>
                            </div>
                        </div><br>
                        <div class="row align-items-center">
                            <div class="col-sm text-center card">
                                <br>
                                <div>
                                    <a class="btn btn-dark my-2 my-sm-0 form-control" href="loginAlbergue.jsp">Cerrar Sesion</a>
                                </div>
                                <br>
                                <div>
                                    <a class="btn btn-dark my-2 my-sm-0 form-control" href="#" >Mi Perfil</a>
                                </div>
                                <br>
                                <div>
                                    <form action="ServletMascota">
                                        <input type="hidden" name="tipo" value="listarMascota">
                                        <div class="form-group" style="display: none">
                                            <input type="number" name="idMascota" required class="form-control" value="<%=emp.getIdAlbergue()%>">
                                        </div>
                                        <div class="form-group" style="display: none">
                                            <input type="number" name="idAlbergue" required class="form-control" value="<%=emp.getIdAlbergue()%>">
                                        </div>
                                        <input type="submit" value="Mascotas" class="btn btn-dark my-2 my-sm-0 form-control">                                                            
                                    </form>
                                </div>
                                <br>
                                <div>
                                    <form action="ServletMascota">
                                        <input type="hidden" name="tipo" value="listarSolicitudAlbergue">
                                        <div class="form-group" style="display: none">
                                            <input type="number" name="idAlbergue" required class="form-control" value="<%=emp.getIdAlbergue()%>">
                                        </div>
                                        <input type="submit" value="Solicitudes" class="btn btn-dark my-2 my-sm-0 form-control">                                                            
                                    </form>
                                </div>
                                <br>
                                <div>
                                    <form action="ServletMascota">
                                        <input type="hidden" name="tipo" value="EstadisticaMascotas">
                                        <div class="form-group" style="display: none">
                                            <input type="number" name="idAlbergue" required class="form-control" value="<%=emp.getIdAlbergue()%>">
                                        </div>
                                        <input type="submit" value="Estadistica" class="btn btn-dark my-2 my-sm-0 form-control">                                                            
                                    </form>
                                </div>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-8 card text-center">
                    <h1>Agregar Mascota</h1>
                    <hr>
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="javascript: history.go(-1)">Catalogo</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark active" href="ServletMascota?tipo=listarCaracteristicas">Agregar Mascota</a>
                        </li>
                    </ul>
                    <div class="col-sm card">
                        <hr>
                        <div class="form-group" >
                            <form action="ServletMascota">
                                <input type="hidden" name="tipo" value="registrarMascota">	
                                <table>
                                    <div class="form-group">
                                        <label>Nombre</label>
                                        <input type="text" name="nombreMascota" required class="form-control" id="exampleFormControlInput1">
                                    </div>
                                    <div class="form-group">
                                        <label>Foto</label>
                                        <input type="text" name="foto" required class="form-control" id="exampleFormControlInput1">
                                    </div>
                                    <div class="form-group">
                                        <label>Meses</label>
                                        <input type="number" name="meses" required class="form-control" id="exampleFormControlInput1">
                                    </div>
                                    <div class="form-group">
                                        <label>Color</label>
                                        <input type="text" name="color" required class="form-control" id="exampleFormControlInput1">
                                    </div>
                                    <div class="form-group">
                                        <label>Caracter</label>
                                        <select name="idCaracter" class="form-select" required>
                                            <%
                                                List<Caracter> da= (List<Caracter>)request.getAttribute("data");
                                                if(da!=null)
                                                {
                                                    for(Caracter a:da)
                                                    {
                                            %>
                                                <option value="<%=a.getIdCaracter()%>"><%=a.getCaracter()%></option>
                                            <%
                                                    }
                                                }
                                            %>
                                            </select>
                                    </div>
                                            <div class="form-group">
                                        <label>Pelaje</label>
                                        <select name="idPelaje" class="form-select" required>
                                            <%
                                                List<Pelaje> da1= (List<Pelaje>)request.getAttribute("data2");
                                                if(da1!=null)
                                                {
                                                    for(Pelaje a:da1)
                                                    {
                                            %>
                                                <option value="<%=a.getIdPelaje()%>"><%=a.getPelaje()%></option>
                                            <%
                                                    }
                                                }
                                            %>
                                            </select>
                                    </div>
                                            <div class="form-group">
                                        <label>Sexo</label>
                                        <select name="idSexo" class="form-select" required>
                                            <%
                                                List<Sexo> da2= (List<Sexo>)request.getAttribute("data3");
                                                if(da2!=null)
                                                {
                                                    for(Sexo a:da2)
                                                    {
                                            %>
                                                <option value="<%=a.getIdSexo()%>"><%=a.getSexo()%></option>
                                            <%
                                                    }
                                                }
                                            %>
                                            </select>
                                    </div>
                                            <div class="form-group">
                                        <label>Tamaño</label>
                                        <select name="idTamano" class="form-select" required>
                                            <%
                                                List<Tamano> da3= (List<Tamano>)request.getAttribute("data4");
                                                if(da3!=null)
                                                {
                                                    for(Tamano a:da3)
                                                    {
                                            %>
                                                <option value="<%=a.getIdTamano()%>"><%=a.getTamano()%></option>
                                            <%
                                                    }
                                                }
                                            %>
                                            </select>
                                    </div>
                                    <div style="visibility: hidden">
                                        <input type="number" value="<%=emp.getIdAlbergue()%>" name="idAlbergue" class="form-control form-submit input_pass" >
                                    </div>
                                    <input type="submit" value="Registrar Mascota" class="btn btn-dark form-control" >
                                </table><br>
                            </form>
                        </div> 
                    </div>
                </div><br><br>    
            </div>
            <br> 
            <br>
            <br>
            <%@include file="/footer.jsp"%>
        </div>
    </body>
</html>
