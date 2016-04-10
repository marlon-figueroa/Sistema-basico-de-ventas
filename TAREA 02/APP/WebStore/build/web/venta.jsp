<%-- 
    Document   : venta
    Created on : Mar 23, 2016, 1:24:58 PM
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
            <title>::VENTA::</title>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="assets/css/bootstrap.min.css" rel="stylesheet">
            <link href="assets/css/datepicker.css" rel="stylesheet">
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
            <script type="text/javascript">
                $(function () {
                    $("#datepicker").datepicker();
                });
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
                            <li><a href="ClienteBean?action=listar">Cliente</a></li>
                            <li><a href="CuentaBean?action=listar">Cuenta</a></li>
                            <li><a href="MarcaBean?action=listar">Marca</a></li>
                            <li><a href="productos.jsp">Producto</a></li>
                            <li><a href="ProveedorBean?action=listar">Proveedor</a></li>
                            <li><a href="VentaBean?action=listar">Venta</a></li>
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
                            <form class="form-horizontal" role="form" method="POST" action="VentaBean" name="frmVenta">
                                <div class="form-group">
                                    <label for="idventa" class="col-sm-2 control-label">ID Venta</label>
                                    <div class="col-sm-10">                                    
                                        <input class="form-control" id="idventa" maxlength="11" readonly="readonly" type="text"  name="idventa" value="<c:out value="${elemento.idventa}" />" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="idcajero" class="col-sm-2 control-label">Cajero</label>
                                    <div class="col-sm-10"> 
                                        <select id="idcajero" name="idcajero" class="form-control"> 
                                            <sql:query var="res1">
                                                SELECT idcajero,nombre FROM cajero
                                            </sql:query>
                                            <c:forEach items="${res1.rows}" var="cajero">
                                                <option value="<c:out value="${cajero.idcajero}"/>"><c:out value="${cajero.nombre}"/></option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="idcliente" class="col-sm-2 control-label">Cliente</label>
                                    <div class="col-sm-10"> 
                                        <select id="idcliente" name="idcliente" class="form-control"> 
                                            <sql:query var="res2">
                                                SELECT idcliente,nombre FROM cliente
                                            </sql:query>
                                            <c:forEach items="${res2.rows}" var="cliente">
                                                <option value="<c:out value="${cliente.idcliente}"/>"><c:out value="${cliente.nombre}"/></option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="datepicker" class="col-sm-2 control-label">Fecha de venta</label>
                                    <div class="col-sm-10">                                    
                                        <input class="form-control" id="datepicker" maxlength="10" type="text" name="fechaVenta" required="true" value="<c:out value="${elemento.fechaVenta}" />" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button class="btn btn-primary" type="submit">Guardar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>  
            </div>
        </div>
    </body>
</h