<%-- 
    Document   : crearHorario
    Created on : 3/04/2018, 10:17:39 AM
    Author     : negocios_digitales
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>JSP Page</title>
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
         
        
        ${ error }
        <div class="card">
            <div class="card-header">Datos del Horario</div>
            <div class="card-body">

                <form:form modelAttribute="horario" class="needs-validation" novalidate="" id="horario" action="save" method="post" >

                    <div class="form-row">
                        
                        <div class="form-group col-md-3">
                            <label for="pelicula">Pelicula:</label>
                            <form:select class="form-control" id="idPelicula" path="idPelicula">
                                <c:forEach items="${ peliculas }" var="peliculas">
                                    <form:option value="${ peliculas.idPelicula }">${ peliculas.titulo }</form:option>
                                </c:forEach>
                            </form:select>
                        </div>
                        
                        <div class="form-group col-md-3">
                            <label for="fecha">Fecha:</label>
                            <form:input type="text" class="form-control" id="fecha" path="Fecha" placeholder="7-Jun-2013" required="required"/>
                        </div>
                        
                        <div class="form-group col-md-3">
                            <label for="hora">Hora:</label>
                            <form:input type="text" class="form-control" id="hora" path="hora"/>
                        </div>
                        
                        <div class="form-group col-md-3">
                            <label for="sala">Sala:</label>
                            <form:select class="form-control" id="idSala" path="idSala">
                                <c:forEach items="${ salas }" var="salas">
                                    <form:option value="${ salas.idSala }">${ salas.nombreSala }</form:option>
                                </c:forEach>
                            </form:select>
                        </div>
                        
                    </div>
                    
                    <form:button type="submit" class="btn btn-danger">Guardar</form:button>
                <!--/form-->
                </form:form>


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
