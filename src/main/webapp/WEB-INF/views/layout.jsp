<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<header>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<link rel="stylesheet" type="text/css"
		href="css/humanity/jquery-ui-1.10.0.custom.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script src="js/jquery-1.9.0.js"></script>
	<script src="js/jquery-ui-1.10.0.custom.js"></script>
	<script src="js/my.js"></script>
	<c:set var="title"><tiles:getAsString name="title"/></c:set>
	<title><spring:message code="${title}" /></title>
</header>
<body>
	<div id="content"   class="ui-corner-all">
		<div id="left">
			<tiles:insertAttribute name="menu" />
		</div>
		<div id="center">
			<tiles:insertAttribute name="body" />
		</div>
	</div>
</body>
</html>

