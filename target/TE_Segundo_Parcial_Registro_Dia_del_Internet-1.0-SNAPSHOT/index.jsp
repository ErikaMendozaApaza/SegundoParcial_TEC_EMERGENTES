<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registro Dia del Internet</title>
    <link rel="stylesheet" href="css/estilo.css">
    <style>

.container {
    background-color: #f8f8f8; /* Color de fondo claro */
    font-family: Arial, sans-serif; /* Fuente predeterminada */
    margin: 0 auto; /* Centrar el contenedor en la página */
    padding: 20px; 
    display: grid;
    place-items: center;
}

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

/* Estilo de la información del usuario */
.informacion-usuario {
    display: flex; /* Disposición en línea para la información */
    justify-content: space-between; /* Distribuir el espacio entre los elementos */
    align-items: center; /* Alinear los elementos verticalmente */
}

.informacion-usuario h3 {
    font-size: 1.2rem; /* Tamaño de fuente mediano para la información */
    margin: 0; /* Eliminar márgenes predeterminados */
}

/* Estilo de la sección de la tabla de registros */
.tabla-registros {
  margin-top: 40px; 
}

.tabla-registros h2 {
    font-size: 2rem; 
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
    <div class="container">
        <header>
            <div class="titulo-principal">
                <h1>SEGUNDO PARCIAL TEM-742</h1>
            </div>
            <div class="informacion-usuario">
                <h3>Nombre: Erika Mendoza Apaza</h3>
                <h3>Carnet: 14402062</h3>
            </div>
        </header>

        <section class="tabla-registros">
            <h2 style="text-align: center">Registro Dia del Internet</h2>
            <a href="RegistroController?action=add" class="boton-nuevo">Nuevo Registro</a>
            <table class="tabla">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Seminario</th>
                        <th>Confirmo</th>
                        <th>Fecha_inscripcion</th>
                        <th>Editar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${registros}">
                        <tr>
                            <td>${ item.getId() }</td>
                            <td>${ item.getNombre() }</td>
                            <td>${ item.getApellido() }</td>
                            <td>${ item.getSeminario() }</td>
                            <td>
                                <input type="checkbox" readonly ${item.confirmado ? 'checked' : ''} />
                            </td>
                            <td>${ item.getFecha_inscripcion() }</td>
                            <td><a class="boton-editar" href="RegistroController?action=edit&id=${ item.getId() }">Editar</a></td>
                            <td><a class="boton-eliminar" href="RegistroController?action=delete&id=${ item.getId() }" onclick="return confirm('¿Estás seguro de eliminar el registro?');">Eliminar</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>            
        </section>
    </div>
</body>
</html>
