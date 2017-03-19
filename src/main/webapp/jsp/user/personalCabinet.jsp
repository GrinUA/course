<%@ include file="/jspf/directive/page.jspf"%>
<%@ include file="/jspf/directive/taglib.jspf"%>

<!DOCTYPE html>
<html>
<head>
<title>
		<fmt:message key="personalCabinet" />
	</title>
<%@ include file="/jspf/head.jspf"%>
</head>
<body>
<%@ include file="/jspf/header.jspf"%>
<c:choose>
<c:when test="${userRole.name == 'user' }">

<%@ include file="/jspf/client/clientPC.jspf"%>
</c:when>
<c:otherwise>
<%@ include file="/jspf/administration/adminPC.jspf"%>
</c:otherwise>
</c:choose>	
</body>
</html>