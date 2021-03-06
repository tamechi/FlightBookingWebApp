<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" import="java.util.List"%>
<!DOCTYPE html>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.java.components.BookedFlight"%>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>


<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

</head>
<body>


	


	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="./index.jsp">Toya Air</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">

				<li class="nav-item"><a class="nav-link" href="./CustomerFlightSearch.jsp">Find flight</a>

			</ul>

			<input type="hidden" name="isAdmin" value="true"> <a
				class="nav-link" href="./navaccount">My Accounts <span
				class="sr-only">(current)</span></a> <a class="nav-link" href="./logout">
				Logout<span class="sr-only">(current)</span>
			</a>


		</div>
	</nav>





	<div style="display: flex; height: 100%">

		<h5 style="color: Green">
			<b>${requestScope.successMsg}</b>
		</h5>
		<%
			request.setAttribute("successMsg", "");
		%>
		<div style="background-color: slateblue; width: 150px" class="floaters">

			<ul style="list-style-type: none">
			
				
				<li><a style="color: white" href="./CustomerFlightSearch.jsp">Find flight</a></li>
				
				<li><a style="color: white" href="./CustomerFlightSearch.jsp">Book a flight</a></li>
				
			</ul>

		</div>

		<div class="floaters"
			style="margin-left: 10px; background-color: lightgray; width: 850px">


			<%
				List<BookedFlight> flights = (List<BookedFlight>) session.getAttribute("flights");
				/*   System.out.println(flights); */
			%>


			<h4>${requestScope.errorMsg}</h4>
			<%
				request.setAttribute("errorMsg", "");
			%>


			<c:if test="${sessionScope.flights !=null}">
				<div class="card mb-3">
					<div class="card-header" style="text-align: center">
						<h3>
							<i class="fas fa-table">Booking History</i>
						</h3>
					</div>
					<div class="card-body">
						<c:if test="${flightList.size()==0}">
							<div class="alert alert-warning" role="alert">No flights
								have been booked.</div>
						</c:if>
						<c:set var="count" value="${1}" />
						<c:if test="${flightList.size()>0}">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th scope="col">#</th>
											<td scope="col">Airline</td>
											<td scope="col">Passenger</td>
											<td scope="col">Source</td>
											<td scope="col">Destination</td>
											<td scope="col">Departure Time</td>
											<td scope="col">Arrival Time</td>
										</tr>
									</thead>
									<tbody>
										<%
											for (int i = 0; i < flights.size(); ++i) {
										%>
										<tr>
											<th scope="row">1</th>
											<td><%=flights.get(i).getAirline()%></td>
											<td><%=flights.get(i).getPassengerName()%></td>
											<td><%=flights.get(i).getFrom()%></td>
											<td><%=flights.get(i).getTo()%></td>
											<td><%=flights.get(i).parseDate(0)%></td>
											<td><%=flights.get(i).parseDate(1)%></td>
										</tr>
										<%
											}
										%>

									</tbody>
								</table>
							</div>
						</c:if>
					</div>
				</div>
			</c:if>


		</div>



	</div>





</body>
</html>