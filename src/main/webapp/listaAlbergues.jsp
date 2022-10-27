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
            <%@include file="/menuUsuario.jsp"%>
            
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
                                    <select name="id" class="form-select" required>
                                        <%
                                            
                                            if(da!=null)
                                            {
                                                for(Albergue a:da)
                                                {
                                        %>
                                            <option value="<%=a.getIdAlbergue()%>"><%=a.getNombreAlbergue()%> - <%=a.getDireccionAlbergue()%></option>
                                                <jsp:setProperty name="aBean" property ="idAlbergue" value="<%=a.getIdAlbergue()%>"/>    
                                                <jsp:setProperty name="aBean" property ="nombreAlbergue" value="<%=a.getNombreAlbergue()%>" />
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
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
    </body>
</html>
