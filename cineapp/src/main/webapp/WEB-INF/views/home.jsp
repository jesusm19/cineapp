<%-- 
    Document   : home
    Created on : 6/03/2018, 12:31:24 PM
    Author     : negocios_digitales
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenido a cineapp</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <%--
        <ol>
            <c:forEach items="${ peliculas }" var="pelicula">
                <li> ${ pelicula }</li>
            </c:forEach>
        </ol>
        --%>
        <div class="card">
            <div class="card-header">Lista de películas</div>
            <div class="card-body">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Titulo</th>
                            <th>Duración</th>
                            <th>Clasificación</th>
                            <th>Genero</th>
                            <th>Imágen</th>
                            <th>Fecha de Estreno</th>
                            <th>Estatus</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${ peliculas }" var="pelicula">
                            <tr>
                                <td>${ pelicula.id }</td>
                                <td>${ pelicula.titulo }</td>
                                <td>${ pelicula.duracion } min.</td>
                                <td>${ pelicula.clasificacion }</td>
                                <td>${ pelicula.genero }</td>
                                <td>${ pelicula.imagen }</td>
                                <td>${ pelicula.fechaEstreno }</td>
                                <td>${ pelicula.estatus }</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>