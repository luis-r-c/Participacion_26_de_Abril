<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.emergentes.modelo.Usuario"%>
<%
    Usuario usuario = (Usuario) request.getAttribute("usuario");
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
            <form action="UsuarioController" method="post">
                <input type="hidden" name="id" value="${usuario.id}" />
                <label>NOMBRE:</label>
                <input class="controls" type="text" name="nombre" placeholder="Ingrese su nombre" value="${usuario.nombre}" />
                <label>CORREO:</label>
                <input class="controls" type="text" name="correo" placeholder="Ingrese su correo" value="${usuario.correo}"/>
                <label>CLAVE:</label>
                <input class="controls" type="text" name="clave" placeholder="Ingrese su clave" value="${usuario.clave}" />
                <input class=botons type="submit" value="Guardar">
                <button class=botons type="cancel" onclick="window.location='UsuarioController?';return false;">Cancel</button>
            </form>            
        </section>
    </body>
</html>
