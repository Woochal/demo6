<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.demo6.DAO.hotelDAO, com.example.demo6.bean.hotelVO,java.util.*"%>
<%@ page import="com.example.demo6.DAO.hotelDAO" %>
<%@ page import="com.example.demo6.util.FileUpload" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>W.C HOTEL</title>
	<link rel="stylesheet" href="my.css">
<style>

</style>
<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하겠습니까?");
		if(a) location.href='deletepost.jsp?id=' + id;
	}
</script>
</head>
<body>
<%
	hotelDAO hotelDAO = new hotelDAO();
	List<hotelVO> list = hotelDAO.getHotelList();
	request.setAttribute("list",list);
//	String Id = request.getParameter("id");
//	hotelVO u = hotelDAO.getHotel(Integer.parseInt(Id));
//	request.setAttribute("vo",u);

%>




<div id="header">
	<a id="homeTitle" href="home.html">W.C HOTEL</a>
</div>
<div id="nav" style="margin-top: 0.5%">
	<a id="about" href="about.html">About</a>
	<span> | </span>
	<a id="rooms" href="rooms.html">Rooms</a>
	<span> | </span>
	<a id="reservation" href="index.html">Reservation</a>
	<span> | </span>
	<a id="community" href="community.html">Community</a>
</div>
<div id="input">
	<input type="text">
	<input type="button" value="Search" id="search">
	<input type="button" value="Add" id="add" onclick="location.href = 'addpostform.jsp'">
</div>
<div id="tablediv">
	<table class="table">
		<thead>
		<tr>
			<th>NO.</th>
			<th>Name</th>
			<th>Phone</th>
			<th>Room Number</th>
			<th>Guests</th>
			<th>Check In</th>
			<th>Check Out</th>
			<th>Payment</th>
			<th>Photo</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="u">
			<tr>
				<td><a href="editform.jsp?id=${u.getId()}" style="color: #222222; text-decoration: none">${u.getId()}</a></td>
				<td>${u.getName()}</td>
				<td>${u.getPhone()}</td>
				<td>${u.getRoomNum()}</td>
				<td>${u.getGuests()}</td>
				<td>${u.getCheckIn()}</td>
				<td>${u.getCheckOut()}</td>
				<td>${u.getPayment()}</td>
				<td><c:if test="${u.getPhoto() ne ''}"> <img src="${pageContext.request.contextPath}/upload/${u.getPhoto()}" class="photo"> </c:if></td>
			</tr>
		</c:forEach>


		</tbody>
	</table>
</div>
</body>
</html>