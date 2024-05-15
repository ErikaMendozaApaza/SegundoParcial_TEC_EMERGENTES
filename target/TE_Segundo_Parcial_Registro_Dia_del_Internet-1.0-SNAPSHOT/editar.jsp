<%@page import="com.emergentes.modelo.Producto"%>
<%
    Producto item = (Producto) request.getAttribute("miProducto");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%= (item.getId() == 0)? "Nuevo" : "Editar" %></h1>
        <form action="MainController" method="post">
            <input type="hidden" name="id" value="<%= item.getId()%>"/>
            <table>
                <tr>
                    <td>Nombre</td>
                    <td><input type="text" name="nombre" value="<%= item.getDescripcion()%>"/></td>
                </tr>
                <tr>
                    <td>Apellido</td>
                    <td><input type="number" name="apellido" min=0 value="<%= item.getCantidad()%>"/></td>
                </tr>
                <tr>
                    <td>Seminario</td>
                    <td><input type="number" name="seminario" step=0.10 min=0 value="<%= item.getPrecio()%>"/></td>
                </tr>
                <tr>
                    <td>Confirmo</td>
                    <td><input type="text" name="confirmo" value="<%= item.getCategoria()%>"/></td>
                </tr>
                <tr>
                    <td>Fecha inscripcion</td>
                    <td><input type="text" name="fecha inscripcion" value="<%= item.getCategoria()%>"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Enviar"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
