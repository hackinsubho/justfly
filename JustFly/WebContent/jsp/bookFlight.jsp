<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>JustFly.in</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script>
</head>
<body>
	<sql:setDataSource var="airport" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/justfly" user="root" password="root" />

	<sql:query var="listAirports" dataSource="${airport}">
        SELECT * FROM airport;
    </sql:query>
	<div class="w3-container w3-card-4">
		<form method="POST" action="/JustFly/results">
			From: <input list="airports" name="airports" path="airport1">
			<datalist id="airports"> <c:forEach var="Airport"
				items="${listAirports.rows}">
				<option value="${Airport.airport}">
			</c:forEach> </datalist>
			To:<input list="airports" name="airports">
			<datalist id="airports"> <c:forEach var="Airport"
				items="${listAirports.rows}">
				<option value="${Airport.airport}">
			</c:forEach> </datalist>
			Depart:<input type="text" id="datepicker" /> <select
				class="w3-select" name="option" style="width: 10%">
				<option value="" disabled selected>Traveller:</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
			</select>
			<button class="w3-btn w3-orange w3-border w3-border-red w3-round-large">Fly<i class="w3-margin-left fa fa-plane"></i></button>
		</form>
	</div>

</body>
</html>

