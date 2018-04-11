<%-- 
    Document   : peliculas
    Created on : 27/03/2018, 05:16:02 PM
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
        <title>Bienvenido a cineapp</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
        <spring:url value="/resources" var="urlPublic"></spring:url>
    </head>
    <body>
        
        <!--   Menu  -->
        <nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
            <a class="navbar-brand" href="#">Cine App | Administración</a>
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
            <div class="card-header">Lista de películas &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="#" class="btn btn-success" role="button" title="nuevoEmpleado">Agregar película</a>
            </div>
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
                            <th>Opciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${ peliculas }" var="pelicula">
                            <tr>
                                <td>${ pelicula.idPelicula }</td>
                                <td>${ pelicula.titulo }</td>
                                <td>${ pelicula.duracion } min.</td>
                                <td>${ pelicula.clasificacion }</td>
                                <td>${ pelicula.genero }</td>
                                <td><img src="../img/${pelicula.imagen}"></td>
                                <td><fmt:formatDate value="${pelicula.fechaEstreno}" pattern="dd/MM/yyyy"/></td>
                                <td>
                                    
                                    <c:choose>
                                        <c:when test="${ pelicula.estatus == 'Activa'}">
                                            <span class="badge badge-success">ACTIVA</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-danger">INACTIVA</span>
                                        </c:otherwise>
                                    </c:choose>
                                    
                                </td>
                                <td>
                                    <a href="#" class="btn btn-success btn-sm" role="button" title="Edit"><span><i class="fas fa-pencil-alt fa-lg"></i></span></a> 
                                    <a href="#" onclick="return confirm(&quot;¿Estas seguro?&quot;)" class="btn btn-danger btn-sm" role="button" title="Eliminar"><span><i class="far fa-trash-alt fa-lg"></i></span></a>
                                </td>
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
