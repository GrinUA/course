<%@ include file="/jspf/directive/page.jspf"%>
<%@ include file="/jspf/directive/taglib.jspf"%>

<!DOCTYPE html>
<html>
<head>
<title>
		<fmt:message key="tour" /> ${tour.name} 
	</title>
<%@ include file="/jspf/head.jspf"%>
</head>
<body>
<%@ include file="/jspf/header.jspf"%>


	<div class="container" style="background-color: white">
<hr>
		<div class="container-fluid">

			<h2>
				<c:if test="${tour.hot == true}">
					<img src="img/hot2.png" align="left" height=35px width=35px /> &nbsp;
									</c:if>
				${tour.name} &nbsp;
			</h2>
			
			<div class="row">
				<div class="col-md-4">
					<p>
						<img src="img/${tour.img}" height=200px width=290px />
					</p>
				</div>
				<div class="col-md-6">




					<div class="container-fluid">

						<p>
							<c:forEach begin="1" end="${tour.stars}">


								<span class="glyphicon glyphicon-star-empty"
									style="font-size: 120%; color: #FFCC00"></span>


							</c:forEach>
						</p>



						<div style="font-size: 110%;padding-top: 10px;padding-bottom: 10px">
							<h4>

								<b><fmt:message key="where" /> :</b> <i>${tour.country}, ${tour.place}</i>
							</h4>
							<h4>
								<b><fmt:message key="how" /> : </b> <i>${tour.tourType.name}</i>
							</h4>
							<h4>
								<b><fmt:message key="hotel" /> : </b> <i>${tour.hotelType.name}</i>
							</h4>
							
							<p>
								<span class="glyphicon glyphicon-user"
									style="font-size: 150%; color: #0B610B">
									${tour.peopleCount}</span>
							</p>
							<h4>
								<b><fmt:message key="price" /> : </b> <span style="font-size: 130%">
									$${tour.price}</span>
							</h4>
						</div>


					</div>
				</div>


			</div>

		</div>

		<h3><fmt:message key="discript" /> :</h3>
		<hr>
		<div class="well">
			<p><fmt:message key="info" /> </p>
		</div>

		<div class="container-fluid">

			<div class="row">
				<div class="col-md-9"></div>

				<div class="col-md-1" style="padding-right: 1px"></div>
				<div class="col-md-2" style="padding-left: 1px">
				<c:if test="${userRole.name == 'admin' }">
					<form action="" method="post">
						<input type="hidden" name="command" value="viewTour" /> <input
							type="hidden" name="idTour" value="${tour.id}" /> <input
							type="hidden" name="page" value="#" />
						<%--<button class=" btn btn-md btn-warning" type="submit"><fmt:message key="edit" /> </button>--%>
					</form>
					</c:if>
				<c:if test="${userRole.name == 'user' }">
					<form action="/doOrder" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						 <input
							type="hidden" name="idUser" value="${user.id}" /> <input
							type="hidden" name="idTour" value="${tour.id}" /> <input
							type="submit" value="<fmt:message key="order_tour" /> " class=" btn btn-md btn-success" />

					</form>
				</c:if>

				</div>

			</div>
			<%@ include file="/jspf/directive/footer.jspf"%>
		</div>
	</div>

</body>
</html>