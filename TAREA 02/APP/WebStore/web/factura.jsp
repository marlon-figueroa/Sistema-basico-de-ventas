<%-- 
    Document   : factura
    Created on : Mar 24, 2016, 12:11:51 PM
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
            <title>::FACTURA::</title>
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
                <div class="col-lg-12">           
                    <div class="panel panel-default">
                        <div class="modal fade" id="myModalInsertarProducto" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="myModalLabel">DETALLE DEL PRODUCTO</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-horizontal" role="form" method="POST" action="FacturaBean?mensaje=agregar" name="frmDetalle">
                                            <div class="form-group">
                                                <label for="iddetalle" class="col-sm-2 control-label">CODIGO</label>
                                                <div class="col-sm-10">                                    
                                                    <input class="form-control" id="iddetalle" maxlength="11" type="text"  name="iddetalleventa" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="cantidad" class="col-sm-2 control-label">Cantidad</label>
                                                <div class="col-sm-10">                                    
                                                    <input class="form-control" id="cantidad" maxlength="11" type="number" name="cantidad" required="true"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="idventa" class="col-sm-2 control-label">Venta</label>
                                                <div class="col-sm-10"> 
                                                    <select id="idventa" name="idventa" class="form-control"> 
                                                        <sql:query var="res1">
                                                            SELECT idventa FROM venta
                                                        </sql:query>
                                                        <c:forEach items="${res1.rows}" var="venta">
                                                            <option value="<c:out value="${venta.idventa}"/>"><c:out value="${venta.idventa}"/></option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="idproducto" class="col-sm-2 control-label">Producto a comprar</label>
                                                <div class="col-sm-10"> 
                                                    <select id="idproducto" name="idproducto" class="form-control"> 
                                                        <sql:query var="res2">
                                                            SELECT idproducto,nombre FROM producto
                                                        </sql:query>
                                                        <c:forEach items="${res2.rows}" var="producto">
                                                            <option value="<c:out value="${producto.idproducto}"/>"><c:out value="${producto.nombre}"/></option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-10">
                                                    <button class="btn btn-primary" type="submit" data-toggle="tooltip" data-placement="top" title="Agregar al carrito"><img src="assets/images/128px/cart.png" height="32" width="32" class="img-rounded"></button>
                                                </div>
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
                            <div class="col-lg-10">
                                <a class="btn btn-primary" href="FacturaBean?mensaje=grabar" data-toggle="tooltip" data-placement="top" title="Grabar venta"><img src="assets/images/128px/money.png" height="32" width="32" class="img-rounded"></a>
                                <a class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Ver Registros"><img src="assets/images/128px/eye.png" height="32" width="32" class="img-rounded"></a>
                                <a class="btn btn-primary" href="FacturaBean?mensaje=limpiar" data-toggle="tooltip" data-placement="top" title="Limpiar"><img src="assets/images/128px/flame.png" height="32" width="32" class="img-rounded"></a>
                                <a class="btn btn-primary" data-toggle="modal" data-target="#myModalInsertarProducto" data-toggle="tooltip" data-placement="top" title="Agregar producto"><img src="assets/images/128px/cart.png" height="32" width="32" class="img-rounded"></a>
                            </div>
                        </div>
                        <div class="panel-body">
                            <c:choose>
                                <c:when test="${confirmacion=='guardado'}">
                                    <div class="alert alert-success alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>Guardado con exito</div>
                                </c:when>
                                <c:when test="${confirmacion=='grabado'}">
                                    <div class="alert alert-success alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>Grabado con exito</div>
                                </c:when>
                                <c:when test="${confirmacion=='eliminado'}">
                                    <div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>Eliminado con exito</div>
                                </c:when>
                                <c:when test="${confirmacion=='fallo'}">
                                    <div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>Fallo el detalle esta repetivo o la operacion fallo</div>
                                </c:when>
                                <%--
                            <c:otherwise>
                                <div class="alert alert-info alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>Listado con exito</div>
                            </c:otherwise>
                                --%>
                            </c:choose>
                            <label>Total $</label><input readonly="readonly" type="text" value="<c:out value="${Total}"/>">
                            <table data-toggle="table" data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true" data-sort-name="name" data-sort-order="desc">
                                <thead>
                                    <tr>
                                        <th data-field="state" data-checkbox="true" >ID</th>
                                        <th data-field="id" data-sortable="true">ID</th>
                                        <th data-field="cantidad" data-sortable="true">Cantidad</th>
                                        <th data-field="producto"  data-sortable="true">Telefono</th>
                                        <th data-field="venta"  data-sortable="true">Venta</th>
                                        <th data-field="precioVenta"  data-sortable="true">Precio de venta</th>
                                        <th data-field="accion" >Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${detalles}" var="item">
                                        <tr>
                                            <td><c:out value="${item.iddetalleventa}" /></td>
                                            <td><c:out value="${item.iddetalleventa}" /></td>
                                            <td><c:out value="${item.cantidad}" /></td>
                                            <td><c:out value="${item.productoIdproducto}" /></td>
                                            <td><c:out value="${item.ventaIdventa}" /></td>
                                            <td><c:out value="${item.precioVenta}" /></td>
                                            <td><a class="btn btn-success" href="FacturaBean?mensaje=eliminar&iddetalleventa=<c:out value="${item.iddetalleventa}"/>"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
