<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.emergentes.modelo.Usuario"%>
<%
    List<Usuario> usuarios = (List<Usuario>)request.getAttribute("usuarios");
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
        <section  class="listado">
        <h5>Usuarios</h5>
        <table>
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Clave</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="item" items="${usuarios}">
              <tr>
                <td>${item.id}</td>
                <td>${item.nombre}</td>
                <td>${item.correo}</td>
                <td>${item.clave}</td>
                <td><a href="UsuarioController?action=edit&id=${item.id}">Editar</a></td>
                <td><a href="UsuarioController?action=delete&id=${item.id}">Eliminar</a></td>
            </tr>              
            </c:forEach>
        </table>
        <br>
        <input class=botons type="button" onclick="location.href='UsuarioController?action=add';" value="Nuevo" />
        <input class=botons type="button" onclick="location.href='index.html';" value="Atras" />
        </section>
    </body>
</html>
