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
	#carouselExampleFade{
		width: 18rem;
	}

  </style>
</head>
<body>
	<c:import url="/WEB-INF/jsp/include/top.jsp" />
	<div id="header">
		 <h2>DETAIL</h2>
		 <hr> 
		 <h3>구구구구</h3><br>
		 글쓴이 : 부엉이<br>
		 등록일 : 2018-18-18<br>
		 조회수 : 69<br>
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



<!-- 슬라이드 끝 -->
	<div id="main">
		 <img src="/codin_mini/gallimg/aaaa.jpg">
		 <br>
		 구루국구구루루ㅜ루루구구구구루ㅜ루구ㅜ
		 <hr>
	</div>
	<div id="udl">
		 <button type="button" class="btn btn-outline-secondary"><a href='updateForm.do'>update</a></button>
		 <button type="button" class="btn btn-outline-secondary"><a href='delete.do'>delete</a></button>
		 <button type="button" class="btn btn-outline-secondary"><a href='list.do'>list</a></button>
	</div>
	<hr>
	 <div id="comment">
	 	<h2>댓글목록</h2>
	 	<br>
			<textarea rows="5" cols="150"></textarea>
			<button type="button" class="btn btn-light">insert</button>
	 </div>
	 	<table name="commentTable">
	 		<tr>
	 			<td style="font-weight: bolder;"><h2>으갹</h2></td>
	 			<td>으갹갸갸갸갸ㅑ갸ㅑ갸ㅑㅑ</td>
	 		</tr>	 	
	 	</table>
	 	<br>
	 	<br>
 <script>
	
 </script>
</body>
</html>