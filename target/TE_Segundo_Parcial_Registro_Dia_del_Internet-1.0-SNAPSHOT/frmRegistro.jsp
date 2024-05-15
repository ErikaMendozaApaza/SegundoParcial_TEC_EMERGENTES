<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario</title>
        <style>
            
            /* Estilo del encabezado */
header {
    background: #FFAFBD;  /* fallback for old browsers */
    background: -webkit-linear-gradient(to right, #ffc3a0, #FFAFBD);  /* Chrome 10-25, Safari 5.1-6 */
    background: linear-gradient(to right, #ffc3a0, #FFAFBD); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
    color: #fff; /* Color de texto blanco */
    padding: 20px;
    text-align: center; 
    border-radius: 20px;
}

/* Estilo del título principal */
.titulo-principal {
    margin-bottom: 20px;    
}

.titulo-principal h1 {
    font-size: 2.5rem;
    font-weight: bold;
}
            
            table {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #ddd; /* Grosor de 1px y color gris */
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Sombra */
            background-color: #fff;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd; /* Grosor de 1px y color gris */
        }

        th {
            background-color: #f2f2f2; /* Color de fondo para los encabezados */
        }

        .boton-nuevo {
            display: inline-block;
            padding: 10px 20px;
            background: #FFAFBD; /* fallback for old browsers */
            background: -webkit-linear-gradient(to right, #ffc3a0, #FFAFBD); /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to right, #ffc3a0, #FFAFBD); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            border: none;
            border-radius: 25px;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
            text-decoration: none;
            margin-bottom: 10px;
        }

        .boton-nuevo:hover {
            background: #FFAFBD; /* fallback for old browsers */
            background: -webkit-linear-gradient(to right, #FFAFBD, #ffc3a0); /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to right, #FFAFBD, #ffc3a0); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        }
        
        .boton-editar {
            display: inline-block;
            padding: 10px 20px;
            background: #5C258D; /* fallback for old browsers */
            background: -webkit-linear-gradient(to right, #5C258D, #4389A2); /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to right, #5C258D, #4389A2); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            border: none;
            border-radius: 25px;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
            text-decoration: none;
            margin-right: 10px;
        }

        .boton-editar:hover {
            background: #4389A2; /* fallback for old browsers */
            background: -webkit-linear-gradient(to right, #4389A2, #5C258D); /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to right, #4389A2, #5C258D); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        }

        .boton-eliminar {
            display: inline-block;
            padding: 10px 20px;
            background: #FF416C; /* fallback for old browsers */
            background: -webkit-linear-gradient(to right, #FF4B2B, #FF416C); /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to right, #FF4B2B, #FF416C); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            border: none;
            border-radius: 25px;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
            text-decoration: none;
        }

        .boton-eliminar:hover {
            background: #FF4B2B; /* fallback for old browsers */
            background: -webkit-linear-gradient(to right, #FF416C, #FF4B2B); /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to right, #FF416C, #FF4B2B); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        }
        </style>
    </head>
    <body>
        <header>
            <div class="titulo-principal">
              <h1 class=""><c:if test="${ registro.id == 0 }">Nuevo</c:if>
            <c:if test="${ registro.id != 0 }">Editar</c:if>
            Registro
        </h1>  
            </div>
        </header>        
            
            <form action="RegistroController" method="POST">
            <input type="hidden" name="id" value="${registro.id}" />
            <table>
                <tr>
                    <td>Nombre:</td>
                    <td><input type="text" name="nombre" value="${registro.nombre}" required/></td>
                </tr>
                <tr>
                    <td>Apellido:</td>
                    <td><input type="text" name="apellido" value="${registro.apellido}" required/></td>
                </tr>
                <tr>
                    <td>Seminario:</td>
                    <td><input type="text" name="seminario" value="${registro.seminario}" required/></td>
                </tr>
                <tr>
                <td>Confirmado:</td>
                <td>
                    <input type="checkbox" name="confirmado" ${registro.confirmado ? 'checked' : ''} />
                </td>
                </tr>
                <tr>
                <td>Fecha de Inscripción:</td>
                <td>
                    <input type="date" name="fecha_inscripcion" value="${registro.fecha_inscripcion}" required/>
                </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" class="boton-nuevo" /></td>
                </tr>
            </table>                
            </form>
    </body>
</html>
