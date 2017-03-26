<%@ include file="/jspf/directive/page.jspf"%>
<%@ include file="/jspf/directive/taglib.jspf"%>

<!DOCTYPE html>
<html>
<head>
<title><fmt:message key="users" /></title>
<%@ include file="/jspf/head.jspf"%>
</head>
<body>
<%@ include file="/jspf/header.jspf"%>
	<div class="container background">
		<hr>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<td><fmt:message key="login" /></td>
						<td><fmt:message key="role" /></td>
						<td><fmt:message key="userName" /></td>
						<td><fmt:message key="telNumber" /></td>&nbsp;
						<td><fmt:message key="discount" /></td>
						<td><fmt:message key="access_level" /></td>
						<td><fmt:message key="block" /></td>

					</tr>
				</thead>
				<tbody>

					<c:forEach items="${listUsers}" var="userT">
						<c:if test="${userT.id != user.id }">
							<c:if test="${userT.blocked == true}">
								<tr class="danger">
									<td><c:out value="${userT.username}" /></td> &nbsp;
									<td><c:out value="${userT.roles.get(0).name}" /></td> &nbsp;
									<td><c:out value="${userT.firstName}" /> <c:out
											value="${userT.lastName}" /></td>&nbsp;
									<td><c:out value="${userT.telNumber}" /></td>
									<td>D</td>
									<%--<c:if test="${userT.discountId == 0}">
										<td>-</td>
									</c:if>
									<c:if test="${userTDiscount.id != 0}">
										<td><c:out value="${userTDiscount.id}" />: S. <c:out
												value="${userTDiscount.step}%" />, P. <c:out
												value="${userTDiscount.percent}%	" /> &nbsp;</td>
									</c:if>--%>

									<td>
										<form action="/accessChange" method="post">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
											 <input type="hidden" name="idUser" value="${userT.id}" />
											<div class="input-group">

												<select name="access" class="aorm-control">
													<c:forEach items="${roles}" var="cur_role">
														<option value="${cur_role}">${cur_role.name}</option>
													</c:forEach>
												</select> <span class="input-group-btn">
													<button class="btn btn-md btn-default" type="submit">></button>
												</span>

											</div>
										</form>
									</td>
									<td><a
										href="/blockChange?idUser=${userT.id}"
										class="btn btn-xs btn-primary"><fmt:message key="unblock" /></a></td>

								</tr>
							</c:if>

							<c:if test="${userT.blocked == false}">
								<tr class="success">

									<td><c:out value="${userT.username}" /></td> &nbsp;
									<td><c:out value="${userT.roles.get(0).name}" /></td> &nbsp;
									<td><c:out value="${userT.firstName}" /> <c:out
											value="${userT.lastName}" /></td>&nbsp;
									<td><c:out value="${userT.telNumber}" /></td>
									<td>D</td>
										<%--<c:if test="${userT.discountId == 0}">
                                            <td>-</td>
                                        </c:if>
                                        <c:if test="${userTDiscount.id != 0}">
                                            <td><c:out value="${userTDiscount.id}" />: S. <c:out
                                                    value="${userTDiscount.step}%" />, P. <c:out
                                                    value="${userTDiscount.percent}%	" /> &nbsp;</td>
                                        </c:if>--%>

									<td>
										<form action="/accessChange" method="post">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
											<input
													type="hidden" name="idUser" value="${userT.id}" />
											<div class="input-group">

												<select name="access" class="aorm-control">
													<c:forEach items="${roles}" var="cur_role">
														<option value="${cur_role}">${cur_role.name}</option>
													</c:forEach>
												</select> <span class="input-group-btn">
													<button class="btn btn-md btn-default" type="submit">></button>
												</span>

											</div>
										</form>
									</td>

									<td><a
										href="/blockChange?idUser=${userT.id}"
										class="btn btn-xs btn-primary"><fmt:message key="block" /></a></td>

								</tr>
							</c:if>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>


		<%@ include file="/jspf/directive/footer.jspf"%>
	</div>

</body>
</html>