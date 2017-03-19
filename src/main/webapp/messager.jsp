<%@ include file="/jspf/directive/page.jspf"%>
<%@ include file="/jspf/directive/taglib.jspf"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>
		<fmt:message key="main" />
	</title>
<%@ include file="/jspf/head.jspf"%>
</head>
<body>

	<div class="container" style="padding-top: 15px">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title"></h3>
					</div>
					<div class="panel-body">
						<p class="lead">${errorMessage}</p>
						<a href="${pageContext.request.contextPath}/index.jsp"
							class=" form-control btn btn-md btn-success" type="redirect">Ok</a>
					</div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>