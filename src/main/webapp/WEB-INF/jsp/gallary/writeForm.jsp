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
	<h2>자유 게시판</h2>
	<hr>
	<form action="write.do" method="post">
		<div>
			제목 : <input type="text" name="title" />
		</div>
		<div>
			작성자 : <input type="text" name="writer" />
		</div>
		<div>
			내용 : 
			<textarea name="content" rows="8" cols="70"></textarea>
		</div>
		<button>등록</button>
		<a href="list.jsp">목록</a>
	</form>
</body>
</html>
















