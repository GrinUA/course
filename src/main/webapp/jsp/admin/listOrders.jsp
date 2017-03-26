<%@ include file="/jspf/directive/page.jspf" %>
<%@ include file="/jspf/directive/taglib.jspf" %>

<!DOCTYPE html>
<html>
<head>
    <title><fmt:message key="orders"/></title>
    <%@ include file="/jspf/head.jspf" %>
</head>
<body>
<%@ include file="/jspf/header.jspf" %>

<div class="container background" style="padding-top: 10px">
    <c:if test="${message!=null}">
        <div class="alert alert-warning">
            <strong><fmt:message key="${message}"/></strong>
        </div>
        <c:remove var="message" scope="session"/>

    </c:if>

    <div class="row">
        <div
        <%--class="col-md-9" style="border-right: solid; padding-left: 15px">--%>

        <span style="font-size: 150%;"><fmt:message key="allOrders"/>:</span>
        <hr style="margin-top: 5px; margin-bottom: 5px;">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2" style="padding: 0px">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <a class="btn btn-primary" href="/buttons?status=all">all</a>

                </div>
                <div class="col-md-2" style="padding: 0px">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <a class="btn btn-success" href="/buttons?status=PAID">PAID</a>

                    </button>

                </div>
                <div class="col-md-2" style="padding-left: 0px">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <a class="btn btn-warning" href="/buttons?status=REGISTERED">REGISTERED</a>


                </div>
                <div class="col-md-2">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <a class="btn btn-danger" href="/buttons?status=CANCELED">CANCELED</a>

                </div>
            </div>
        </div>

        <hr style="margin-top: 5px; margin-bottom: 5px;">
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <td><fmt:message key="id"/></td>
                    <td><fmt:message key="user"/></td>

                    <td><fmt:message key="tour"/></td>
                    <td><fmt:message key="dateOfOrder"/></td>
                    <td><fmt:message key="bill"/></td>
                    </td>
                    <td><fmt:message key="status"/></td>
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
                    <td>${order.id}</td>

                    <td>
                        <c:forEach items="${users}" var="user">
                            <c:if test="${user.id == order.userId}">
                                ${user.firstName} ${user.lastName}</c:if>
                        </c:forEach></td>
                    &nbsp;
                    <input type="hidden" name="idTour" value="${order.tourId}"/>
                    <td>
                        <a
                                href="/viewTour?idTour=${order.tourId}">

                                ${order.tourName};
                        </a></td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${order.orderDate}"/></td>
                    <td>$<fmt:formatNumber value="${order.bill}"
                                           maxFractionDigits="0"/></td>

                    <td><fmt:message key="${order.status.name}"/></td>
                    <td style="padding: 0px; padding-top: 2px; padding-bottom: 2px">
                        <form action="/statusChange" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input
                                    type="hidden" name="orderId" value="${order.id}"/>
                            <div class="input-group">
                                <select name="status" class="form-control"
                                        style="padding: 0px">
                                    <c:forEach items="${status}" var="s">
                                        <option value="${s}">${s.name}</option>
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
    <%-- <div class="col-md-3">
             <span style="font-size: 150%;"><fmt:message
                     key="controlUserDis"/></span>
         <div class="table-responsive">
             <table class="table table-striped">
                 <thead>
                 <tr>
                     <td><fmt:message key="id"/></td>
                     <td><fmt:message key="user"/></td>
                     <td><fmt:message key="discount"/></td>

                 </tr>
                 </thead>
                 <tbody>
                 <c:forEach items="${listUsers}" var="user">
                     <c:if test="${user.role.name == 'client'}">
                         <tr class="info">
                             <td>${user.id}</td>
                             <td>${user.firstName} ${user.lastName}</td>
                             &nbsp;
                             <td>
                                 <%@ include
                                         file="/jspf/discount_setting.jspf" %>
                             </td>
                             &nbsp;
                         </tr>
                     </c:if>
                 </c:forEach>
                 </tbody>
             </table>
         </div>--%>
</div>

</div>
<%@ include file="/jspf/directive/footer.jspf" %>
</div>
</body>
</html>