<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html> 
<html>
<head>
  <meta charset='utf-8'>
  <title>자유게시판</title>
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
	#title{
		width:600px;
		margin-left: auto;
		margin-right: auto;
	}
  </style>
</head>
<body>
	<c:import url="/WEB-INF/jsp/include/top.jsp" />
	<div id="header">
	 <h2>DETAIL</h2>
	 <hr> 
	 <div id="title">
	 	<input type="text" id="title" value="제목을 입력하세요"/>
	 </div>
	 <hr>
	</div>
	<div id="main">
		 <img src="/codin_mini/gallimg/aaaa.jpg">
		 <br>
		 <br>
		 <textarea cols="130" rows="7">내용을 입력하세요</textarea>
		 <hr>
	</div>
	<div id="udl">
		 <button type="button" class="btn btn-outline-secondary"><a href='write.do'>insert</a></button>
		 <button type="button" class="btn btn-outline-secondary"><a href='list.do'>list</a></button>
	</div>
	<hr>
	<br>
	<br>
	<br>
	 	
	 <script>
	 </script>
</body>
</html>