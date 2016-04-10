<%--
    Document   : index
    Created on : Mar 20, 2016, 1:32:13 PM
    Author     : marlon
--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login</title>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/datepicker3.css" rel="stylesheet">
        <link href="assets/css/styles.css" rel="stylesheet">
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/chart.min.js"></script>
        <script src="assets/js/chart-data.js"></script>
        <script src="assets/js/easypiechart.js"></script>
        <script src="assets/js/easypiechart-data.js"></script>
        <script src="assets/js/bootstrap-datepicker.js"></script>
        <script>
            !function ($) {
                $(document).on("click", "ul.nav li.parent > a > span.icon", function () {
                    $(this).find('em:first').toggleClass("glyphicon-minus");
                });
                $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
            }(window.jQuery);

            $(window).on('resize', function () {
                if ($(window).width() > 768)
                    $('#sidebar-collapse').collapse('show')
            })
            $(window).on('resize', function () {
                if ($(window).width() <= 767)
                    $('#sidebar-collapse').collapse('hide')
            })
        </script>
    </head>
    <body>
        <%--La navegacion es la barra de menu ubicada en la parte de arriba de la pagina.--%>
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand"><span>PUNTO</span>VENTAS</a>
                    <ul class="user-menu">
                        <form class="form-inline" role="form" action="LoginBean" method="POST" style="float:right;">
                            <div class="form-group">
                                <select id="idcategoria" style="text-align: center" name="rol" class="form-control">
                                    <option>Administrador</option>
                                    <option>Cajero</option>
                                    <option>Cliente</option>
                                </select> 
                            </div>
                            <div class="form-group">
                                <input class="form-control" style="text-align: center" placeholder="Usuario" name="user" type="text">
                            </div>
                            <div class="form-group">
                                <input class="form-control" style="text-align: center" placeholder="Clave" name="password" type="password">
                            </div>
                            <input type="submit" value="Login" class="btn btn-default">
                        </form>
                    </ul>
                </div>
            </div>
        </nav>

        <%--Contenido central de la pagina--%>
        <div class="main">
            <div class="row"><br/>
                <div class="col-lg-12">
                    <div class="col-lg-8">
                        
                    </div>
                    <div class="col-lg-4">
                        <c:choose>
                            <c:when test="${padre=='guardado'}">
                                <div class="alert alert-success alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>Se ha guardado con exito, ya puedes accesar</div>
                            </c:when>
                            <c:otherwise></c:otherwise>
                        </c:choose>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <center>
                                    <strong>Registrate como cliente</strong>
                                </center>
                            </div>
                            <div class="panel-body">
                                <fieldset>
                                    <form role="form" name="formRegistroCliente" action="RegistrarCliente" method="POST" class="form-horizontal">
                                        <div class="form-group">
                                            <label for="user" class="col-sm-2 control-label">Usuario</label>
                                            <div class="col-sm-10">
                                                <input class="form-control" placeholder="Usuario" maxlength="45" id="username" name="username" type="text" required="true">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="password" class="col-sm-2 control-label">Clave</label>
                                            <div class="col-sm-10">
                                                <input class="form-control" placeholder="Clave" maxlength="45" id="password" name="clave" type="password" required="true">
                                            </div>   
                                        </div>
                                        <div class="form-group">
                                            <label for="nombre" class="col-sm-2 control-label">Nombre</label>
                                            <div class="col-sm-10">
                                                <input class="form-control" placeholder="Nombre" id="nombre" name="nombre" maxlength="45" type="text" required="true">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="telefono" class="col-sm-2 control-label">Telefono</label>
                                            <div class="col-sm-10">
                                                <input class="form-control" placeholder="Telefono" id="telefono" name="telefono" maxlength="8" type="text" required="true">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtdui" class="col-sm-2 control-label">Dui</label>
                                            <div class="col-sm-10">
                                                <input class="form-control" placeholder="Dui" id="txtdui" name="txtdui" maxlength="10" type="text" required="true">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="txtnit" class="col-sm-2 control-label">Nit</label>
                                            <div class="col-sm-10">
                                                <input class="form-control" placeholder="Nit" id="txtnit" name="txtnit" maxlength="20" type="text" required="true">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="email" class="col-sm-2 control-label">Email</label>
                                            <div class="col-sm-10">
                                                <input class="form-control" placeholder="Email" maxlength="45" id="email" name="email" type="email" required="true">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <button class="btn btn-primary btn-block" type="submit">Registrar</button>
                                            </div>
                                        </div>
                                        <%--<br/><br/><br/><br/><br/><br/><br/><br/><br/>--%>
                                    </form>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>       
    </body>
</html>