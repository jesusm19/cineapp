<%-- 
    Document   : empleados
    Created on : 27/03/2018, 03:31:09 PM
    Author     : negocios_digitales
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>CineApp - Empleados</title>
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
            <div class="card-header">Lista de empleados &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="#" class="btn btn-success" role="button" title="nuevoEmpleado">Nuevo empleado</a>
            </div>
            
            <div class="card-body">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nombre</th>
                            <th>Apellidos</th>
                            <th>Usuario</th>
                            <th>Email</th>
                            <th>Estatus</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${ empleados }" var="empleados">
                            <tr>
                                <td>${ empleados.idUsuario }</td>
                                <td>${ empleados.primerNombre } ${ empleados.segundoNombre }</td>
                                <td>${ empleados.primerApellido } ${ empleados.segundoApellido }</td>
                                <td>${ empleados.usuario }</td>
                                <td>${ empleados.email }</td>
                                <td>
                                    
                                    <c:choose>
                                        <c:when test="${ empleados.estatus == 'Activo'}">
                                            <span class="badge badge-success">ACTIVO</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-danger">INACTIVO</span>
                                        </c:otherwise>
                                    </c:choose>
                                    
                                </td>
                                <td>X  X</td>
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
