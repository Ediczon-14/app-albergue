<%-- 
    Document   : catalogo
    Created on : 05/10/2022, 10:40:57 AM
    Author     : edicz
--%>

<%@page import="Entidad.Albergue"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="Entidad.Mascota"%>

<%
    List<Mascota> da= (List<Mascota>)request.getAttribute("data");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style = "font-family: Lucida Bright,Georgia,serif;">
        <% 
            Albergue emp = (Albergue) request.getAttribute("data2");
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
                    <h1>Catalogo</h1>
                    <hr>
                    <form action="ServletMascota">
                        <input type="hidden" name="id" value="<%=emp.getIdAlbergue()%>" >	
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link text-dark active" href="ServletMascota?tipo=listarMascota&idMascota=<%=emp.getIdAlbergue()%>&idAlbergue=<%=emp.getIdAlbergue()%>">Catalogo</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-dark" href="ServletMascota?tipo=listarCaracteristicas&idAlbergue=<%=emp.getIdAlbergue()%>">Agregar Mascota</a>
                            </li>
                        </ul>
                        <div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3">
                        <%
                            if(da!=null)
                                {
                                    for(Mascota a:da)
                                        {
                                            if(a.getEstado()==1)
                                            {
                        %>
                                                <div class="col"><br>
                                                    <div class="card" style="width: 11rem;">
                                                        <img class="card-img-top" width="159" height="212"  src="<%=a.getFoto()%>"  alt="Card image cap">
                                                        <div class="card-body">
                                                            <h5 class="card-title"><%=a.getNombreMascota()%></h5>
                                                            <%-- <p class="card-text"><%=a.get()%>-<%=a.getUnidadDeMedida()%></p>
                                                            <p class="card-text"><%=a.getMarcaProducto()%></p> --%>
                                                            <%--<a href="ServletMascota?tipo=buscarMascota&id=<%=a.getIdMascota()%>" class="btn btn-outline-info my-2 my-sm-0">Actualizar</a>
                                                            <hr>--%>
                                                            <div>
                                                                <a href="ServletMascota?tipo=eliminarMascota&idAlbergue=<%=a.getIdAlbergue()%>&idMascota=<%=a.getIdMascota()%>" class="btn btn-outline-dark my-2 my-sm-0">Eliminar</a>
                                                            </div>
                                                            <div>
                                                                <a href="ServletMascota?tipo=modificarMascota&idAlbergue=<%=a.getIdAlbergue()%>&idMascota=<%=a.getIdMascota()%>" class="btn btn-outline-dark my-2 my-sm-0">Ocultar</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                        <%
                                            }else{}
                                        }
                                }
                        %>
                        </div>
                    </form> 
                </div><br><br>    
            </div>
            <br> 
            <br>
            <br>
            <%@include file="/footer.jsp"%>
        </div>
    </body>
</html>
