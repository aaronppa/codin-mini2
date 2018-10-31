<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
	h2{
		text-align: center;
	}
	div{
		align-content: center;
	}
	img{
		margin-left: 60px;
		margin-top:30px;
		width:300px;
		height:250px;
	}
	img:hover{
		margin-left: 60px;
		margin-top:30px;
		width:300px;
		height:250px;
		opacity: 0.5;
	}

</style>
</head>
<body>
	<!-- 게시물 목록 표현하기 -->
	<h2>PHOTO</h2>
	<hr>
	<table>
	<div class="table">
	    <tr>
			<td><a href="/detail.jsp"><img src="/codin_mini/gallimg/aaaa.jpg" alt="경로 무엇..??" class="img-rounded"></a></td>
			<td><img src="/codin_mini/gallimg/camel.jpg" alt="경로 무엇..??" class="img-rounded"></td>
			<td><img src="/codin_mini/gallimg/sea.jpg" alt="경로 무엇..??" class="img-rounded"></td>
			<td><img src="/codin_mini/gallimg/sea2.jpg" alt="경로 무엇..??" class="img-rounded"></td>
		</tr>    
	</div>
	</table>
	<a href="writeForm.do">글쓰기</a>
</body>
</html>












