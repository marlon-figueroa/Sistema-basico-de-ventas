<%-- 
    Document   : error
    Created on : 03-10-2016, 06:32:07 PM
    Author     : marlon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>::Error::</title>
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
        <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
            <div class="row">
                <center>
                    <div class="col-md-8">
                        <div class="panel panel-danger">
                            <div class="panel-heading">
                                USUARIO Y CONTRASENHA INVALIDOS
                            </div>
                            <div class="panel-body">
                                <a href="index.jsp">
                                    <img src="assets/images/error.jpg" class="img-rounded">                                    
                                    <br/>
                                    Tocame para regresar
                                </a>
                            </div>
                        </div>
                    </div>
                </center>
            </div>
        </div>
    </body>
</html>
