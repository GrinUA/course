<%@ include file="/jspf/directive/page.jspf" %>
<%@ include file="/jspf/directive/taglib.jspf" %>

<!DOCTYPE html>
<html>
<head>
    <head>
        <title>
            <fmt:message key="title_confirm"/>
        </title>
        <%@ include file="/jspf/head.jspf" %>
    </head>
<body>
<%@ include file="/jspf/header.jspf" %>
<script type="text/javascript">
    window.onbeforeunload = function (e) {
        //Interner Explorer
        var e = e || window.event;
        var myMessage = "Exit?";
        //Internet Explorer and Firefox
        if (e) {
            e.returnValue = myMessage;
        }
        //Safari and Chrome
        return myMessage;
    };
</script>
<div class="container background">
    <hr>
    <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-10">
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <td><fmt:message key="name"/></td>
                        <td><fmt:message key="tour"/></td>
                        <td><fmt:message key="people"/></td>
                        <td><fmt:message key="status"/></td>
                        <td><fmt:message key="bill"/></td>
                    </tr>
                    </thead>
                    <tbody>
                    <td>${user.firstName} ${user.lastName}</td>
                    &nbsp;
                    <td>${tour.name}</td>
                    <td>${tour.peopleCount}</td>
                    <td>CREATED</td>
                    <td>$${tour.price - tour.price*(discount.percent/100.0)} <c:if
                            test="${discount.percent!=0}">(-${discount.percent}%)</c:if>

                    </td>
                    <td>
                        <form action="/confirm" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input type="hidden" name="userId" value="${user.id}"/> <input
                                type="hidden" name="tourId" value="${tour.id}"/> <input
                                type="hidden" name="bill" value="${tour.price - tour.price*(discount.percent/100.0)}"/>
                            <button class="btn btn-md btn-success" style="padding-top:2px;padding-bottom: 2px"
                                    type="submit">Confirm
                            </button>
                        </form>
                    </td>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <hr>
</div>


</body>
</html>