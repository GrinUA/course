<%@ include file="/jspf/directive/page.jspf"%>
<%@ include file="/jspf/directive/taglib.jspf"%>

<!DOCTYPE html>
<html>
<head>
<title>
		<fmt:message key="main" />
	</title>
<%@ include file="/jspf/head.jspf"%>
</head>
<body>
<%@ include file="/jspf/header.jspf"%>
	<div class="container background">
		<form enctype="multipart/form-data" action="#">
			<input type="hidden" name="command" value="#" />
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<input type="hidden" name="command" value="#" /> <input
							type="hidden" name="idTour" value="${tour.id}" />
						<h3>
							<b><fmt:message key="tour" />: </b><i>${tour.name}</i><br> <br> <b><fmt:message key="place" />:
							</b><i><fmt:message key="${tour.country}" />, ${tour.place}</i>
						</h3>
						<hr>

						<p>
							<img class="img-rounded center-block" src="img/${tour.img}"
								height=200px width=290px />
						</p>
						<p>
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-5"></div>
								<div class="col-md-2">
									<span class="btn btn-info btn-file"> <fmt:message key="browse" /><input
										type="file" name="file" multiple accept="image/*,image/jpg">
									</span>
								</div>
							</div>
						</div>




						<p>
							<b><fmt:message key="name" />: </b> <i>${tour.name}</i> <input type="text"
								class="form-control" name="name" placeholder="New name" />
						</p>

						<p>
							<b><fmt:message key="people" />: </b> <i>${tour.peopleCount}</i> <input type="text"
								class="form-control" name="peopleCount"
								placeholder="New number of people" />
						</p>

						<p>
							<b><fmt:message key="place" />: </b> <i>${tour.place}</i> <input type="text"
								name="place" class="form-control" placeholder="New place" />
						</p>

						<p>
							<b><fmt:message key="price" />: </b> <i>${tour.price}</i> <input type="text"
								name="price" class="form-control" placeholder="New price" />
						</p>


						<p>
							<input class="btn btn-primary" value="<fmt:message key="edit" />" type="submit" />
						</p>
					</div>
					<div class="col-lg-3"></div>
				</div>

			</div>
		</form>
		<%@ include file="/jspf/directive/footer.jspf"%>
	</div>
</body>
</html>