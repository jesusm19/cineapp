<%-- 
    Document   : registro_usuario
    Created on : 21/03/2018, 05:52:20 PM
    Author     : negocios_digitales
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form"
 uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>Cineapp - Registro</title>
        <!--script src="/../js/validaFormulario.js"></script-->
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
        ${ error }
        <div class="card">
            <div class="card-header">Registro</div>
            <div class="card-body">

                <form:form modelAttribute="usuario" class="needs-validation" novalidate="" action="registrarUsuarios" method="post">
                    
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="primerNombre">Primer nombre:</label>
                            <form:input type="text" class="form-control" id="primerNombre" path="primerNombre" required="required"/>
                            <div class="invalid-feedback">
                                Campo obligatorio
                            </div>
                        </div>
                        
                        <div class="form-group col-md-6">
                            <label for="segundoNombre">Segundo nombre:</label>
                            <form:input type="text" class="form-control" id="segundoNombre" path="segundoNombre"/>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="primerApellido">Primer apellido:</label>
                            <form:input type="text" class="form-control" id="primerApellido" path="primerApellido" required="required"/>
                            <div class="invalid-feedback">
                                Campo obligatorio
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="segundoApellido">Segundo apellido:</label>
                            <form:input type="text" class="form-control" id="segundoApellido" path="segundoApellido"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="perfilUsuario">Perfil de usuario:</label>
                        <form:select class="form-control" id="idPerfil" path="idPerfil">
                            <c:forEach items="${ perfiles }" var="perfiles">
                                <form:option value="${ perfiles.idPerfil }">${ perfiles.descripcion }</form:option>
                                </c:forEach>
                        </form:select>
                    </div>    
                        
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail4">Correo electrónico:</label>
                            <form:input type="email" class="form-control" id="email" path="email" placeholder="example@example.com" required="required"/>
                            <div class="invalid-feedback">
                                Campo obligatorio
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputPassword4">Contraseña:</label>
                            <form:input type="password" class="form-control" id="contrasenia" path="contrasenia" placeholder="Contraseña" required="required" />
                            <div class="invalid-feedback">
                                Campo obligatorio
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="usuario">Usuario:</label>
                        <form:input type="text" class="form-control" id="usuario" path="usuario" required="required" />
                        <div class="invalid-feedback">
                            Campo obligatorio
                        </div>
                    </div>
                    
                    <form:button type="submit" class="btn btn-primary">Regístrarse</form:button>
                    
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
        
        <script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>
    </body>
</html>
