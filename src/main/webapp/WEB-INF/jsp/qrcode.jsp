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
                    <li><a href="<c:url value="/"/>">Home</a></li>
                    <li><a href="https://github.com/wjrsimpson/qrorcid/">About</a></li>
                    <li><a href="https://github.com/wjrsimpson/qrorcid/issues">Contact</a></li>
                </ul>
                <h3 class="text-muted">Qrorcid</h3>
            </div>

            <div class="container">
                <div class="row">
                    <h1>Your QR code</h1>
                    <spring:url var="qrcode_url" value="{base_url}qrcode/{base64ParamsJson}/generate.png">
                        <spring:param name="base_url">
	                        http://<c:out value="${pageContext.request.serverName}"/>:<c:out value="${pageContext.request.serverPort}"/><spring:url value="/"/>
	                    </spring:param>
                        <spring:param name="base64ParamsJson" >
                            <c:out value="${base64ParamsJson}"/>
                        </spring:param>
                    </spring:url>
                    <img src="<c:out value="${qrcode_url}"/>"/>
                </div>
            <div class="row">
                <h1>Your Zazzle Products</h1>
                <p>
	                <spring:url var="zazzle_stickers_url" value="http://www.zazzle.com/api/create/at-238329472821236199?rf=238329472821236199&ax=Linkover&pd=217593465776537034fwd=DesignTool&tc=&ic=&t_qrcode_iid=http%3A%2F%2F{base_url}qrcode/{base64ParamsJson}/generate.png&t_orcid_txt=%20{website}">
	                    <spring:param name="base_url">
	                        <c:out value="${pageContext.request.serverName}"/>:<c:out value="${pageContext.request.serverPort}"/><spring:url value="/"/>
		                </spring:param>
	                    <spring:param name="name" >
	                        <c:out value="${vcard_name}"/>
	                    </spring:param>
	                    <spring:param name="email" >
	                        <c:out value="${email}"/>
	                    </spring:param>
	                    <spring:param name="website" >
	                        <c:out value="${orcid_uri}"/>
	                    </spring:param>
	                    <spring:param name="base64ParamsJson" >
                            <c:out value="${base64ParamsJson}"/>
                        </spring:param>
	                </spring:url>
	                <a class="product-link" href="<c:out value="${zazzle_stickers_url}"/>">ORCID Stickers</a>
                </p>
            </div>
        </div>

        <div class="footer">
            <p>&copy; ORCID Inc 2014</p>
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
