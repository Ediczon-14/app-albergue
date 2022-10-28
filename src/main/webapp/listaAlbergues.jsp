<%-- 
    Document   : listaAlbergues
    Created on : 03/10/2022, 08:20:50 PM
    Author     : edicz
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidad.Albergue"%>
<%@page import="java.util.List"%>
<%@page import="Entidad.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    Usuario emp = (Usuario) request.getAttribute("usuario");
%>

<jsp:useBean id="usuarioBean" class="JavaBeans.UsuarioBean" scope="session"></jsp:useBean>   
    
<jsp:setProperty name="usuarioBean" property ="nombreUsuario" value="<%=emp.getNombreUsuario()%>" />
<jsp:setProperty name="usuarioBean" property ="apellidoUsuario" value="<%=emp.getApellidoUsuario()%>" />
<jsp:setProperty name="usuarioBean" property ="idUsuario" value="<%=emp.getIdUsuario()%>"/>

<% 
    Albergue emp2 = (Albergue) request.getAttribute("albergue");
%>

<jsp:useBean id="aBean" class="JavaBeans.AlbergueBean" scope="session"></jsp:useBean>   


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style = "font-family: Lucida Bright,Georgia,serif;">
        <div class="container-fluid d-grid gap-3 align-items-center">
            <%
                List<Albergue> da= (List<Albergue>)request.getAttribute("data");
                ArrayList<Albergue> ubicacion= (ArrayList<Albergue>)request.getAttribute("data");
            %>
            <%@include file="/header.jsp"%>
            <header class="p-3 mb-3 border-bottom">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0"></ul>
                    <div class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
                        <span><%=emp.getNombreUsuario()%> <%=emp.getApellidoUsuario()%></span>
                    </div>
                    <div class="dropdown text-end">
                        <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="https://us.123rf.com/450wm/martialred/martialred1608/martialred160800018/61263271-cuenta-de-usuario-perfil-del-icono-del-c%C3%ADrculo-plana-para-aplicaciones-y-sitios-web.jpg?ver=6" alt="mdo" width="32" height="32" class="rounded-circle">
                        </a>
                        <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1" style="">
                            <li><a class="dropdown-item" href="#">Perfil</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="login.jsp">Salir</a></li>
                        </ul>
                    </div>
                </div>
            </header>
            
            <div class="row">
                <div class="col-2">                   
                </div>
                <div class="col-8 card ">
                    <h1 class="text-center">Seleccion de Albergue</h1>
                    <hr>
                    <div class="form-group" >
                        <form action="ServletMascota">  
                            <input type="hidden" name="tipo" value="listarMascotaAlbergue">	
                            <div>
                                <% 
                                    
                                %>
                                <label>Bienvenido: <jsp:getProperty name="usuarioBean" property ="nombreUsuario" /> <jsp:getProperty name="usuarioBean" property ="apellidoUsuario" /></label>
                            </div>
                            <hr>
                                <div class="form-group">
                                    <label>Albergues Disponibles</label>
                                    <select name="idMascota" class="form-select" required>
                                        <%
                                            
                                            if(da!=null)
                                            {
                                                for(Albergue a:da)
                                                {
                                        %>
                                            <option value="<%=a.getIdAlbergue()%>"><%=a.getNombreAlbergue()%> - <%=a.getDireccionAlbergue()%></option>
                                            
                                            <input type="hidden" value="<%=a.getIdAlbergue()%>" name="idAlbergue" class="form-control form-submit input_pass" >
                                        <%
                                                
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                                <div style="visibility: hidden">
                                <%

                                    if(da!=null)
                                    {
                                        for(Albergue a:da)
                                        {
                                          %>  
                                                
                                <%
                                            break;
                                        }
                                    }
                                %>
                                </div>
                                    <br>
                                <script>
                                    function initMap()
                                    {
                                        var mapa = new google.maps.Map(document.getElementById('mapa'),
                                        {
                                            zoom: 13,
                                            center: { lat: -16.40804986276924, lng: -71.54277044914045}
                                        });
                                        <%
                                            if(da!=null)
                                            {
                                                for(Albergue o:ubicacion)
                                                {
                                        %>
                                                    var marker<%=o.getIdAlbergue()%> = new google.maps.Marker({
                                                        map: mapa,
                                                        draggable: false,
                                                        icon: "img/marcador.png",
                                                        animation: google.maps.Animation.DROP,
                                                        position: {lat: <%=o.getLatitud()%>, lng: <%=o.getLongitud()%>},
                                                        title: '<%=o.getNombreAlbergue()%>'
                                                    });
                                                    var mostrar=
                                                            '<form action="ServletMascota">' +
                                                                '<input type="hidden" name="tipo" value="listarMascotaAlbergue">' +
                                                                '<h4> <%=o.getNombreAlbergue()%> </h4>'+
                                                                '<div>'+
                                                                    '<input type="hidden" name="id" value="<%=o.getIdAlbergue()%>">'+
                                                                "</div>"+
                                                                '<input type="submit" value="Ver Mascotas" class="btn btn-info form-control" >'
                                                            "</form>";
                                                    var infowindow<%=o.getIdAlbergue()%>  = new google.maps.InfoWindow({
                                                        content: mostrar
                                                    })
                                                    marker<%=o.getIdAlbergue()%>.addListener("click", () => {
                                                        infowindow<%=o.getIdAlbergue()%>.open({
                                                          anchor: marker<%=o.getIdAlbergue()%>,
                                                          mapa,
                                                          shouldFocus: false
                                                        });
                                                    });
                                        <%
                                                }
                                            }
                                        %>                                    
                                    }
                                </script>
                                <div style="visibility: hidden">
                                    <input type="number" value="<%=emp.getIdUsuario()%>" name="idUsuario" class="form-control form-submit input_pass" >
                                </div>
                                <div>
                                    <div id="mapa" style="width: 100%; height: 500px;"></div>
                                </div>
                                <br>
                                <input type="submit" value="Ver Catalogo" class="btn btn-dark form-control" ><br><br>
                                
                        </form>
                    </div>        
                </div> 
                <div class="col-2"></div>
                </div>
            <br><br>
            <%@include file="/footer.jsp"%>
            <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap&v=weekly&channel=2"></script>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
