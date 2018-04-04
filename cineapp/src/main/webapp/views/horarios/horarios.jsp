<%-- 
    Document   : horarios
    Created on : 3/04/2018, 10:01:15 AM
    Author     : negocios_digitales
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cineapp - Horarios</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        <spring:url value="/resources" var="urlPublic"></spring:url>
    </head>
    <body>
        
        <!--   Menu  -->
        <nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
            <a class="navbar-brand" href="#">CineApp | Administración</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="inicio">Inicio<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="empleados">Empleados <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="peliculas">Peliculas <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="horarios">Horarios <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="noticias">Noticias <span class="sr-only">(current)</span></a>
                    </li>                    
                    <li class="nav-item">
                        <a class="nav-link" href="salir">Salir</a>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- Fin menu -->
        
        <div class="card">
            <div class="card-header">Lista de horarios &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="/cineapp/horarios/create" class="btn btn-success" role="button" title="nuevoEmpleado">Agregar horario</a>
            </div>
            <div class="card-body">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Pelicula</th>
                            <th>Fecha</th>
                            <th>Hora</th>
                            <th>Sala</th>
                            <th>Precio</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${ horarios }" var="horarios"> 
                            <tr>
                                <td></td>
                                <td>${ horarios.fecha }</td>
                                <td>${ horarios.hora } </td>
                                <td></td>
                                <td></td>
                                <td>X X</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        
        <!-- FOOTER -->
            <footer>
                <p class="pull-right">
                </p>
                <p>
                    © 2018 My CineSite, Inc. | Aplicación desarrollada con Spring 5.0 | Autor: Jesús Martín García Ramírez | · <a href="#">Privacy</a>
                    · <a href="#">Terms</a>
                </p>
            </footer>
    </body>
</html>
