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
	

</style>
</head>
<body>
	<c:import url="/WEB-INF/jsp/include/top.jsp" />

	<h2>자유 게시판</h2>
	<hr>
	<form action="write.do" method="post">
	<div id="header">
	 <h2>WRITE</h2>
	 <hr> 	 
	 <div id="title">
		<input class="form-control" type="text" placeholder="title">
	 </div>
	 <hr>
	</div>
	<!-- 이미지가 보이는 영역 -->
	<div id="imgPre">
		<img type="hidden" id="preview" src="" width="300" alt="pic">
	</div>
	<br>
	<br>
	<div id="main">
		 <textarea cols="130" rows="7">내용을 입력하세요</textarea>
		 <hr>
	</div>
	<!-- 이미지등록 -->
	<div class="custom-file" id="fileContent">
	  <input type="file" class="custom-file-input" id="customFile">
	  <label class="custom-file-label" for="customFile">file</label>
	</div>
	<br>
	<br>
	<div id="il">
		 <button type="button" class="btn btn-outline-secondary"><a href='write.do'>insert</a></button>
		 <button type="button" class="btn btn-outline-secondary"><a href='list.do'>list</a></button>
	</div>
	<hr>
	<br>
	<br>
	<br>
	</form>
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
        document.querySelector('#preview').src = reader.result ;
    }; 
}; 

</script>

</html>
















