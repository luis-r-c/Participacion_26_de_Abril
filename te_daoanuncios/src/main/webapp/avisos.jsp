<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.emergentes.modelo.Aviso"%>
<%
    List<Aviso> avisos = (List<Aviso>)request.getAttribute("avisos");
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
            <h5>Listado de avisos</h5>
            <table border="1">
                <tr>
                    <th>Id</th>
                    <th>Titulo</th>
                    <th>Contenido</th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach var="item" items="${avisos}">
                  <tr>
                    <td>${item.id}</td>
                    <td>${item.titulo}</td>
                    <td>${item.contenido}</td>
                    <td><a href="AvisoController?action=edit&id=${item.id}">Editar</a></td>
                    <td><a href="AvisoController?action=delete&id=${item.id}">Eliminar</a></td>
                </tr>              
                </c:forEach>
            </table>
            <br>
            <input class=botons type="button" onclick="location.href='AvisoController?action=add';" value="Nuevo" />
            <input class=botons type="button" onclick="location.href='index.html';" value="Atras" />
        </section>
    </body>
</html>
