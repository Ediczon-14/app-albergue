<%-- 
    Document   : test2
    Created on : 07/10/2022, 09:50:26 AM
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
                    <h2 class="text-center">Test – Temperamento</h2>
                    <form action="ServletTest">
                        <input type="hidden" name="tipo" value="test2" >
                        <div class="form-group">
                            <h5 class="text-dark">1. ¿Qué haces cuando tu mamá te envía a hacer algún deber que odias?</h5>
                            <select name="pregunta1" class="form-select" multiple required>
                                <option value="40">○ Le digo que prefiero realizar otra tarea</option>
                                <option value="30">○ Lo hago porque es una responsabilidad que se me otorgó</option>
                                <option value="20">○ Lo hago, pero me tomaré mi tiempo para comenzar</option>
                                <option value="10">○ Le digo que lo haré, pero no lo hago</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <h5 class="text-dark">2. ¿Cómo reaccionas cuando alguien da una opinión con la que no estás de acuerdo?</h5>
                            <select name="pregunta2" class="form-select" multiple required>
                                <option value="40">○ Escucho con atención porque es obvio que pensamos diferente</option>
                                <option value="30">○ Externo mi punto de vista para hacerlo cambiar de opinión</option>
                                <option value="20">○ No digo nada pero mis gestos demuestran que me parece una opinión equivocada</option>
                                <option value="10">○ Hago un comentario irónico para demostrar por qué está equivocado</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <h5 class="text-dark">3. ¿Te consideras una persona rencorosa?</h5>
                            <select name="pregunta3" class="form-select" multiple required>
                                <option value="40">○ Para nada</option>
                                <option value="30">○ Muy poco, solo en casos muy específicos</option>
                                <option value="20">○ Sí, pero no tanto. Depende de la situación</option>
                                <option value="10">○ Sí, bastante</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <h5 class="text-dark">4. Un amigo tuyo pide tu ayuda para lograr algo pero eso requerirá mucho de tu tiempo y esfuerzo. Tu respuesta seguramente será:</h5>
                            <select name="pregunta4" class="form-select" multiple required>
                                <option value="40">○ Le explico que trataré de ayudar en la medida que sea posible y así lo hago</option>
                                <option value="30">○ Una negativa contundente</option>
                                <option value="20">○ Acepto, pero eso no significa que lo haga</option>
                                <option value="10">○ No le digo concretamente ‘sí’ o ‘no’</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <h5 class="text-dark">5. Un proyecto en el que habías trabajado falla de forma repentina, ¿qué haces?</h5>
                            <select name="pregunta5" class="form-select" multiple required>
                                <option value="40">○ Trato de reflexionar en qué me pude haber equivocado para reparar el error</option>
                                <option value="30">○ Pido una opinión externa para determinar lo que debería hacer</option>
                                <option value="20">○ Trato de solucionarlo pero probablemente no me enfoque en hacerlo</option>
                                <option value="10">○ Pienso que seguramente tengo muy mala suerte para que me ocurra esto</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <h5 class="text-dark">6. Imagina que debes hacer un trabajo en equipo muy interesante, ¿cómo te sientes?</h5>
                            <select name="pregunta6" class="form-select" multiple required>
                                <option value="40">○ Quiero aprender algo nuevo a través de este trabajo</option>
                                <option value="30">○ Espero tener tareas donde pueda mostrar mis habilidades</option>
                                <option value="20">○ Aceptaré las propuestas de otros para no tener que hacerme cargo de nada complicado</option>
                                <option value="10">○ Quiero tener tareas importantes, para ser quien más brille</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <h5 class="text-dark">7. Has dejado de hablar con un amigo, ¿cómo te acercas nuevamente?</h5>
                            <select name="pregunta7" class="form-select" multiple required>
                                <option value="40">○ Le envío un mensaje divertido para comenzar una plática casual</option>
                                <option value="30">○ Le pregunto cómo ha estado estos días</option>
                                <option value="20">○ Le digo que ahora quiere más a otro de sus amigos que a mí</option>
                                <option value="10">○ Le pregunto por qué ha dejado de quererme</option>
                            </select>
                        </div>
                        <br>
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
