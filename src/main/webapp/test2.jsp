<%-- 
    Document   : test2
    Created on : 07/10/2022, 09:50:26 AM
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
                    <h2 class="text-center">Test ??? Temperamento</h2>
                    <form action="ServletTest">
                        <input type="hidden" name="tipo" value="test2" >
                        <div class="form-group">
                            <h5 class="text-dark">1. ??Qu?? haces cuando tu mam?? te env??a a hacer alg??n deber que odias?</h5>
                            <select name="pregunta1" class="form-select" multiple required>
                                <option value="40">??? Le digo que prefiero realizar otra tarea</option>
                                <option value="30">??? Lo hago porque es una responsabilidad que se me otorg??</option>
                                <option value="20">??? Lo hago, pero me tomar?? mi tiempo para comenzar</option>
                                <option value="10">??? Le digo que lo har??, pero no lo hago</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <h5 class="text-dark">2. ??C??mo reaccionas cuando alguien da una opini??n con la que no est??s de acuerdo?</h5>
                            <select name="pregunta2" class="form-select" multiple required>
                                <option value="40">??? Escucho con atenci??n porque es obvio que pensamos diferente</option>
                                <option value="30">??? Externo mi punto de vista para hacerlo cambiar de opini??n</option>
                                <option value="20">??? No digo nada pero mis gestos demuestran que me parece una opini??n equivocada</option>
                                <option value="10">??? Hago un comentario ir??nico para demostrar por qu?? est?? equivocado</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <h5 class="text-dark">3. ??Te consideras una persona rencorosa?</h5>
                            <select name="pregunta3" class="form-select" multiple required>
                                <option value="40">??? Para nada</option>
                                <option value="30">??? Muy poco, solo en casos muy espec??ficos</option>
                                <option value="20">??? S??, pero no tanto. Depende de la situaci??n</option>
                                <option value="10">??? S??, bastante</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <h5 class="text-dark">4. Un amigo tuyo pide tu ayuda para lograr algo pero eso requerir?? mucho de tu tiempo y esfuerzo. Tu respuesta seguramente ser??:</h5>
                            <select name="pregunta4" class="form-select" multiple required>
                                <option value="40">??? Le explico que tratar?? de ayudar en la medida que sea posible y as?? lo hago</option>
                                <option value="30">??? Una negativa contundente</option>
                                <option value="20">??? Acepto, pero eso no significa que lo haga</option>
                                <option value="10">??? No le digo concretamente ???s????? o ???no???</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <h5 class="text-dark">5. Un proyecto en el que hab??as trabajado falla de forma repentina, ??qu?? haces?</h5>
                            <select name="pregunta5" class="form-select" multiple required>
                                <option value="40">??? Trato de reflexionar en qu?? me pude haber equivocado para reparar el error</option>
                                <option value="30">??? Pido una opini??n externa para determinar lo que deber??a hacer</option>
                                <option value="20">??? Trato de solucionarlo pero probablemente no me enfoque en hacerlo</option>
                                <option value="10">??? Pienso que seguramente tengo muy mala suerte para que me ocurra esto</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <h5 class="text-dark">6. Imagina que debes hacer un trabajo en equipo muy interesante, ??c??mo te sientes?</h5>
                            <select name="pregunta6" class="form-select" multiple required>
                                <option value="40">??? Quiero aprender algo nuevo a trav??s de este trabajo</option>
                                <option value="30">??? Espero tener tareas donde pueda mostrar mis habilidades</option>
                                <option value="20">??? Aceptar?? las propuestas de otros para no tener que hacerme cargo de nada complicado</option>
                                <option value="10">??? Quiero tener tareas importantes, para ser quien m??s brille</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <h5 class="text-dark">7. Has dejado de hablar con un amigo, ??c??mo te acercas nuevamente?</h5>
                            <select name="pregunta7" class="form-select" multiple required>
                                <option value="40">??? Le env??o un mensaje divertido para comenzar una pl??tica casual</option>
                                <option value="30">??? Le pregunto c??mo ha estado estos d??as</option>
                                <option value="20">??? Le digo que ahora quiere m??s a otro de sus amigos que a m??</option>
                                <option value="10">??? Le pregunto por qu?? ha dejado de quererme</option>
                            </select>
                        </div>
                        <br>
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
