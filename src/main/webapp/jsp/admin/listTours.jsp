<%@ include file="/jspf/directive/page.jspf" %>
<%@ include file="/jspf/directive/taglib.jspf" %>

<!DOCTYPE html>
<html>
<head>
    <title>
        <fmt:message key="tours"/>
    </title>
    <%@ include file="/jspf/head.jspf" %>
</head>
<body>
<%@ include file="/jspf/header.jspf" %>
<div class="container background">
    <div class="container-fluid">
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <td style="border: none; background: #ffffff; width: 5px"></td>
                    <td><fmt:message key="name"/></td>
                    <td><fmt:message key="place"/></td>
                    <td><fmt:message key="tourType"/></td>
                    &nbsp;
                    <td><fmt:message key="hotelType"/></td>
                    &nbsp;
                    <td><fmt:message key="stars"/></td>
                    <td><fmt:message key="people"/></td>
                    <td><fmt:message key="price"/></td>

                </tr>
                </thead>
                <tbody>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10">
                            <c:if test="${message!=null}">
                                <div class="alert alert-warning">
                                    <strong><fmt:message key="${message}"/></strong>
                                </div>
                                <c:remove var="message" scope="session"/>

                            </c:if>
                        </div>

                        <div class="col-md-2">

                            <c:if test="${userRole.name == 'admin'}">
                                <%@ include file="/jspf/add_button.jspf" %>
                            </c:if>
                        </div>
                    </div>
                </div>
                <c:forEach items="${listTours}" var="tour">
                    <tr>
                        <td style="border: none; background: #ffffff; width: 5px">
                            <form action="/hotChange" method="get">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="hidden" name="idTour" value="${tour.id}"/>
                                <input type="hidden" name="hot" value="${!tour.hot}"/>

                                <c:if test="${tour.hot == true}">
                                    <button class="btn btn-xs btn-link" type="submit">
                                        <img src="img/hot.jpg" align="right"/>
                                    </button>
                                </c:if>
                                <c:if test="${tour.hot == false}">
                                    <button class="btn btn-xs btn-link" type="submit">
                                        <img src="img/nohot.jpg" align="right"/>
                                    </button>
                                </c:if>
                            </form>
                        </td>
                        <td>${tour.name}</td>
                        &nbsp;
                        <td>
                            <a
                                    href="/viewTour?idTour=${tour.id}">
                                <fmt:message key="${tour.country}"/>,${tour.place}</a>
                        </td>
                        &nbsp;
                        <td><fmt:message key="${tour.tourType.name}"/></td>
                        <td><fmt:message key="${tour.hotelType.name}"/></td>

                        <td><c:forEach begin="1" end="${tour.stars}">
										<span class="glyphicon glyphicon-star-empty"
                                              style="font-size: 80%; color: #FFCC00"></span>
                        </c:forEach></td>
                        <td>${tour.peopleCount}</td>
                        <td>${tour.price}</td>

                        <c:if test="${userRole.name == 'admin'}">

                           <%-- <%@ include file="/jspf/edit_button.jspf" %>

                            <%@ include file="/jspf/delete_button.jspf" %>--%>
                        </c:if>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <%@ include file="/jspf/directive/footer.jspf" %>
    </div>
</div>

</body>
</html>