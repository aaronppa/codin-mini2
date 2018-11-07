<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/jsp/include/basicInclude.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>




<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
#divtable {
	width: 60%;
	position: absolute;
	margin-left: 20%;
	margin-top: 120px;
}

table>thead>tr>th, table>tbody>tr>td {
	text-align: center;
}

#recom {
	color: blue;
	font-weight: bold;
}

#opposite {
	color: red;
	font-weight: bold;
}

#button {
	color: black;
}

#selectorMenu {
	margin-top: 90px;
	position: absolute;
	width: 60%;
	margin-left: 20%;
	height: 30px;
}

#selectList {
	width: 30px;
	margin-top: 50px;
}

#selectForm {
	width: 440px;
	float: right;
}

#reportList {
	width: 120px;
	visibility: hidden;
	position: relative;
	float: left;
}
</style>
<script>

$(document).ready(function(){

	console.log($(location).attr('search').substring(8));
	
	$.ajax({
 		url:"<c:url value='/board/ajaxPagingListForm.do'/>",
 		type:"get",	
 		data:{pageNo:$(location).attr('search').substring(8)}
 	}).done(function(result){
 	
 		
 		$.ajax({
 			url:"<c:url value='/board/ajaxPaingList.do'/>",
 			type:"get" 			
 		}).done(function(result){
 			/* console.log(result);
 			var lastPage=result; */
 			for(var i=1; i<=result;i++ ){
 				console.log(i);
 				$("#pagingDiv").append("<ul class='pagination'><li><a href='/codin_mini/board/listForm.do?pageNo="+i+"'>"+i+"</a><li></ul>");
 			}
 			
 		}).fail(function(result){
 			alert("실패")
 		})
 		
 	

 	}).fail(function(result){
 		alert(result);
 		
 	})
})
</script>
</head>
<body>
	<c:import url="/WEB-INF/jsp/include/top.jsp" />
	<div style="position: relative;top 100px;">${user.memberId}
		hjkhhj</div>
	<div id="selectorMenu">



		<span id="selectList">

			<form id="reportList">
				<button>
					<img src="/codin_mini/resources/img/KakaoTalk20181028224537696.gif"
						style="height: 25px;">
				</button>
			</form>

			<form id="selectForm" method="post">
				<select id="item" style="height: 30px;">
					<option>제목</option>
					<option>닉네임</option>
					<option>내용</option>
					<option>내가 쓴 글 검색</option>
				</select> <input type="text" name="search" style="height: 30px;"> <select
					id="selectDate" style="height: 30px;">
					<option>기간선택</option>
					<option>최근 1개월</option>
					<option>최근 3개월</option>
					<option>최근 6개월</option>
					<option>최근 1년</option>
					<option>전체검색</option>
				</select>
				<button id="button" style="float: right;">
					<img src="/codin_mini/resources/img/KakaoTalk20181028222543606.gif"
						style="height: 25px;">
				</button>
			</form>
		</span>
	</div>


	<div id="divtable">

		<table class="table table-striped">
			<thead>
				<tr>
					<th><select id="category">
							<option>카테고리</option>
							<option>자유</option>
							<option>고민</option>
							<option>하소연</option>
							<option>감성</option>
							<option>질문</option>
					</select></th>
					<th>글번호</th>
					<th>제목</th>
					<th>닉네임</th>
					<th><a href="#">조회수순</th>
					<th><a href="# ">추천순</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="b" items="${board}">
					<tr>


						<td>${b.categoryNo}</td>
						<td>${b.boardNo}</td>
						<td><a
							href="/codin_mini/board/detail.do?boardNo=${b.boardNo}">${b.boardTitle}</a>

						</td>
						<td>${b.boardId}</td>
						<td>${b.boardViewCnt}</td>
						<td><span id="recom">1</span>/<span id="opposite">2</span></td>
						<td><fmt:formatDate value="${b.boardDate}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>


					</tr>
				</c:forEach>
			</tbody>
		</table>


		<hr>
		
		<a
			class="btn btn-default pull-right"
			href="<c:url value='/board/writeForm.do'/>"><img
			src="/codin_mini/resources/img/KakaoTalk20181028221348368.gif"
			style="height: 25px;" /></a>
			<br>
		<div  class="text-center" id="pagingDiv">
			
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


</body>
</html>