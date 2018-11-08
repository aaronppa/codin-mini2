<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<%@ include file="/WEB-INF/jsp/include/basicInclude.jsp" %>
 <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
  
 
  

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

	<script src="<c:url value="/resources/js/jquery-dateformat.js"/>"></script>
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<style>
#divtable {
	width: 60%;
	height: 600px;
	position: relative;
	top: 50px; 
	border: 1px solid black;
	margin-left: 20%;
}

tr th {
	border: 1px solid #f9f9f9;
	background: #f9f9f9;
}

#divtable>#detailTatble {
	width: 100%;
	height: 200px;
}

#commentList {
	width: 100%;
}

th {
	text-align: center;
}

#textarea {
	width: 800px;
	resize: none;
}

#content {
	overflow-y: scroll;
	height: 450px;
	height: 500px;
	text-align-last: left;
	vertical-align: 0%;
}

#comDiv {
	border: solid 1px #494749;
}

#detailTable {
	width: 100%;
}
img{
	height:40px;
}
</style>

<script>

$(document).ready(function(){
	$.ajax({
 		url:"<c:url value='/board/selectComment.do'/>",
 		type:"post",	
 		data:{boardNo:$("#boardNo").val()}
 	}).done(function(result){
 		console.log(result);
 	//	console.log(result[0])
 		//console.log(result);
 	
 		var object = Object.keys(result)
 		var length = object.length;
 		//console.log(result[0].commentDate);
 		var date = new Date(result[0].commentDate);
 		console.log(date);
 		//console.log("시간"+sysdate);
 		//var length = result.length();
 		//console.log(length);
 		for(var i=0 ;i<length ; i++){
 			var sysdate =new Date(result[i].commentDate);
 			var tr = $("#ComTable").append("<tr style='height:50px'><td>"+result[i].commentId+"</td>"+"<td>"+result[i].commentContent+"</td><td>"+ $.format.date(result[0].commentDate,"yyyy-MM-dd HH:mm:ss")  +"</td>");			
 		
 		}

 	}).fail(function(result){
 		alert(result);
 		
 	})
})
</script>
</head>

<body>

	<c:import url="/WEB-INF/jsp/include/top.jsp" />

	<!----------------------------------------------------------->
	<div id="divtable">
		<table id="detailTable" >

			<tbody>
				
				<tr>
					<th >글번호</th>
					<td>${board.boardNo}</td>
					<th >조회수</th>
					<td >${board.boardViewCnt}</td>

				</tr>
				<tr>

					<th >제목:</th>
					<td colspan="3">${board.boardTitle}</td>
				</tr>
				<tr>
					<th>작성자:</th>
					<td>${board.boardWriter}</td>
				</tr>
				<tr>
					<th>작성일:</th>
					<td><fmt:formatDate value="${board.boardDate }" pattern="yyyy-MM-dd"/></td>

				</tr>
				<tr>
					<td id="content" colspan="4">
					${board.boardContent}</td>
				</tr>

			</tbody>

		</table>

		<div id="comDiv">
			<table id="ComTable">
			
			</table>
				
		</div>		
		<div> 
			<form id='form' method="post"  name="BoardComment">
				<input  id="memberId"  type="hidden" name="commentId" value="${user.memberId}">
				<input id="boardNo" type="hidden" name="boardNo" value="${board.boardNo }">
				<img src="/codin_mini/resources/img/KakaoTalk20181028215011885.gif"/> 
				<textarea   id="textarea" name="commentContent"></textarea>
				<button id="CommentWriteBtn">
					<img src="/codin_mini/resources/img/KakaoTalk20181028221348368.gif"/>
				</button>
			</form>
		</div> 		
		<br> 
		<br>
		<button id="goTolist" >
			<img src="/codin_mini/resources/img/KakaoTalk20181028221340213.gif"
				 />
		</button>

		<button id="updateList" >
			<img src="/codin_mini/resources/img/KakaoTalk20181028221334614.gif"
			 />
		</button>

		<button id="deleteContent" >
			<img src="/codin_mini/resources/img/KakaoTalk20181028221325536.gif"
			 />
		</button>
		
	</div>
	
<!-- 	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>  -->
 	<script>
 
 	
 	
 	//댓글 출력 함수
 	
 	
	$("#CommentWriteBtn").click(function(){
		
		
		$.ajax({
			url:"<c:url value='/board/CommentForm.do'/>",
			type:"post",
			data:$("#form").serialize()
		}).done(function(result){
			
		}).fail(function(result){
			$("")
		})
		
 	})
 	
   	$("#goTolist").click(function(e){
 		e.preventDefault();
 		location.href="/codin_mini/board/list.do?pageNo=1";
 	}) 
 	
 	$("#deleteContent").click(function(e){
 		e.preventDefault();
 		location.href="/codin_mini/board/deleteForm.do?boardNo=${board.boardNo}&boardId=${user.memberId}";
 		
 	}) 
 	
	$("#updateList").click(function(e){
		e.preventDefault();
 		var url="http://localhost:8000/board/updateForm.do";
 		var tableValue= $("#detailTable").val();
 		location.href="/codin_mini/board/updateForm.do?boardNo=${board.boardNo}";
 	}) 
 	 
 	</script>
</body>
</html>