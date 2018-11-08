<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/top.css'/>"></head>
<body>
<div id="topMenu">
    <div class="topbar" name="mForm">
        <ul class="menu">
            <li><span class="topli" href="#" class="active">Home</span></li>
            <li><span class="topli" href="#">Message</span></li>
            <li><span class="topli" href="#">FreeBoard</span></li>
            <li><span class="topli" href="#">Ticket</span></li>
            <li><span class="topli" href="#">Gallery</span></li>
            <li class="slider"></li>
        </ul>
    </div>
    
    <div id="topText">
        <span class="topText" id="profile">${user.memberName}님 접속을 환영합니다.</span>
        <c:if test="${user.memberGrade == 'a'}">
        	<span class="topText" id="admin">admin</span>
		</c:if>
        <span class="topText" id="logout">logout</span>
    </div>
</div>

<script>

	$(".topli:eq(0)").click(function(){
		
	})
	
	$(".topli:eq(1)").click(function(){
    	location.href='<c:url value="/msg/maininbox.do"/>'
	})
	
	$(".topli:eq(2)").click(function(){
    	location.href='<c:url value="/board/list.do?pageNo=1"/>'
	})
	
	$(".topli:eq(3)").click(function(){
    	location.href='<c:url value="/ticket/list.do"/>'
	})
	
	$(".topli:eq(4)").click(function(){
    	location.href='<c:url value="/gallary/list.do"/>'
	})
	
	$("#profile").click(function() {
    	location.href='<c:url value="/member/myPage.do"/>'
	})
	
	$("#admin").click(function() {
     	location.href='<c:url value="/member/list.do"/>'
	})
	
	$("#logout").click(function() {
    	location.href='<c:url value="/member/logout.do"/>'
	})
	
</script>
</body>
</html>