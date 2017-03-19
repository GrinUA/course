<%@ include file="/jspf/directive/page.jspf"%>
<%@ include file="/jspf/directive/taglib.jspf"%>

<!DOCTYPE html>
<html class="background">
<head>
<title><fmt:message key="singUp" /></title>
<%@ include file="/jspf/head.jspf"%>
</head>
<body class="background">
<%@ include file="/jspf/header.jspf"%>
	<div class="container background">
		
		<div class="row">
			<div class="col-lg-4"></div>
			<div class="col-lg-3">
				<c:if test="${message!=null}">
			<div class="alert alert-warning">
				<strong><fmt:message key="${message}" /></strong>
			</div>
			<c:remove var="message" scope="session" />
			
		</c:if>
				<ul class="nav nav-tabs">
					<li><a href="${pageContext.request.contextPath}/logIn.jsp"><fmt:message
								key="logIn" /></a></li>
					<li class="active"><a href="#"><fmt:message key="singUp" /></a></li>
				</ul>

				<form action="controller" name="singUp"
					onsubmit="return validateSingUp();" method="post">
					<input type="hidden" name="command" value="singUp" />
					<p>
						<br> <input type="text" name="login" class="form-control"
							placeholder="<fmt:message key="login" />" />
					<p>
						<br> <input type="password"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							title="length 8+, 1 Upper Case, 1 number"
							placeholder="<fmt:message key="password" />" name="password"
							class="form-control" />
					<p>
						<br> <input type="email" name="email" title="name@domen.com"
							pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
							class="form-control" placeholder="<fmt:message key="email" />" />
					<p>
						<br> <input type="text" name="firstName" class="form-control"
							placeholder="<fmt:message key="firstName" />" />
					<p>
						<br> <input type="text" name="lastName" class="form-control"
							placeholder="<fmt:message key="lastName" />" />
					<p>
						<br> <input type="text" name="telNumber"
							pattern="\+?[0-9]{5,}" title="length 5+,+ and only numbers"
							class="form-control"
							placeholder="<fmt:message key="telNumber" />" />
					<p>
						<input type="submit" value="<fmt:message key="singUp" />"
							class="form-control btn btn-primary">
				</form>
			</div>
		</div>
		<%@ include file="/jspf/directive/footer.jspf"%>
	</div>
</body>
</html>