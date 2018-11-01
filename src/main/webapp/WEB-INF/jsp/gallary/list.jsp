<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/jsp/include/basicInclude.jsp" %>
<style>
	h2{
		text-align: center;
	}
	div{
		align-content: center;
	}
	img{

		margin-left: auto;
		margin-right: auto;
	}
	img:hover{

		margin-left: auto;
		margin-right: auto;
		opacity: 0.5;
	}
	table{
		width: 80%;
		height: 80%;
		margin-left: auto;
		margin-right: auto;
	}
	td{
		text-align: center;
	}
	#writeBtn{
		margin-left: auto;
		margin-right: auto;
		width:50px;
	}
	
</style>
</head>
<body>
<c:import url="/WEB-INF/jsp/include/top.jsp" />
	<!-- 게시물 목록 표현하기 -->
	<h2>PHOTO</h2>
	<hr>
	<div id="writeBtn">
		<button type="button" class="btn btn-outline-secondary"><a href="<c:url value='/gallary/writeForm.do'/>" >write</a></button>
	</div>
	<br>
	<table>
		<tr>
			<td>
				<div class="card" style="width: 18rem;">
				<a href="<c:url value='/gallary/detail.do'/>" >
				  <img class="card-img-top" src="/codin_mini/gallimg/aaaa.jpg" alt="Card image cap">
				 </a> 
				  <div class="card-body">
				    <p class="card-text">부엉이에요</p>
				  </div>
				</div>
			</td>
			<td>
				<div class="card" style="width: 18rem;">
				<a href="<c:url value='/gallary/detail.do'/>" >
				  <img class="card-img-top" src="/codin_mini/gallimg/aaaa.jpg" alt="Card image cap">
				 </a> 
				  <div class="card-body">
				    <p class="card-text">부엉이에요</p>
				  </div>
				</div>
			</td>
			<td>
				<div class="card" style="width: 18rem;">
				<a href="<c:url value='/gallary/detail.do'/>" >
				  <img class="card-img-top" src="/codin_mini/gallimg/aaaa.jpg" alt="Card image cap">
				 </a> 
				  <div class="card-body">
				    <p class="card-text">부엉이에요</p>
				  </div>
				</div>
			</td>
			<td>
				<div class="card" style="width: 18rem;">
				<a href="<c:url value='/gallary/detail.do'/>" >
				  <img class="card-img-top" src="/codin_mini/gallimg/aaaa.jpg" alt="Card image cap">
				 </a> 
				  <div class="card-body">
				    <p class="card-text">부엉이에요</p>
				  </div>
				</div>
			</td>
		</tr>
		<!-- 한 열 끝 -->
		<tr>
			<td>
				<div class="card" style="width: 18rem;">
				<a href="<c:url value='/gallary/detail.do'/>" >
				  <img class="card-img-top" src="/codin_mini/gallimg/aaaa.jpg" alt="Card image cap">
				 </a> 
				  <div class="card-body">
				    <p class="card-text">부엉이에요</p>
				  </div>
				</div>
			</td>
			<td>
				<div class="card" style="width: 18rem;">
				<a href="<c:url value='/gallary/detail.do'/>" >
				  <img class="card-img-top" src="/codin_mini/gallimg/aaaa.jpg" alt="Card image cap">
				 </a> 
				  <div class="card-body">
				    <p class="card-text">부엉이에요</p>
				  </div>
				</div>
			</td>
			<td>
				<div class="card" style="width: 18rem;">
				<a href="<c:url value='/gallary/detail.do'/>" >
				  <img class="card-img-top" src="/codin_mini/gallimg/aaaa.jpg" alt="Card image cap">
				 </a> 
				  <div class="card-body">
				    <p class="card-text">부엉이에요</p>
				  </div>
				</div>
			</td>
			<td>
				<div class="card" style="width: 18rem;">
				<a href="<c:url value='/gallary/detail.do'/>" >
				  <img class="card-img-top" src="/codin_mini/gallimg/aaaa.jpg" alt="Card image cap">
				 </a> 
				  <div class="card-body">
				    <p class="card-text">부엉이에요</p>
				  </div>
				</div>
			</td>
		</tr>
	</table>
	<br>
	<br>
	<!-- 페이징 -->
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	    <li class="page-item disabled">
	      <a class="page-link" href="#" tabindex="-1">Previous</a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#">Next</a>
	    </li>
	  </ul>
	</nav>
	<!-- 페이징 끝 -->
	<br>
	<br>
</body>
</html>












