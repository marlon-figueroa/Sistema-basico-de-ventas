<%-- 
    Document   : cajeros
    Created on : Mar 22, 2016, 11:03:25 PM
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
            <title>::CAJEROS::</title>
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
            <div class="row"><br/>
                <div class="col-lg-2">
                    <div class="panel panel-default">
                        <ul class="nav nav-pills nav-stacked">
                            <li><a href="main-administrador.jsp">Principal</a></li>
                            <li><a href="AdministradorBean?action=listar">Administrador</a></li>
                            <li class="active"><a href="CajeroBean?action=listar">Cajero</a></li>
                            <li><a href="CategoriaBean?action=listar">Categoria</a></li>
                            <li><a href="ClienteBean?action=listar">Cliente</a></li>
                            <li><a href="CuentaBean?action=listar">Cuenta</a></li>
                            <li><a href="MarcaBean?action=listar">Marca</a></li>
                            <li><a href="productos.jsp">Producto</a></li>
                            <li><a href="ProveedorBean?action=listar">Proveedor</a></li>
                            <li><a href="ventas.jsp">Venta</a></li>
                            <br/>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="panel panel-default">
                        <div class="modal fade" id="myModalInsertarCajero" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="myModalLabel">INFORMACION DEL CAJERO</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal" role="form" method="POST" action="CajeroBean" name="frmCajero">
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
                                                    <input class="form-control" id="txtnombre"  maxlength="45" type="text" name="txtnombre" required="true"/>
                                                </div>
                                            </div>  
                                            <div class="form-group">
                                                <label for="txttelefono" class="col-sm-2 control-label">Telefono</label>
                                                <div class="col-sm-10">                                    
                                                    <input class="form-control" id="txttelefono" maxlength="8" type="text" name="txttelefono" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtdui" class="col-sm-2 control-label">Dui</label>
                                                <div class="col-sm-10">
                                                    <input class="form-control" id="txtdui" name="txtdui" maxlength="10" type="text" required="true">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtnit" class="col-sm-2 control-label">Nit</label>
                                                <div class="col-sm-10">
                                                    <input class="form-control" id="txtnit" name="txtnit" maxlength="20" type="text" required="true">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="txtemail" class="col-sm-2 control-label">Email</label>
                                                <div class="col-sm-10">                                    
                                                    <input class="form-control" id="txtemail" maxlength="45" type="email" name="txtemail" required="true"/>
                                                </div>
                                            </div>
                                            <div class="btn-group" role="group">
                                                <input class="btn btn-primary" type="submit" value="Guardar"/> 
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="panel-heading">
                            <div class="col-lg-6">
                                <a class="btn btn-primary" data-toggle="modal" data-target="#myModalInsertarCajero"><svg class="glyph stroked plus sign"><use xlink:href="#stroked-plus-sign"/></svg>Agregar cajero</a>
                                <a href="CajeroBean?action=listar" class="btn btn-primary"><svg class="glyph stroked clipboard with paper"><use xlink:href="#stroked-clipboard-with-paper"/></svg>Ver registros</a>
                            </div>
                        </div>
                        <div class="panel-body">
                            <c:choose>
                                <c:when test="${mensaje=='guardado'}">
                                    <div class="alert alert-success alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>Guardado con exito</div>
                                </c:when>
                                <c:when test="${mensaje=='modificado'}">
                                    <div class="alert alert-success alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>Modificado con exito</div>
                                </c:when>
                                <c:when test="${mensaje=='eliminado'}">
                                    <div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>Eliminado con exito</div>
                                </c:when>
                                <c:otherwise>
                                    <div class="alert alert-info alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>Listado con exito</div>
                                </c:otherwise>
                            </c:choose>

                            <table data-toggle="table" data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true" data-sort-name="name" data-sort-order="desc">
                                <thead>
                                    <tr>
                                        <th data-field="state" data-checkbox="true" >ID</th>
                                        <th data-field="id" data-sortable="true">ID</th>
                                        <th data-field="nombre" data-sortable="true">Nombre</th>
                                        <th data-field="telefono"  data-sortable="true">Telefono</th>
                                        <th data-field="dui"  data-sortable="true">Dui</th>
                                        <th data-field="nit"  data-sortable="true">Nit</th>
                                        <th data-field="email"  data-sortable="true">Email</th>
                                        <th data-field="cuenta"  data-sortable="true">Cuenta</th>
                                        <th data-field="accion" >Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${cajeros}" var="item">
                                        <tr>
                                            <td><c:out value="${item.idcajero}" /></td>
                                            <td><c:out value="${item.idcajero}" /></td>
                                            <td><c:out value="${item.nombre}" /></td>
                                            <td><c:out value="${item.telefono}" /></td>
                                            <td><c:out value="${item.dui}" /></td>
                                            <td><c:out value="${item.nit}" /></td>
                                            <td><c:out value="${item.email}" /></td>
                                            <td><c:out value="${item.cuentaIdcuenta}" /></td>
                                            <td><a class="btn btn-primary" href="CajeroBean?action=edit&idcajero=<c:out value="${item.idcajero}"/>"><span class="glyphicon glyphicon-refresh" aria-hidden="true"></span></a>
                                                <a class="btn btn-danger" href="CajeroBean?action=delete&idcajero=<c:out value="${item.idcajero}"/>"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
