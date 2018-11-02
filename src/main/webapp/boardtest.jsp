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
	<h1>Project 생성 완료</h1>
	<a href="<c:url value='board/listForm.do'/>" >리스트</a>
	<a href="<c:url value='board/detailForm.do'/>" >디테일</a>
	<a href="<c:url value='board/writeForm.do'/>" >글쓰기</a>
	
	
	
	<a href="<c:url value='/TestBoard/login1.do'/>">관리자로 로그인</a><br>
	<a href="<c:url value='/TestBoard/login2.do'/>">테스터1 로그인</a><br>
	<a href="<c:url value='/TestBoard/login3.do'/>">테스터2 로그인</a><br>
	<a href="<c:url value='/TestBoard/login4.do'/>">테스터3 로그인</a><br>
	<a href="<c:url value='/TestBoard/logout.do'/>">로그아웃</a>
	<h2>현재 로그인 되어있는 계정 : ${user.memberName }</h2>
</body>
</html>