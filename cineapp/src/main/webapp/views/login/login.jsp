<%-- 
    Document   : login
    Created on : 23/03/2018, 02:18:17 PM
    Author     : negocios_digitales
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form"
 uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>Cineapp - Login</title>
        <!--script src="/../js/validaFormulario.js"></script-->
    </head>
    <body>
        <!--   Menu  -->
        <nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
            <a class="navbar-brand" href="#">CineApp</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/cineapp">Inicio<span class="sr-only">(current)</span></a>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- Fin menu -->
        ${ error }
        <div class="card">
            <div class="card-header">Entrar al sistema</div>
            <div class="card-body">
                <form:form modelAttribute="login" class="needs-validation" novalidate="" action="cineapp/bienvenido" method="post">
                    <div class="form-group">
                        <label for="inputEmail4">Correo electrónico:</label>
                            <form:input type="email" class="form-control" id="email" path="email" placeholder="example@example.com" required="required"/>
                            <div class="invalid-feedback">
                                Campo obligatorio
                            </div>
                    </div>
                        
                    <div class="form-group">
                        <label for="inputPassword4">Contraseña:</label>
                        <form:input type="password" class="form-control" id="contrasenia" path="contrasenia" placeholder="Contraseña" required="required" />
                        <div class="invalid-feedback">
                            Campo obligatorio
                        </div>
                    </div>
                    
                    <form:button type="submit" class="btn btn-primary">Entrar</form:button>
                    <a href="cineapp/registrarse">Registrarse</a>
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
