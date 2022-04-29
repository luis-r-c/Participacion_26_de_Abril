<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.emergentes.modelo.Aviso"%>
<%
    Aviso aviso = (Aviso) request.getAttribute("aviso");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="Estilos.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <section  class="form-register">
            <h5>Nuevo Registro</h5>
            <form action="AvisoController" method="post">
                <input type="hidden" name="id" value="${aviso.id}" />
                <label>TITULO:</label>
                <input class="controls" type="text" name="titulo" placeholder="Ingrese su titulo" value="${aviso.titulo}" />
                <label>CONTENIDO:</label>
                <input class="controls" type="text" name="contenido" placeholder="Ingrese su contenido" value="${aviso.contenido}"/>
                <input class=botons type="submit" value="Guardar">
                <button class=botons type="cancel" onclick="window.location='AvisoController?';return false;">Cancel</button>
            </form>
        </section>
    </body>
</html>
