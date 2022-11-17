<%-- 
    Document   : index
    Created on : 03/10/2022, 04:00:30 PM
    Author     : edicz
--%>

<%@page import="Entidad.Solicitud"%>
<%@page import="Entidad.Mascota"%>
<%@page import="java.util.List"%>
<%@page import="Entidad.Albergue"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style = "font-family: Lucida Bright,Georgia,serif;">
        <div class="container-fluid d-grid gap-3 align-items-center">
            <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
                <a href="#" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
                    <img class="bi me-2" width="80" height="62" src="https://thumbs.dreamstime.com/b/icono-del-logo-concepto-de-mascotas-perro-logotipo-dise%C3%B1o-vectorial-162511461.jpg">
                    
                </a>

                <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="index.jsp" class="nav-link px-2 link-secondary">Inicio</a></li>
                    <li><a href="login.jsp" class="nav-link px-2 link-dark">Adoptar</a></li>
                    <li><a href="ServletMascota?tipo=GraficoInformacion&id=4" class="nav-link px-2 link-dark">Informacion</a></li>
                    <li><a href="#" class="nav-link px-2 link-dark">Nosotros</a></li>
                </ul>

                <div class="col-md-3 text-end">
                    <a class="btn btn-outline-dark me-2" href="login.jsp">Login</a>
                    <a class="btn btn-dark" href="registrarUsuario.jsp">Sign-up</a>
                </div>
            </header>
            <main>
                <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="" aria-label="Slide 1" ></button>
                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
                        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3" class="active" aria-current="true"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item">
                            <img class="d-block w-100" src="img/b3.png" height="600" alt="First slide">
                            <div class="container">
                                <div class="carousel-caption text-dark">
                                    <h1>¿Por qué adoptar un perro?</h1>
                                    <p>Desafortunadamente sigue siendo habitual que algunos propietarios que compran un cachorro de forma impulsiva decidan abandonarlo o dejarlo en una protectora de perros cuando se dan cuenta de que convivir con él implica un compromiso importante que puede superar los 10 años, en términos de dedicación, paciencia y reestructuración de la rutina o estilo de vida adquirido.</p>
                                    <p><a class="btn btn-lg btn-outline-dark" href="https://www.purina.es/encuentra-mascota/nuevo-perro-en-casa/adopcion/por-que-adoptar-un-perro#:~:text=En%20la%20mayor%C3%ADa%20de%20los,su%20confianza%20y%20su%20autoestima.">Ver más</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="https://www.purina.es/sites/default/files/2021-12/que-perro-adopto_hero.jpg"  alt="Second slide" height="600" >
                            <div class="container">
                                <div class="carousel-caption text-light">
                                    <h1>Infórmate sobre qué perro adoptar</h1>
                                    <p>Cuando una persona, pareja o familia decide adoptar un perro, acostumbra a ponerse en contacto con la protectora, refugio, albergue o entidad sin ánimo de lucro seleccionada, para conocer los perfiles disponibles antes de elegir perro. Y suele ser habitual, sobre todo en el caso de adopción entre particulares (amigos, conocidos, etc.), que el adoptante ya tenga en mente el tipo de perro que quiere adoptar, básicamente en cuanto a tamaño (pequeño, mediano, grande) y edad (cachorro o adulto).</p>
                                    <p><a class="btn btn-lg btn-outline-light" href="https://revista.weepec.com/los-premios-treats-perros/">Ver más</a></p>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="img/b2.png"  height="600" alt="Third slide">
                            <div class="container">
                                <div class="carousel-caption text-light">
                                    <h1>Beneficios de tener un perro.</h1>
                                    <p>No es extraño que a los perros se les denomine "el mejor amigo del hombre". En Purina puedes conocer los beneficios de tener un perro y entender por qué los perros son grandes mascotas.</p>
                                    <p><a class="btn btn-lg btn-outline-light" href="https://www.purina.es/encuentra-mascota/nuevo-perro-en-casa/adoptar-un-perro/beneficios-de-tener-un-perro#:~:text=Los%20perros%20nos%20proporcionan%20una,p%C3%A9rdida%20de%20un%20ser%20querido.">Ver más</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
                <!-- Marketing messaging and featurettes
                ================================================== -->
                <!-- Wrap the rest of the page in another container to center all the content. -->
                <br>
                <div class="container marketing">
                    <!-- Three columns of text below the carousel -->
                    <div class="row">
                        <div class="col-lg-4 text-center">
                            <img class="bd-placeholder-img rounded-circle" src="https://elcomercio.pe/resizer/kdpOnVc-NEda1kybtWrNus0oQ6I=/980x528/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/M36IGMLO7NGLHNM7222HJHMQCA.jpg" width="140" height="140" alt="First slide">
                            <h2>Adoptame</h2>
                            <p>Adopta a una macota abandona mediante una evaluacion.</p>
                            <p><a class="btn btn-secondary" href="login.jsp">Adoptar »</a></p>
                        </div><!-- /.col-lg-4 -->
                        <div class="col-lg-4"></div><!-- /.col-lg-4 -->
                        <div class="col-lg-4"></div><!-- /.row -->

                    <!-- START THE FEATURETTES -->

                    <hr class="featurette-divider">

                    <div class="row featurette">
                        <div class="col-md-7">
                            <h2 class="featurette-heading">Encuentra a tu mascota ideal</h2>
                            <p class="lead">La llegada de una nueva mascota a la familia es muy emocionante, pero siempre surgen algunas dudas: ¿Cómo preparar su llegada? ¿Se llevará bien con otros animales? ¿Qué raza o mestizo encaja mejor?. En Purina® resolvemos todas tus dudas y te contamos lo que necesitas saber para que estés preparado antes de tener un nuevo perro o gato.</p>
                        </div>
                        <div class="col-md-5">
                            <img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" src="https://www.purina.es/sites/default/files/styles/ttt_image_original/public/2021-12/Hero-Small-Mobile-finding-a-pet_0.webp?itok=99pcVDEj"  width="500" height="500" aria-label="Placeholder: 500x500" alt="Third slide">
                        </div>
                    </div>

                    <hr class="featurette-divider">

                    <div class="row featurette">
                        <div class="col-md-7 order-md-2">
                            <h2 class="featurette-heading">Todo sobre perros</h2>
                            <p class="lead">Elegir tener un perro en la familia es una decisión importante, y como todas las decisiones importantes en la vida, hay que informarse antes de dar el paso. Asegúrate de que estás eligiendo el compañero de vida que más se adapta a ti y tu familia. </p>
                        </div>
                        <div class="col-md-5 order-md-1">
                            <img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" src="https://www.purina.es/sites/default/files/styles/ttt_image_690/public/2021-12/image-text-component-getting-a-dog.webp?itok=4_Qo6Jzb"  width="500" height="500" aria-label="Placeholder: 500x500" alt="Third slide">
                        </div>
                    </div>
                </div>
                    <hr class="featurette-divider">
                    <!-- /END THE FEATURETTES -->

                </div><!-- /.container -->
            </main>
            
            <footer class="row row-cols-1 row-cols-sm-2 row-cols-md-5 py-5 my-5 border-top">
                <div class="col mb-3">   
                </div>

                <div class="col mb-3">
                    <a href="/" class="d-flex align-items-center mb-3 link-dark text-decoration-none">
                        <img class="bi me-2" width="80" height="62" src="https://thumbs.dreamstime.com/b/icono-del-logo-concepto-de-mascotas-perro-logotipo-dise%C3%B1o-vectorial-162511461.jpg">
                    </a>
                    <p class="text-muted">© 2022</p>
                </div>

                <div class="col mb-3">
                    <h5>Nosotros</h5>
                    <ul class="nav flex-column">
                        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Inicio</a></li>
                    </ul>
                </div>

                <div class="col mb-3">
                    <h5>Informacion</h5>
                    <ul class="nav flex-column">
                        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Inicio</a></li>
                    </ul>
                </div>

                <div class="col mb-3">
                    <h5>Seccion</h5>
                    <ul class="nav flex-column">
                        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Inicio</a></li>
                    </ul>
                </div>
            </footer>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
