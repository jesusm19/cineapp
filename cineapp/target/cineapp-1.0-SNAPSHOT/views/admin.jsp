<%-- 
    Document   : admin
    Created on : 27/03/2018, 01:45:34 PM
    Author     : negocios_digitales
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        
        <div class="container theme-showcase" role="main">

            <div class="jumbotron">        
                <h3>Administración del Sistema</h3>
                <p>Bienvenido(a) ${ nombre } (Editor de My CineSite) </p>
            </div>

            <!-- FOOTER -->
            <footer>
                <p class="pull-right">
                    <a href="#">Back to top</a>
                </p>
                <p>
                    © 2018 My CineSite, Inc. | Aplicación desarrollada con Spring 5.0 | Autor: Jesús Martín García Ramírez | · <a href="#">Privacy</a>
                    · <a href="#">Terms</a>
                </p>
            </footer>


        </div>
    </body>
</html>
