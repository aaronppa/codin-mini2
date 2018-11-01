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
	<a href="<c:url value='gallary/list.do'/>" >테스트</a>
	<h1>Project 생성로그인 테스트 gall</h1>
	<hr>
		<a href="<c:url value='/testGall/login1.do'/>">관리자로 로그인</a><br>
		<a href="<c:url value='/testGall/login2.do'/>">테스터1 로그인</a><br>
		<a href="<c:url value='/testGall/login3.do'/>">테스터2 로그인</a><br>
		<a href="<c:url value='/testGall/login4.do'/>">테스터3 로그인</a><br>
		<a href="<c:url value='/testGall/logout.do'/>">로그아웃</a>
	<h2>현재 로그인 되어있는 계정 : ${user.memberName }</h2>
</body>
</html>