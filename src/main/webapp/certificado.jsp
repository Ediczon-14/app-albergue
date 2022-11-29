<%-- 
    Document   : certificado
    Created on : 28/11/2022, 06:59:35 PM
    Author     : edicz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Certificado de Adopcion</title>
    </head>
    <body style = "font-family: Lucida Bright,Georgia,serif;" >
        <div class="container"><br>
            <div class="row card ">
                <div class="card-body ">
                    <div class="text-center">
                        <img src="img/pie.PNG"/>
                    </div>
                    <h1 class="text-center">Certificado de Adopcion</h1>
                    <p>El presente documento certifica que la mascota de nombre <strong><%=request.getParameter("NombreMascota")%></strong> del albergue <strong><%=request.getParameter("NombreAlbergue")%></strong>
                        fue oficialmente adoptado por el Sr.<strong> <%=request.getParameter("NombreUsuario")%> <%=request.getParameter("ApellidoUsuario")%></strong> el dia <strong><%=request.getParameter("FechaAdopcion")%></strong>.
                    Por este motivo el Sr se compromete a ofrecer los cuidados que necesite el animal: proporcionarle una alimentación adecuada,
                    sacarlo de paseo, darle cobijo, tratarlo con respeto y cariño. Llevar un control sanitario,
                    visitando al veterinario para vacunaciones, desparasitaciones y cualquier enfermedad que se
                    le origine. No permitir que el animal transite libremente por la vía pública sin estar
                    acompañado por su propietario. Si es la primera vez que está a cargo de un animal,
                    procurará informarse lo mejor posible de los principios básicos a tener en cuenta para
                    ofrecerle una vida digna.</p>
                </div>
                <div class="text-center" >
                    <div class="card-body">
                        <img class="bd-placeholder-img rounded-circle text-center" src="<%=request.getParameter("FotoMascota")%>" width="140" height="140" alt="First slide">
                      <h5 class="card-title">Nombre</h5>
                      <p class="card-text"><%=request.getParameter("NombreMascota")%></p>
                    </div>
                      <div class="card-body">
                          <img class="bd-placeholder-img rounded-circle" src="https://images.vexels.com/media/users/3/201898/isolated/preview/55be9a1a39abff39bc3596e8ddd224cd-trazo-de-huella-de-perro-azul.png" width="70" height="70" alt="First slide">
                      </div>
                </div>
                    <div class="text-center">
                        <img src="img/pie.PNG"/>
                    </div>
            </div>
            <a href="javascript:window.print()" class="btn btn-dark my-2 my-sm-0 form-control"> Imprimir Certificado</a>
        </div>
        
    </body>
</html>
