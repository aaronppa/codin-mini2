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
	#imgPre{
		width:400px;
		height: 300px;
		transition: .5s;
	}
	.custon-file{
		text-align: center;
	}
	.custom-file-label{
		width:200px;
	}
	#main > img:hover { 
		opacity: 0.5;
	 }
  </style>
</head>
<body>
	<form action="<c:url value='/gallary/update.do'/>" method="post">
		<c:import url="/WEB-INF/jsp/include/top.jsp" />
		<div id="header">
		 <h2>UPDATE</h2>
		 <hr> 
		 <input type="hidden" name="gallNo" value="${gall.gallNo}"/>
		 <h2>${gall.gallWriter }</h2>
		 <input type="hidden" id="gallWriter" value="${gall.gallWriter}">
		 <div id="title">
		 	<input type="text" name="gallTitle" value="${gall.gallTitle}" placeholder="제목을 입력하세요"/>
		 </div>
		 <hr>
		</div>
		<div id="main">
<!-- 			<div id="imgPre"> -->
<%-- 				<img type="hidden" id="preview1" src="/codin_mini/gallimg/server${gall.gallNo }.jpg" width="300" alt="pic" > --%>
<!-- 			</div> -->
			<img type="hidden" id="preview1" src="/codin_mini/gallimg/server${gall.gallNo }.jpg" width="400px" height="300px" alt="pic" >
<%-- 			 <img type="hidden" id="imgPre" src="/codin_mini/gallimg/server${gall.gallNo }.jpg"> --%>
			 <br>
			 <br>
			 <textarea name="gallContent" cols="130" rows="7" placeholder="내용을 입력하세요">${gall.gallContent}</textarea>
			 <hr>
		</div>
		<div class="custom-file" id="fileContent">
		  <input type="file" class="custom-file-input" name="attach" id="customFile" >
		  <label class="custom-file-label" for="#customFile" name="msg">file</label>
		</div>
		<div id="udl">
			 <button class="btn btn-primary" type="submit">submit</button>
			 <button type="button" class="btn btn-outline-secondary"><a href='list.do'>list</a></button>
		</div>
		<hr>
		<br>
		<br>
		<br>
	</form>
	 	
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
	 </script>
</body>
</html>