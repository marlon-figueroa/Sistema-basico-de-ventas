<%-- 
    Document   : cliente
    Created on : Mar 23, 2016, 4:22:54 PM
    Author     : marlon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:setDataSource url="jdbc:mysql://localhost:3306/pvsql" driver="com.mysql.jdbc.Driver" user="root" password="marlon"></sql:setDataSource>

    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>::ADMINISTRADOR::</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="assets/css/bootstrap.min.css" rel="stylesheet">
            <link href="assets/css/datepicker3.css" rel="stylesheet">
            <link href="assets/css/bootstrap-table.css" rel="stylesheet">
            <link href="assets/css/styles.css" rel="stylesheet">
            <script src="assets/js/lumino.glyphs.js"></script>
            <script src="assets/js/jquery-1.11.1.min.js"></script>
            <script src="assets/js/bootstrap.min.js"></script>
            <script src="assets/js/chart.min.js"></script>
            <script src="assets/js/chart-data.js"></script>
            <script src="assets/js/easypiechart.js"></script>
            <script src="assets/js/easypiechart-data.js"></script>
            <script src="assets/js/bootstrap-datepicker.js"></script>
            <script src="assets/js/bootstrap-table.js"></script>
            <script>
                $('#calendar').datepicker({
                });

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
                    <a class="navbar-brand" href="#"><span>PUNTO</span>VENTAS</a>
                    <ul class="user-menu">
                        <li class="dropdown pull-right">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Usuario <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Perfil</a></li>
                                <li><a href="#"><svg class="glyph stroked gear"><use xlink:href="#stroked-gear"></use></svg> Configuraciones</a></li>
                                <li><a href="index.jsp"><svg class="glyph stroked cancel"><use xlink:href="#stroked-cancel"></use></svg> Salir</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <%--Contenido central de la pagina--%>
        <div class="col-lg-12 main">

            <div class="row"><br/>
                <div class="col-lg-2">
                    <div class="panel panel-default">
                        <ul class="nav nav-pills nav-stacked">
                            <li><a href="main-administrador.jsp">Principal</a></li>
                            <li><a href="AdministradorBean?action=listar">Administrador</a></li>
                            <li><a href="CajeroBean?action=listar">Cajero</a></li>
                            <li><a href="CategoriaBean?action=listar">Categoria</a></li>
                            <li class="active"><a href="ClienteBean?action=listar">Cliente</a></li>
                            <li><a href="CuentaBean?action=listar">Cuenta</a></li>
                            <li><a href="MarcaBean?action=listar">Marca</a></li>
                            <li><a href="productos.jsp">Producto</a></li>
                            <li><a href="ProveedorBean?action=listar">Proveedor</a></li>
                            <li><a href="#">Venta</a></li>
                            <br/>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <center>                               
                                <b>INFORMACION</b>
                            </center>                        
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" role="form" method="POST" action="ClienteBean" name="frmCliente">
                                <div class="form-group">
                                    <label for="idcliente" class="col-sm-2 control-label">ID Cajero</label>
                                    <div class="col-sm-10">                                    
                                        <input class="form-control" id="idadmin" maxlength="11" type="text" readonly="readonly" name="idcliente" value="<c:out value="${elemento.idcliente}" />" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="idcuenta" class="col-sm-2 control-label">Cuenta</label>
                                    <div class="col-sm-10"> 
                                        <select id="idcuenta" name="idcuenta" class="form-control"> 
                                            <sql:query var="result">
                                                SELECT idcuenta,username FROM cuenta
                                            </sql:query>
                                            <c:forEach items="${result.rows}" var="cuenta">
                                                <option value="<c:out value="${cuenta.idcuenta}"/>"><c:out value="${cuenta.username}"/></option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtnombre" class="col-sm-2 control-label">Nombre</label>
                                    <div class="col-sm-10">                                    
                                        <input class="form-control" id="txtnombre"  maxlength="45" type="text" name="txtnombre" required="true" value="<c:out value="${elemento.nombre}" />" />
                                    </div>
                                </div>  
                                <div class="form-group">
                                    <label for="txttelefono" class="col-sm-2 control-label">Telefono</label>
                                    <div class="col-sm-10">                                    
                                        <input class="form-control" id="txttelefono" maxlength="8" type="text" name="txttelefono" required="true" value="<c:out value="${elemento.telefono}" />" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtdui" class="col-sm-2 control-label">Dui</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" id="txtdui" name="txtdui" maxlength="10" type="text" required="true" value="<c:out value="${elemento.dui}"/>"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtnit" class="col-sm-2 control-label">Nit</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" id="txtnit" name="txtnit" maxlength="20" type="text" required="true" value="<c:out value="${elemento.nit}"/>" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtemail" class="col-sm-2 control-label">Email</label>
                                    <div class="col-sm-10">                                    
                                        <input class="form-control" id="txtemail" maxlength="45" type="email" name="txtemail" required="true" value="<c:out value="${elemento.email}" />" />
                                    </div>
                                </div>
                                <div class="btn-group btn-group-justified" role="group" aria-label="...">
                                    <div class="btn-group" role="group">
                                        <input class="btn btn-primary" type="submit" value="Actualizar" />
                                    </div>
                                    <div class="btn-group" role="group">
                                        <a href="ClienteBean?action=listar" class="btn btn-danger">Cancelar</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>  
            </div>
        </div>
    </body>
</html>