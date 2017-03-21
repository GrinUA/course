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
<%@ include file="/jspf/header.jspf"%>
	<div class="container background" style="padding-top: 10px">
		
		<div class="col-md-12 jumbotron jumbotron2">

			<div class="text-center">
				<h1>Hello,Hola,Salut!</h1>
				<p><fmt:message key="jumbotron_message" /></p>
				
			</div>


		</div>
		<hr>
		<div class="row">
		<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="row">

					<!--/span-->


			<c:choose>
			<c:when test="${count != null && count!=0 }">
					<c:forEach items="${listToursF}" var="tour">
					<div class="col-lg-4">
							<form action="/viewTour" method="get">
								<input
									type="hidden" name="idTour" value="${tour.id}" /> 
								<button class="btn btn-xs btn-link" type="submit">
									<h3>
										<c:if test="${tour.hot == true}">
											<img src="img/hot2.png" align="left" height=35px width=35px /> &nbsp;
									</c:if>
										${tour.name} &nbsp;
									</h3>
								</button>
							</form>
							<p>
								<img src="img/${tour.img}" height=200px width=290px />
							</p>
							<p>
								<c:forEach begin="1" end="${tour.stars}">

									<span class="glyphicon glyphicon-star-empty"
										style="font-size: 80%; color: #FFCC00"></span>

								</c:forEach>
							</p>
							<div class="container-fluid">
								<h4>

									<b><fmt:message key="${tour.country}"/>, ${tour.place}</b>
								</h4>
								<div class="row">
									<div class="col-lg-5">

										<div style="font-size: 110%;">
											<p>
												<b><fmt:message key="tourType" />: </b>  <span
													style="font-style: italic;">${tour.tourType.name}</span>
											</p>
										</div>

										<p>
											<span class="glyphicon glyphicon-user"
												style="font-size: 150%; color: #0B610B">
												${tour.peopleCount}</span>
										</p>

									</div>
									<div class="col-lg-5">

										<div style="font-size: 110%;">
											<p>
												<b><fmt:message key="hotelType" />: </b>  <span
													style="font-style: italic;">${tour.hotelType.name}</span>
											</p>
										</div>

										<p>
											<span style="font-size: 130%"> $${tour.price}</span>
										</p>
									</div>
								</div>
							</div>


							<form action="/doOrder" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								 <input
									type="hidden" name="idTour" value="${tour.id}" />
								<input
										type="hidden" name="idUser" value="${user.id}" />
								<p>
									<c:choose>
										<c:when test="${userRole != null}">
											<c:if test="${userRole.name == 'user'}">
												<button type="submit" 
													class="form-control btn btn-md btn-default" ><fmt:message key="order_tour" /></button>
											</c:if>
										</c:when>
										<c:otherwise>
											<%@ include file="/jspf/message_for_uknown.jspf"%>
										</c:otherwise>
									</c:choose>
								</p>
							</form>

						</div>
					</c:forEach>
					</c:when>

					<c:when test="${count != null && count==0 }">
					<div class="alert alert-danger">
										<strong>Sorry:(Tour not found!</strong>
									</div>
					</c:when>
					<c:otherwise>

					<c:forEach items="${listTours}" var="tour">
					<div class="col-lg-4">
							<form action="/viewTour" method="get">
								<input
									type="hidden" name="idTour" value="${tour.id}" /> 
								<button class="btn btn-xs btn-link" type="submit">
									<h3>
										<c:if test="${tour.hot == true}">
											<img src="img/hot2.png" align="left" height=35px width=35px /> &nbsp;
									</c:if>
										${tour.name} &nbsp;
									</h3>
								</button>
							</form>
							<p>
								<img src="img/${tour.img}" height=200px width=290px />
							</p>
							<p>
								<c:forEach begin="1" end="${tour.stars}">

									<span class="glyphicon glyphicon-star-empty"
										style="font-size: 80%; color: #FFCC00"></span>

								</c:forEach>
							</p>
							<div class="container-fluid">
								<h4>
									<b><fmt:message key="${tour.country}"/>, ${tour.place}</b>
								</h4>
								<div class="row">
									<div class="col-lg-5">

										<div style="font-size: 110%;">
											<p>
												<b><fmt:message key="tourType" />: </b> <span
													style="font-style: italic;">${tour.tourType.name}</span>
											</p>
										</div>

										<p>
											<span class="glyphicon glyphicon-user"
												style="font-size: 150%; color: #0B610B">
												${tour.peopleCount}</span>
										</p>

									</div>
									<div class="col-lg-5">

										<div style="font-size: 110%;">
											<p>
												<b><fmt:message key="hotelType" />: </b> <span
													style="font-style: italic;">${tour.hotelType.name}</span>
											</p>
										</div>

										<p>
											<span style="font-size: 130%"> $${tour.price}</span>
										</p>
									</div>
								</div>
							</div>


							<form action="" method="post">
								<input
									type="hidden" name="idTour" value="${tour.id}" />

								<p>
									<c:choose>
										<c:when test="${userRole != null}">
											<c:if test="${userRole.name == 'user'}">
												<button type="submit" 
													class="form-control btn btn-md btn-default" ><fmt:message key="order_tour"/></button>
											</c:if>
										</c:when>
										<c:otherwise>
											<%@ include file="/jspf/message_for_uknown.jspf"%>
										</c:otherwise>
									</c:choose>
								</p>
							</form>

						</div>
					</c:forEach>
					</c:otherwise>
			</c:choose>
					
						
				</div>
				<!--/row-->

			</div>
			<div class="col-md-1"></div>

		</div>
		<%@ include file="/jspf/directive/footer.jspf"%>
		</div>
		<!--/row-->
		
		


</body>
</html>