<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.example.demo6.DAO.hotelDAO"%>
<%@page import="com.example.demo6.util.FileUpload"%>
<%@ page import="com.example.demo6.bean.hotelVO" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="com.example.demo6.bean.hotelVO" />
<jsp:setProperty property="*" name="u"/>

<%
	hotelDAO hotelDAO = new hotelDAO();
//	FileUpload upload = new FileUpload();
//	hotelVO u = upload.uploadPhoto(request);

	int i = hotelDAO.insertHotel(u);
	String msg = "데이터 추가 성공 !";
	if(i == 0) msg = "[에러] 데이터 추가  ";
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>