<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="/WEB-INF/jsp/include/top.jsp" />

	<h1>Project 생성 완료</h1>
	<hr>
	<c:redirect url="/member/loginForm.do"></c:redirect>
</body>
</html>