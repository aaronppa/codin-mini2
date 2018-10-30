<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html> 
<html>
<head>
  <meta charset='utf-8'>
  <title>자유게시판</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
</head>
<body>
	 <h2>DETAIL</h2>
	 <hr> 
	 번호 :  1<br>
	 글쓴이 : 부엉이<br>
	 제목 : 구구구구<br>
	 등록일 : 2018-18-18<br><br>  
	 조회수 : 69<br>
	 <img src="./img/aaaa.jpg">
	 <br>
	 구루국구구루루ㅜ루루구구구구루ㅜ루구ㅜ
	 <hr />
	 <a href='updateForm.jsp?no=${board.no}'><input class="btn btn-default" type="button" value="수정"></a>
	 <a href='delete.jsp?no=${board.no}'><input class="btn btn-default" type="button" value="삭제"></a>
	 <a href='list.jsp'><input class="btn btn-default" type="button" value="목록"></a>
	 
	 <div>
	 	<h2>댓글목록</h2>
 		<textarea rows="5" cols="150"></textarea>
 		<button>등록</button>
	 	<table name="commentTable">
	 		<tr>
	 			<td style="font-weight: bolder;">으갹</td>
	 			<td>으갹갸갸갸갸ㅑ갸ㅑ갸ㅑㅑ</td>
	 		</tr>	 	
	 	</table>
	 	
	 </div>
	 <script>
	 </script>
</body>
</html>