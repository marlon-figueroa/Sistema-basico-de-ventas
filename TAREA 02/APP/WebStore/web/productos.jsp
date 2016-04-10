<%-- 
    Document   : productos
    Created on : Mar 22, 2016, 10:47:06 PM
    Author     : marlon
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:setDataSource url="jdbc:mysql://localhost:3306/pvsql" driver="com.mysql.jdbc.Driver" user="root" password="marlon"></sql:setDataSource>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>::Productos::</title>
            <link href="assets/css/bootstrap.min.css" rel="stylesheet">
            <link href="assets/css/datepicker.css" rel="stylesheet">
            <link href="assets/css/styles.css" rel="stylesheet">
            <script src="assets/js/jquery-1.11.1.min.js"></script>
            <script src="assets/js/bootstrap.min.js"></script>
            <script src="assets/js/chart.min.js"></script>
            <script src="assets/js/chart-data.js"></script>
            <script src="assets/js/easypiechart.js"></script>
            <script src="assets/js/easypiechart-data.js"></script>
            <script src="assets/js/bootstrap-datepicker.js"></script>
            <script>
               $(function () {
                    $("#datepicker").datepicker();
                });
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
                            <li class="active"><a href="productos.jsp">Producto</a></li>
                            <li><a href="ProveedorBean?action=listar">Proveedor</a></li>
                            <li><a href="ventas.jsp">Venta</a></li>
                            <br/>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <center>
                                <strong>DETALLES DEL PRODUCTO</strong>
                            </center>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" role="form" method="POST" action="ProductoBean" name="frmProducto">
                                <div class="form-group">
                                    <label for="idcuenta" class="col-sm-2 control-label">Categoria</label>
                                    <div class="col-sm-10"> 
                                        <select id="idcategoria" name="idcategoria" class="form-control"> 
                                            <sql:query var="res1">
                                                SELECT idcategoria,nombre FROM categoria
                                            </sql:query>
                                            <c:forEach items="${res1.rows}" var="categoria">
                                                <option value="<c:out value="${categoria.idcategoria}"/>"><c:out value="${categoria.nombre}"/></option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="idmarca" class="col-sm-2 control-label">Marca</label>
                                    <div class="col-sm-10"> 
                                        <select id="idmarca" name="idmarca" class="form-control"> 
                                            <sql:query var="res2">
                                                SELECT idmarca,nombre FROM marca
                                            </sql:query>
                                            <c:forEach items="${res2.rows}" var="marca">
                                                <option value="<c:out value="${marca.idmarca}"/>"><c:out value="${marca.nombre}"/></option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="idproveedor" class="col-sm-2 control-label">Proveedor</label>
                                    <div class="col-sm-10"> 
                                        <select id="idproveedor" name="idproveedor" class="form-control"> 
                                            <sql:query var="res3">
                                                SELECT idproveedor,nombre FROM proveedor
                                            </sql:query>
                                            <c:forEach items="${res3.rows}" var="proveedor">
                                                <option value="<c:out value="${proveedor.idproveedor}"/>"><c:out value="${proveedor.nombre}"/></option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtnombre" class="col-sm-2 control-label">Nombre</label>
                                    <div class="col-sm-10">                                    
                                        <input class="form-control" id="txtnombre"  maxlength="45" type="text" name="txtnombre" required="true"/>
                                    </div>
                                </div>  
                                <div class="form-group">
                                    <label for="txtpreciouni" class="col-sm-2 control-label">Precio unitario</label>
                                    <div class="col-sm-10">                                    
                                        <input class="form-control" id="txtpreciouni" maxlength="5" type="text" name="txtpreciouni" required="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="txtstock" class="col-sm-2 control-label">Cantidad</label>
                                    <div class="col-sm-10">                                    
                                        <input class="form-control" id="txtstock" maxlength="11" type="number" name="txtstock" required="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="datepicker" class="col-sm-2 control-label">Fecha de vencimiento</label>
                                    <div class="col-sm-10">                                    
                                        <input class="form-control" id="datepicker" maxlength="10" type="text" name="txtfechavenci" required="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button class="btn btn-primary" type="submit">Registrar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="panel panel-default">
                        <ul class="nav nav-pills nav-stacked">
                            <li><a href="ProductoBean?action=listar">Ver Catalogo</a></li>
                            <li><a href="#">Generar Inventario</a></li>
                            <br/>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
