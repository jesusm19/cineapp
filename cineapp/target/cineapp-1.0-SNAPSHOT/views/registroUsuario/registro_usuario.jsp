<%-- 
    Document   : registro_usuario
    Created on : 21/03/2018, 05:52:20 PM
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
        <title>Cineapp - Registro</title>
        <!--script src="/../js/validaFormulario.js"></script-->
    </head>
    <body>
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
