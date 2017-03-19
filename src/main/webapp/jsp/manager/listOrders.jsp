<%@ include file="/jspf/directive/page.jspf"%>
<%@ include file="/jspf/directive/taglib.jspf"%>

<!DOCTYPE html>
<html>
<head>
<title><fmt:message key="orders" /></title>
<%@ include file="/jspf/head.jspf"%>
</head>
<body>
<%@ include file="/jspf/header.jspf"%>

	<div class="container background" style="padding-top: 10px">
		<c:if test="${message!=null}">
			<div class="alert alert-warning">
				<strong><fmt:message key="${message}" /></strong>
			</div>
			<c:remove var="message" scope="session" />
			
		</c:if>
		
		<div class="row">
			<div class="col-md-9" style="border-right: solid; padding-left: 15px">

				<span style="font-size: 150%;"><fmt:message key="allOrders" />:</span>
				<hr style="margin-top: 5px; margin-bottom: 5px;">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-2" style="padding: 0px">
							<form action="controller" method="post">
								<input type="hidden" name="command" value="listOrders" />
								<button type="submit" class="btn btn-xs btn-default">
									<fmt:message key="all" />
								</button>
							</form>
						</div>
						<div class="col-md-2" style="padding: 0px">
							<form action="controller" method="post">
								<input type="hidden" name="command" value="listOrders" /> <input
									type="hidden" name="statusSort" value="Paid" />
								<button type="submit" class="btn btn-xs btn-success">
									<fmt:message key="paid" />
								</button>
							</form>
						</div>
						<div class="col-md-2" style="padding-left: 0px">
							<form action="controller" method="post">
								<input type="hidden" name="command" value="listOrders" /> <input
									type="hidden" name="statusSort" value="Registered" />
								<button type="submit" class="btn btn-xs btn-warning">
									<fmt:message key="registered" />
								</button>
							</form>
						</div>
						<div class="col-md-2">
							<form action="controller" method="post">
								<input type="hidden" name="command" value="listOrders" /> <input
									type="hidden" name="statusSort" value="Canceled" />
								<button type="submit" class="btn btn-xs btn-danger">
									<fmt:message key="canceled" />
								</button>
							</form>
						</div>
					</div>
				</div>

				<hr style="margin-top: 5px; margin-bottom: 5px;">
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<td><fmt:message key="id" /></td>
								<td><fmt:message key="user" /></td>

								<td><fmt:message key="tour" /></td>
								<td><fmt:message key="dateOfOrder" /></td>
								<td><fmt:message key="bill" /></td>
								<td>-<fmt:message key="dis" />%
								</td>
								<td><fmt:message key="status" /></td>
							</tr>
						</thead>

						<tbody>

							<c:forEach items="${listOrders}" var="order">

								<c:if test="${order.status.name == 'registered' }">
									<tr class="warning">
								</c:if>
								<c:if test="${order.status.name == 'paid' }">
									<tr class="success">
								</c:if>
								<c:if test="${order.status.name == 'canceled' }">
									<tr class="danger">
								</c:if>
								<td>${order.user.id}</td>
								<td>${order.user.firstName} ${order.user.lastName}</td>&nbsp;
							
								<td><a
									href="${pageContext.request.contextPath}/controller?command=viewTour&idTour=${order.tour.id}">
										${order.tour.name};<fmt:message key="${order.tour.country}" />;
										$<fmt:formatNumber value="${order.tour.price}"
											maxFractionDigits="0" />
								</a></td>
								<td>${order.orderDate}</td>
								<td>$<fmt:formatNumber value="${order.bill}"
										maxFractionDigits="0" /></td>
								<td><fmt:formatNumber
										value="${(order.tour.price - order.bill)*100/order.tour.price }"
										maxFractionDigits="0" /> %</td>&nbsp;
								<td><fmt:message key="${order.status.name}" /></td>
								<td style="padding: 0px; padding-top: 2px; padding-bottom: 2px">
									<form action="controller" method="post">
										<input type="hidden" name="command" value="orderStatus" /> <input
											type="hidden" name="idOrder" value="${order.id}" />
										<div class="input-group">
											<select name="status" class="form-control"
												style="padding: 0px">
												<c:forEach items="${statuses}" var="st">
													<option value="${st}"><fmt:message key="${st}" /></option>
												</c:forEach>
											</select> <span class="input-group-btn">
												<button class="btn btn-md btn-default" type="submit">></button>
											</span>

										</div>
									</form>
								</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>

				</div>
			</div>
			<div class="col-md-3">
				<span style="font-size: 150%;"><fmt:message
						key="controlUserDis" /></span>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<td><fmt:message key="id" /></td>
								<td><fmt:message key="user" /></td>
								<td><fmt:message key="discount" /></td>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listUsers}" var="user">
								<c:if test="${user.role.name == 'client'}">
									<tr class="info">
										<td>${user.id}</td>
										<td>${user.firstName} ${user.lastName}</td>&nbsp;
										<td><%@ include
												file="/jspf/discount_setting.jspf"%></td>&nbsp;
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

		</div>
		<%@ include file="/jspf/directive/footer.jspf"%>
	</div>
</body>
</html>