<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="../../favicon.ico">

        <title>Qrorcid</title>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

        <!-- Custom styles for this template -->
        <link href="css/jumbotron-narrow.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>

    <div class="container">
        <div class="header">
            <ul class="nav nav-pills pull-right">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="https://github.com/wjrsimpson/qrorcid/">About</a></li>
                <li><a href="https://github.com/wjrsimpson/qrorcid/issues">Contact</a></li>
            </ul>
            <h3 class="text-muted">Qrorcid</h3>
        </div>

        <div class="jumbotron">
            <div class="lead">
                <p class="sunset">This application is no longer supported. You can generate now generate QR codes directly in the registry, see:</p>
                <p class="sunset"><a href="https://support.orcid.org/knowledgebase/articles/116878-orcid-qr-code">https://support.orcid.org/knowledgebase/articles/116878-orcid-qr-code</a></p>
            </div>
        </div>

        <div class="row marketing">
            <div class="col-lg-6">
                <h4>About ORCID</h4>
                <p>
                    <a href="http://orcid.org" target="_blank">ORCID</a> provides a persistent digital identifier that distinguishes you from every other researcher and,
                    through integration in key research workflows such as manuscript and grant submission, supports automated
                    linkages between you and your professional activities ensuring that your work is recognized.
                    <a href="http://orcid.org/about/what-is-orcid" target="_blank">Find out more.</a>
                </p>
            </div>
        </div>

        <div class="footer">
            <p>&copy; ORCID Inc 2018</p>
        </div>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  </body>
</html>
