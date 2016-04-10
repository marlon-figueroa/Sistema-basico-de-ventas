<%-- 
    Document   : main-administrador
    Created on : Mar 23, 2016, 12:10:30 PM
    Author     : marlon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title style="text-align: center">::PRINCIPAL::</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/datepicker3.css" rel="stylesheet">
        <link href="assets/css/datepicker.css" rel="stylesheet">
        <link href="assets/css/styles.css" rel="stylesheet">	
        <script src="assets/js/lumino.glyphs.js"></script>
        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/chart.min.js"></script>
        <script src="assets/js/chart-data.js"></script>
        <script src="assets/js/easypiechart.js"></script>
        <script src="assets/js/easypiechart-data.js"></script>
        <script src="assets/js/bootstrap-datepicker.js"></script>  
        <script src="assets/js/respond.min.js"></script>
        <script src="assets/js/html5shiv.min.js"></script>
        <script>
            $('#calendar').datepicker();

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
        <script type="text/javascript">
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })

            $('#ayuda').tooltip('show')

            $(function () {
                $('[data-toggle="popover"]').popover()

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
                    <a class="navbar-brand" href="#"><span>PUNTO</span>VENTAS</a>
                    <ul class="user-menu">
                        <li class="dropdown pull-right">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Usuario <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="main-administrador.jsp"><svg class="glyph stroked home"><use xlink:href="#stroked-home"/></svg> Pincipal</a></li>
                                <li><a href="index.jsp"><svg class="glyph stroked cancel"><use xlink:href="#stroked-cancel"></use></svg> Salir</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <%--Contenido central de la pagina--%>
        <div class="col-lg-12 main">
            <div class="col-lg-2"><br/>
                <div class="panel panel-default">
                    <ul class="nav nav-pills nav-stacked">
                        <li class="active"><a href="main-administrador.jsp">Principal</a></li>
                        <li><a href="AdministradorBean?action=listar">Administrador</a></li>
                        <li><a href="CajeroBean?action=listar">Cajero</a></li>
                        <li><a href="CategoriaBean?action=listar">Categoria</a></li>
                        <li><a href="ClienteBean?action=listar">Cliente</a></li>
                        <li><a href="CuentaBean?action=listar">Cuenta</a></li>
                        <li><a href="MarcaBean?action=listar">Marca</a></li>
                        <li><a href="productos.jsp">Producto</a></li>
                        <li><a href="ProveedorBean?action=listar">Proveedor</a></li>
                        <li><a href="VentaBean?action=listar">Venta</a></li>
                        <br />
                    </ul>
                </div>
            </div>
            <div class="col-lg-10">
                <div class="row"><br/>
                    <div class="col-lg-2">
                        <a class="btn btn-default" href="AdministradorBean?action=listar" data-toggle="tooltip" data-placement="top" title="Administradores">
                            <img class="img-rounded" src="assets/images/128px/profle.png" alt="Profle"/>
                        </a>
                    </div>
                    <div class="col-lg-2">
                        <a class="btn btn-default" href="CajeroBean?action=listar" data-toggle="tooltip" data-placement="top" title="Cajeros">
                            <img class="img-rounded" src="assets/images/128px/profle.png" alt="Profle"/>
                        </a>
                    </div>
                    <div class="col-lg-2">
                        <a class="btn btn-default" href="CuentaBean?action=listar" data-toggle="tooltip" data-placement="top" title="Cuentas">
                            <img class="img-rounded" src="assets/images/128px/contacts.png" alt="Contact"/>
                        </a>
                    </div>
                    <div class="col-lg-2">
                        <a class="btn btn-default" href="MarcaBean?action=listar" data-toggle="tooltip" data-placement="top" title="Marcas">
                            <img class="img-rounded" src="assets/images/128px/briefcase.png" alt="Briefcase"/>
                        </a>
                    </div>
                    <div class="col-lg-2">
                        <a class="btn btn-default" href="CategoriaBean?action=listar" data-toggle="tooltip" data-placement="top" title="Categorias">
                            <img class="img-rounded" src="assets/images/128px/booklet.png" alt="Booklet"/>
                        </a>
                    </div>
                    <div class="col-lg-2">
                        <a class="btn btn-default" href="ProductoBean?action=listar" data-toggle="tooltip" data-placement="top" title="Productos">
                            <img class="img-rounded" src="assets/images/128px/dolly.png" alt="Dolly"/>
                        </a>
                    </div> 
                </div>
                <br/>
                <div class="row">
                    <div class="col-lg-2">
                        <a class="btn btn-default" href="ClienteBean?action=listar" data-toggle="tooltip" data-placement="top" title="Cliente">
                            <img class="img-rounded" src="assets/images/128px/profle.png" alt="Profle"/>
                        </a>
                    </div>
                    <div class="col-lg-2">
                        <a class="btn btn-default" href="ProveedorBean?action=listar" data-toggle="tooltip" data-placement="top" title="Proveedor">
                            <img class="img-rounded" src="assets/images/128px/profle.png" alt="Profle"/>
                        </a>
                    </div>
                    <div class="col-lg-2">
                        <a class="btn btn-default" href="ventas.jsp" data-toggle="tooltip" data-placement="top" title="Ventas">
                            <img class="img-rounded" src="assets/images/128px/cart.png" alt="Cart"/>
                        </a>
                    </div>
                    <div class="col-lg-2">
                        <a class="btn btn-default" href="#" data-toggle="tooltip" data-placement="top" title="Informe de ventas">
                            <img class="img-rounded" src="assets/images/128px/rocket.png" alt="Rocket"/>
                        </a>
                    </div>
                    <div class="col-lg-2">
                        <a class="btn btn-default" href="#" data-toggle="tooltip" data-placement="top" title="Informe de inventario de productos">
                            <img class="img-rounded" src="assets/images/128px/clipboard.png" alt="Clipboard"/>
                        </a>
                    </div>
                    <div class="col-lg-2">
                        <a class="btn btn-default" href="index.jsp" data-toggle="tooltip" data-placement="top" title="Salir">
                            <img class="img-rounded" src="assets/images/128px/power.png" alt="Power"/>
                        </a>
                    </div>
                </div>
                <br/>
            </div>
            <%--<div class="col-lg-2"><br/>
                <div class="row">
                    <div class="panel panel-red">
                        <div class="panel-heading dark-overlay"><svg class="glyph stroked calendar"><use xlink:href="#stroked-calendar"></use></svg>Calendar</div>
                        <div class="panel-body">
                            <div id="calendar"></div>
                        </div>
                    </div>
                </div>
            </div>--%>
        </div>
    </body>
</html>

