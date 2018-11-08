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
<script src="<c:url value='/resources/js/jquery-dateformat.js'/>"></script>	

</head>
<body>
<c:import url="/WEB-INF/jsp/include/top.jsp" />
	<!-- 게시물 목록 표현하기 -->
	<h2>PHOTO</h2>
	<h2></h2>
	<hr>
	<div id="writeBtn">
		<button type="button" class="btn btn-outline-secondary"><a href="<c:url value='/gallary/writeForm.do'/>" >write</a></button>
	</div>
	<br>
<%-- 	<input type="hidden" id="gallNo" name="gallNo" value="${gall.gallNo }"> --%>
	<table>
	<!-- 반복문 -->
	<tbody>
		<c:forEach var="g" items="${gall}" varStatus="loop"> 
			<c:if test="${loop.count % 3 == 1}">
				<tr id="tr">
			</c:if>
				<td id="td">
					<div class="card" style="width: 18rem;">
					<a id = "imglist" href="<c:url value='/gallary/detail.do?gallNo=${g.gallNo}'/>" >
					  <img class="card-img-top" src="/codin_mini/gallimg/server${g.gallNo }.jpg" alt="Card image cap">
					 </a> 
					  <div class="card-body">
					    <p class="card-text"><h3>${g.gallTitle}</h3></p>
					    <p class="card-text">by ${g.gallWriter}</p>
					  </div>
					</div>
				</td>		
			<c:if test="${loop.count % 3 == 0}">
				</tr>
			</c:if>
		</c:forEach>
		<c:if test="${gall.size() % 3 != 0}">
		 </tr>
		</c:if>
	</tbody>
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
<script>
// 	$ajax({
// 		url : "<c:url value='/gallary/uploadFile.do'/>",
// 		type : "post",
// 		data : {gallNo : $("#gallNo").val()},

// 	}).done(function(result){
// 		console.log("사진나와라")
// 		var object = Object.keys(result);
// 		var length = object.length;
// 		console.log(result)
// 		for(var i = 0; i<length; i++){
// 			$("#imglist").append(
// 				"<img class='card-img-top' src='/codin_mini/gallimg/"+result[i].fileServerName+".jpg' alt='Card image cap'>"
// 			)
// 		}
// 	});

</script>
</body>
</html>












