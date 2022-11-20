<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.example.demo6.DAO.hotelDAO, com.example.demo6.bean.hotelVO"%>
<%@ page import="com.example.demo6.DAO.hotelDAO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>W.C HOTEL</title>
	<link rel="stylesheet" href="my.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script>
		function deleteConfirm() {
			var deleteConfirmation = confirm("정말로 삭제하시겠습니까?")
			if(deleteConfirmation == true){
				alert("삭제하였습니다.")
			}
		}
	</script>
</head>
<body>

<%
	hotelDAO hotelDAO = new hotelDAO();
	String Id=request.getParameter("id");
	hotelVO u= hotelDAO.getHotel(Integer.parseInt(Id));
%>


<div>
	<div id="header">
		<a id="homeTitle" href="home.html">W.C HOTEL</a>
	</div>
	<div id="nav">
		<a id="about" href="about.html">About</a>
		<span> | </span>
		<a id="rooms" href="rooms.html">Rooms</a>
		<span> | </span>
		<a id="reservation" href="index.html">Reservation</a>
		<span> | </span>
		<a id="community" href="community.html">Community</a>
	</div>
</div>
<div id="space">
</div>
<div id="resTitle" class="container">
	<div class="row">
		<div class="col-12">Hotel Reservation Update </div>
	</div>
	<hr>
</div>
<div id="formdiv" class="container">
	<form action="editpost.jsp" method="post" enctype="multipart/form-data" class="needs-validation" name="hotel" onsubmit="return validationCheck()"  novalidate>
		<div class="row mb-5">
			<div class="col-md-4">
				<label class="form-label" for="name">Name</label>
				<input type="text" name="name" id="name" class="form-control" value="<%= u.getName()%>" required>
				<div class="invalid-feedback">Name is required.</div>
			</div>
			<div class="col-md-4">
				<label class="form-label" for="phone">Phone</label>
				<input type="tel" name="phone" id="phone" class="form-control" value="<%= u.getPhone()%>" pattern="[0-9]{3}[0-9]{4}[0-9]{4}" placeholder="01012345678" required>
				<div class="invalid-feedback">Phone number is required.</div>
			</div>
			<div class="col-md-4">
				<label class="form-label" for="guest">Guests</label>
				<input type="number" name="guest" id="guest" class="form-control" value="<%= u.getGuests()%>" required>
				<div class="invalid-feedback">Number of guest is required.</div>
			</div>
		</div>
		<div class="row mb-5">
			<div class="col-md-4">
				<label class="form-label" for="roomNum">Room Number</label>
				<input type="number" name="roomNum" id="roomNum" class="form-control" value="<%= u.getRoomNum()%>" required>
				<div class="invalid-feedback">Room number is required.</div>
			</div>
			<div class="col-md-4">
				<label class="form-label" for="checkIn">Check In</label>
				<input type="date" name="checkIn" id="checkIn" class="form-control" value="<%= u.getCheckIn()%>" required>
				<div class="invalid-feedback">Check in date is required.</div>
			</div>
			<div class="col-md-4">
				<label class="form-label" for="checkOut">Check Out</label>
				<input type="date" name="checkOut" id="checkOut" class="form-control" value="<%= u.getCheckOut()%>" required>
				<div class="invalid-feedback">Check out date is required.</div>
			</div>
		</div>
		<div class="row mb-5">
			<div class="col-md-4">
				<label class="form-label" for="payment">Payment</label>
				<select id="payment" name="payment" class="form-control">
					<option value="Online Prepaid">Online Prepaid</option>
					<option value="Pay at Check In">Pay at Check In</option>
					<option value="Pay at Check Out">Pay at Check Out</option>
				</select>
			</div>
			<div class="col-md-8">
				<label class="form-label" for="photo">Photo</label>
				<input type="file" name="photo" id="photo" class="form-control" >
			</div>
		</div>
		<hr>
		<div class="row mb-5">
			<div class="col-12 d-flex justify-content-end">
				<input type="reset" name="reset" value="Reset" id="add">
				<input type="button" name="delete" value="Delete" id="delete" onclick="deleteConfirm(); location.href='deletepost.jsp?id=${u.getId()}'">
				<input type="submit" name="update" value="Update" id="update">
			</div>
		</div>
	</form>
</div>

</body>
</html>