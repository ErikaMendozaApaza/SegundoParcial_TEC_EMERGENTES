
<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Producto"%>
<%
    ArrayList<Registro> lista = (ArrayList<Registro>) session.getAttribute("listapro");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="estilo.css">
    </head>
    <body>
        
        <div style="align-items: center">

            <h3>SEGUNDO PARCIAL TEM-742</h3>
            <h3>Nombre: Erika Mendoza Apaza</h3>
            <h3>Carnet: 14402062</h3>

        </div>
        <h1 style="text-align: center">Registro Dia del Internet</h1>
        <table border="1" style="margin: 0 auto;">
            <caption style="text-align:left"><a href="MainController?op=nuevo">Nuevo</a></caption>
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Seminario</th>
                <th>Confirmo</th>
                <th>Fecha inscripcion</th>
            </tr>
            <%
                if(lista != null){
                    for(Registro item : lista){
            %>
            <tr>
                <td><%= item.getId()%></td>
                <td><%= item.getDescripcion()%></td>
                <td><%= item.getCantidad()%></td>
                <td><%= item.getPrecio()%></td>
                <td><%= item.getCategoria()%></td>
                <td><a href="MainController?op=editar&id=<%= item.getId()%>">Editar</a> </td>
                <td><a href="MainController?op=eliminar&id=<%= item.getId()%>"
                       onclick = ' return confirm("Estas seguro de eliminar el registro ?");'>Eliminar</a></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </body>
</html>
