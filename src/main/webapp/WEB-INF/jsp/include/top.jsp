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
    <div class="topbar" name="mForm">
        <ul class="menu">
            <li><a href="#" class="active">Home</a></li>
            <li><a href="#">Message</a></li>
            <li><a href="#">FreeBoard</a></li>
            <li><a href="#">Ticket</a></li>
            <li><a href="#">Gallery</a></li>
            <li class="slider"></li>
        </ul>
    </div>
    
    <div id="topText">
        <span><c:out value="${user.memberName}"/>(<c:out value="${user.memberId}" />)님 접속을 환영합니다.</span>
    	<c:if test="${user.memberGrade == 'a' }" >
        <a href="#">admin</a>
        </c:if>
        <a href="<c:url value='/testmsg/logout.do'/>">LOGOUT</a>
    </div>
</body>
</html>