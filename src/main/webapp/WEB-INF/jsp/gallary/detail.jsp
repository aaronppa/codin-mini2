<%@page import="kr.co.codin.repository.domain.GallComment"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="kr.co.codin.test.service.TestService"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	GallComment gallCom = new GallComment();
%>
<!DOCTYPE html> 
<html>
<head>
  <meta charset='utf-8'>
  <title>Gallary - 글 내용 - Codin</title>
  <%@ include file="/WEB-INF/jsp/include/basicInclude.jsp" %>
  <script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>

  <style>

	#header{
		text-align: center;
	}
	#main{
		text-align:center;
	}
	#udl{
		text-align: center;
	}
	#comment{
		text-align: center;
	}
	table{
		margin-left: auto;
		margin-right: auto;
	}
	#carouselExampleFade{
		width: 18rem;
		font-weight: bold;
	}
	#comWriter,#comRegDate{
		width:100px;
	}
	#comContent{
		width:600px;
	}
	#imgPre{
		transition: .5s;
	}
	#imgPre:hover{
		opacity: 0.5;
		}

  </style>
</head>
<body>
	<c:import url="/WEB-INF/jsp/include/top.jsp" />
	<div id="header">
		 <h2>DETAIL</h2>
		 <hr> 
		 <h3>${gall.gallTitle}</h3><br>
		 글쓴이 : ${gall.gallWriter}<br>
		 등록일 : <fmt:formatDate value="${gall.gallRegDate}" pattern="yyyy-MM-dd"/><br>
		 조회수 : ${gall.gallViewCnt }<br>
		<hr>
	</div>
	<!-- 슬라이드 시작 -->

	<div class="carousel-item">
	  <img src="..." alt="...">
	  <div class="carousel-caption d-none d-md-block">
	    <h5>...</h5>
	    <p>...</p>
	  </div>
	</div>
	<br>
	<br>


<!-- 슬라이드 끝 -->
	<div id="main">
		 <img id="imgPre" src="/codin_mini/gallimg/server${gall.gallNo}.jpg" width="400px" height="300px">
		 <br>
		 <br>
		 <br>
		 ${gall.gallContent}
		 <hr>
		 <form action="/gallary/like.do">
		 	<button type="button" class="btn btn-outline-danger" id="like-this">LikE tHiS!!</button>
		 </form>
		 <br>
		 <br>
	</div>
	<div id="udl">
		 <button type="button" class="btn btn-outline-secondary"><a href='updateForm.do?gallNo=${gall.gallNo }'>update</a></button>
		 <button id="deleteBtn" type="button" class="btn btn-outline-secondary"><a href='delete.do?gallNo=${gall.gallNo }'>delete</a></button>
		 <button type="button" class="btn btn-outline-secondary"><a href='list.do'>list</a></button>
	</div>
	<hr>
 	<h2 style="text-align: center;">댓글목록</h2>
 	<br>
 	
 	<!-- 댓글등록 -->
 	<form action="" name="insertComForm" id="insertComForm" method="post">
	 <div class="insertComGroup" style="text-align:center;">
	 	<input type="hidden" id="gallNo" name="gallNo" value="${gall.gallNo}"/>
	 	<input type="hidden" id="gallComWriter" name="gallComWriter" value="${user.memberName }">
		<h4>${user.memberName }</h4>
		<textarea name="gallComContent" id="gallComContent" rows="5" cols="150"></textarea>
		<button class="btn btn-primary" type="submit" id="insertCom">submit</button>
	 </div>
 	</form>
 	
	<!-- 댓글목록 -->
		<input type="hidden" name="gallNo" id="gallNo"value="${gall.gallNo }">	
		<input type="hidden" name="gallComNo" id="gallComNo" value="<%=gallCom.getGallComNo() %>"/>
		<br>
		<div name="comList" id="comList" >
			<table id="comTable">
				<tr id="comTr">
					<td id="comTd">
				</tr>
			</table>
		</div>
		<br>
		<br>
		<br>
	 
<script src="<c:url value='/resources/js/jquery-dateformat.js'/>"></script>	
 <script>
 	$("#like-this").click(function(){
 		alert('조아용')
 		$()
 	});
//  	$("#deleteBtn").click(function(){
// 	 	if("$(gall.gallWriter)!=$(user.memberName)"){ 		
// 		 		alert('아이디가 일치하지 않습니다.');
// 		 		return false;
// 	 	}
//  	});
	
	//댓글 등록
	$("#insertCom").click(function(){
		console.log("function")
		$.ajax({
			type:"post",
			url: "<c:url value='/gallary/insertCom.do'/>",
			data: $("#insertComForm").serialize(),
			success: onSuccess(),
			error: onError(),
			async:false
		});
		function onSuccess(json, status){
			
		};
		function onError(data,status){};
	});
	
	//댓글 리스트

	 	$.ajax({
			url: "<c:url value='/gallary/comList.do'/>",
// 	 		url: "/codin_mini/gallary/comList.do' />",
	 		//dataType: "json",
	 		type:"post",
	 		data: {gallNo:$("#gallNo").val()},
		 	}).done(function (result) {
	 		console.log("commentListSuccess")
	 		var object = Object.keys(result);
	 		var length = object.length;
	 		console.log(result);
	 		if($("#gallComWriter").val() == null){
	 			alert('로그인하셈')
	 		}else{
	 			for(var i = 0; i<length ;i++){
		 		$("#comList").append(
		 				"<table id='comTable' data-commentno='"+result[i].gallComNo+"'><tr>"
		 				+"<td id='comWriter' style='font-weight:bolder;' data-comwriter='"+result[i].gallComWriter+"'>"+result[i].gallComWriter+"</td>"
		 				+"<td id ='comContent' >"+result[i].gallComContent+"</td>"	
		 				+"<td id='comRegDate'>"
		 				//삭제버튼
		 				+$.format.date(result[i].gallComRegDate, 'yyyy-MM-dd HH:mm:ss')+"</td>"
		 				+"<td><button type='button' id='delBtn' class='close deleteComment' data-btnno='"+result[i].gallComNo+"' aria-label='Close' >"
		 				+"<span aria-hidden='true'>&times;</span>"
		 				+"</button><hr></td>"
		 				+"</tr><hr id='btw'></table>"
		 				)
	 			}
	 		}

	 	});
// 	 	.fail(function(result){
//  	 		alert(result);
// 	 	});
	
		$("#delBtn").on("click", function(e){
			console.dir($(this).parent().parent().parent().parent())
			console.dir($(this).parent().parent().parent().parent().data('commentno'))
			e.preventDefault();
			console.log($("#comTable").data("commentno")+" = 댓글번호")
			console.log($("#delBtn").data("btnno")+"= 버튼번호호")
			console.log($("#gallComNo").val()+"= 버튼번호호호")
			$.ajax({
				url:"<c:url value='/gallary/deleteCom.do'/>",
				data : {gallComNo : $(this).parent().parent().parent().parent().data('commentno')}
				}).done(function (result){
						$(this).parent().parent().parent().parent().remove();
				});
			return false;
		});
// 		$(".close.deleteComment").on("click", function(e){
// 			console.dir($(this).parent().parent().parent().parent())
// 			console.dir($(this).parent().parent().parent().parent().data('commentno'))
// 			e.preventDefault();
// 			console.log($("#comTable").data("commentno")+" = 댓글번호")
// 			console.log($("#delBtn").data("btnno")+"= 버튼번호호")
// 			console.log($("#gallComNo").val()+"= 버튼번호호호")
// 			$.ajax({
// 				url:"<c:url value='/gallary/deleteCom.do'/>",
// 				data : {gallComNo : $(this).parent().parent().parent().parent().data('commentno')}
// 				}).done(function (result){
// 						$(this).parent().parent().parent().parent().remove();
// 				});
// 		});
		
		
		
		
// 		//조회수
// 		$("#viewCnt").ready(function(){
// 			console.log('viewCntFunction');
// 			$.ajax({
// 				url:"<c:url value='/gallary/de'/>",
// 				data: {gallNo : $("#gallNo").val()},
// 				async:false,
// 				type:"post"
// 			}).done(function(data){
// 				alert('viewCntSuccess')
// 				$("#viewCnt").append(
// 						"<div>"+data.gallViewCnt+"명</div>"
// 						);
// 				console('viewCnt성공')
// 			}).fail(function(result){
// // 				alert("viewCntFail")
// 			});
// 		});
 </script>
</body>
</html>