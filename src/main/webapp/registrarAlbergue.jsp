<%-- 
    Document   : registrarAlbergue
    Created on : 03/10/2022, 06:39:19 PM
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
            <br>
            <div class="row">
                <div class="col-3">                   
                </div>
                <div class="col-6 card ">
                    <h1 class="text-center">Registrar Albergue</h1>
                    <hr><br>
                    <div class="form-group" >
                        <form action="ServletAlbergue">
                            <input type="hidden" name="tipo" value="registrarAlbergue">	
                            <table>
                                <div class="form-group">
                                    <label>Nombre de Albergue</label>
                                    <input type="text" name="nombreAlbergue" required class="form-control" id="exampleFormControlInput1">
                                </div>
                                <div class="form-group">
                                    <label>Correo</label>
                                    <input type="email" name="correoAlbergue" required class="form-control" id="exampleFormControlInput1">
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" name="passwordAlbergue" required class="form-control" oninput="maxLengthCheck(this)" maxlength="9" min="0" max="999999999">
                                </div>
                                <div class="form-group">
                                    <label>Telefono</label>
                                    <input type="number" name="telefonoAlbergue" required class="form-control" oninput="maxLengthCheck(this)" maxlength="9" min="0" max="999999999">
                                </div>
                                <div class="form-group">
                                    <label>Direccion</label>
                                    <input type="text" name="direccionAlbergue" required class="form-control" id="exampleFormControlInput1">
                                </div>
                                <div class="form-group">
                                    <label for="longitud">Longitud</label>
                                    <input type="text" id="longitud" name="longitud" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label for="latitud">Latitud</label>
                                    <input type="text" id="latitud" name="latitud" class="form-control" >
                                </div>
                                <br>
                                <div>
                                    <div id="mapa" style="width: 100%; height: 500px;"></div>
                                </div>
                                <script>
                                    function initMap()
                                    {
                                        var longitud = -71.53652249220312;
                                        var latitud = -16.40981511995887;
                                        
                                        coordenas ={
                                            lng: longitud,
                                            lat: latitud
                                        }
                                        generarMapa(coordenas);
                                    }
                                    
                                    function generarMapa(coordenadas)
                                    {
                                        var mapa = new google.maps.Map(document.getElementById('mapa'),
                                        {
                                            zoom: 12,
                                            center: new google.maps.LatLng(coordenadas.lat, coordenadas.lng)
                                        });
                                        marcador = new google.maps.Marker({
                                            map: mapa,
                                            draggable: true,
                                            position: new google.maps.LatLng(coordenadas.lat, coordenadas.lng)
                                        });
                                         marcador.addListener('dragend',function(event){
                                            document.getElementById("latitud").value = this.getPosition().lat();
                                            document.getElementById("longitud").value = this.getPosition().lng();
                                         })
                                        
                                    }
                                </script>
                                <br>
                                <input type="submit" value="Registrar Albergue" class="btn btn-dark form-control" >
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
            
            <br>
            <%@include file="/footer.jsp"%>
            <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap&v=weekly&channel=2"></script>
        </div>
    </body>
</html>
