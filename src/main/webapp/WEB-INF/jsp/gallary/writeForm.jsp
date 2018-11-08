<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/jsp/include/basicInclude.jsp" %>
<style>
	#header{
		text-align: center;
	}
	#main{
		text-align:center;
	}
	#il{
		text-align: center;
	}
	#comment{
		text-align: center;
	}
	table{
		margin-left: auto;
		margin-right: auto;
	}
	#title{
		width:600px;
		margin-left: auto;
		margin-right: auto;
		}
	#imgPre{
		text-align: center;
	}
	#fileContent{
		text-align: center;

	}
	.custom-file-label{
		width:200px;
	}
	#preview1:hover{
		opacity:0.5;
	}
</style>
</head>
<body>
	<c:import url="/WEB-INF/jsp/include/top.jsp" />

	<h2>자유 게시판</h2>
	<hr>
	<form action="<c:url value='/gallary/write.do' />" method="post" enctype="multipart/form-data">
<%-- 		<input type="hidden" id="gallNo" name="gallNo" value="${gall.gallNo }"> --%>
		<div id="header">
		 <h2>WRITE</h2>
		 <hr>
		 <!-- ID value값을 표시 -->
		 <h2>ID : ${user.memberName}</h2>
			<%-- 		  
			readonly : 값을 변경 못하게 고정시켜놓음
			<input name="gallWriter" value="${user.memberName }" readonly> 
			--%>
			<!-- id value값을 제출 -->
		  <input name="gallWriter" value="${user.memberName}" type="hidden">
		 <div id="title">
			<input name="gallTitle" class="form-control" type="text" placeholder="title">
		 </div>
		 <hr>
		</div>
		<!-- 이미지가 보이는 영역 -->
		<div id="imgPre">
			<img type="hidden" id="preview1" src="/codin_mini/gallimg/no-image.jpg" width="380px" height="300px" alt="pic" >
		</div>
		<br>
		<br>
		<div id="main">
			 <textarea name="gallContent" cols="130" rows="7" placeholder="내용을 입력하세요"></textarea>
		</div>
			 <hr>
		<!-- 이미지등록 -->
		<br>
		<br>
		<div class="custom-file" id="fileContent">
		  <input type="file" class="custom-file-input" name="attach" id="customFile" >
		  <label class="custom-file-label" for="#customFile" name="msg">file</label>
		</div>
		<div id="il">
			 <input class="btn btn-primary" type="submit" value="Submit">
			 <button type="button" class="btn btn-outline-secondary"><a href='list.do'>list</a></button>
		</div>
	</form>
		
	<hr>
	<br>
	<br>
	<br>

</body>
<script>
	var file = document.querySelector('#customFile');
	
	file.onchange = function () { 
	    var fileList = file.files ;
	    
	    // 읽기
	    var reader = new FileReader();
	    reader.readAsDataURL(fileList [0]);
	
	    //로드 한 후
	   
	    reader.onload = function  () {
	        document.querySelector('#preview1').src = reader.result ;
	        $("#preview1").css("width","400px");
	    	$("#preview1").css("height","300px");
	    }; 

	}; 
	//파일등록
// 	$("#fileUpload").click(function(){
// 		var files = $("input[name='fileOriName']")[0].files;
// 		var fd = new FormData();
	

// 		function sendFile(file, el){
// 		$.ajax({
// 			url : "/codin_mini/gallary/write.do",
// 			data : {gallNo:$("#gallNo").val()},
// 			type : "post",
// 			cache : false,
// 			contentType : false,
// 			processData : false,
// 			encType: 'multipart/form-data',
// 			success : function(data){
// 				alert(data);
// 				$("#customFile").val(data);
// 			}
// 		});
// 		};
// 	});
	



</script>

</html>
















