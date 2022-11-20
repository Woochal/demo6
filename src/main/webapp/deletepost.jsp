<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.demo6.DAO.hotelDAO"%>
<%@page import="com.example.demo6.bean.hotelVO" %>
<%@page import="com.example.demo6.util.FileUpload"%>
<%
	String Id = request.getParameter("id");
	if (Id != ""){
		int id = Integer.parseInt(Id);
		hotelVO u = new hotelVO();
		u.setId(id);
		hotelDAO hotelDAO = new hotelDAO();

//		String filename = hotelDAO.getPhotoFilename(id);
//		if(filename != null)
//			FileUpload.deleteFile(request, filename);
		hotelDAO.deleteHotel(u);
	}
	response.sendRedirect("posts.jsp");
%>