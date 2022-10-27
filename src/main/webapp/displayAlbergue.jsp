<%-- 
    Document   : displayAlbergue
    Created on : 04/10/2022, 04:59:34 PM
    Author     : edicz
--%>

<%@page import="Entidad.Albergue"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    Albergue emp = (Albergue) request.getAttribute("albergue");
%>

<jsp:useBean id="albergueBean" class="JavaBeans.AlbergueBean" scope="session"></jsp:useBean>   
<jsp:setProperty name="albergueBean" property ="idAlbergue" value="<%=emp.getIdAlbergue()%>"/>    
<jsp:setProperty name="albergueBean" property ="nombreAlbergue" value="<%=emp.getNombreAlbergue()%>" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style = "font-family: Lucida Bright,Georgia,serif;">
        <div class="container-fluid d-grid gap-3 align-items-center">
            <%@include file="/header.jsp"%>
                        
            <div class="row">
                <div class="col-3"><%@include file="/menuAlbergue.jsp"%></div>
                <div class="col-9"></div>
            </div>
            
            <%@include file="/footer.jsp"%>
        </div>
    </body>
</html>
