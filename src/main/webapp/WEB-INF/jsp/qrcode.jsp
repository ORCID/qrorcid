<%--

    =============================================================================
    Copyright (C) 2011-12 by ORCID

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
    =============================================================================

--%>
<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="<c:url value="/main.css"/>" rel="stylesheet" type="text/css" />
<title>Journal of Psychoceramics - Manuscript Tracking System</title>
</head>
<body>
    <div id="container">

        <ul id="mainlinks">
            <li><a href="<c:url value="/index.jsp"/>">Home</a></li>
            <authz:authorize ifNotGranted="ROLE_USER">
                <li><a href="<c:url value="/login.jsp"/>">Login</a></li>
            </authz:authorize>
            <li><a href="<c:url value="/orcid/info"/>">ORCID info</a></li>
            <li><a href="<c:url value="/orcid/qrcode"/>" class="selected">QR code</a></li>
        </ul>

        <div id="content">
            <h1>Your QR code</h1>
            <spring:url var="qrcode_url" value="{base_url}qrcode/generate.png?name={name}&email={email}&website={website}">
                <spring:param name="base_url">
	                    http://<c:out value="${pageContext.request.serverName}"/>:<c:out value="${pageContext.request.serverPort}"/><spring:url value="/"/>
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
            </spring:url>
            <img src="<c:out value="${qrcode_url}"/>"/>
        </div>
        <div>
            <h1>Your Zazzle Products</h1>
            <p>
	            <spring:url var="zazzle_mug_url" value="http://www.zazzle.com/api/create/at-238329472821236199?rf=238329472821236199&ax=Linkover&pd=168331560131091417&fwd=DesignTool&tc=&ic=&t_image0_iid=http%3A%2F%2F{base_url}qrcode/generate.png?name={name}%26email={email}%26website={website}">
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
	            </spring:url>
	            <a href="<c:out value="${zazzle_mug_url}"/>">ORCID Mug</a>
            </p>
        </div>

        <p class="footer">© ORCID 2011</p>

    </div>
</body>
</html>