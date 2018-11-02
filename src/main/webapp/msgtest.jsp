<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Message Test Login Page</h1>
	<hr>
	<a href="<c:url value='/testmsg/login1.do'/>">관리자로 로그인</a><br>
	<a href="<c:url value='/testmsg/login2.do'/>">테스터1 로그인</a><br>
	<a href="<c:url value='/testmsg/login3.do'/>">테스터2 로그인</a><br>
	<a href="<c:url value='/testmsg/login4.do'/>">테스터3 로그인</a><br>
	<a href="<c:url value='/testmsg/logout.do'/>">로그아웃</a>
	<h2>현재 로그인 되어있는 계정 : ${user.memberName }</h2>
</body>
</html>