<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<%@ include file="/WEB-INF/jsp/include/basicInclude.jsp" %>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  
  
  

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	height: 400px;
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

					<th>제목:</th>
					<td colspan="3">${board.boardTitle}</td>
				</tr>
				<tr>
					<th>작성자:</th>
					<td>${board.boardWriter}</td>
				</tr>
				<tr>
					<th>작성일:</th>
					<td>${board.boardDate }</td>

				</tr>
				<tr>
					<td id="content" colspan="4">
					${board.boardContent}</td>
				</tr>

			</tbody>

		</table>

		<div id="comDiv">
			<table id="commentList">
				<thead>
					<tr>
						<th colspan="6">댓글리스트</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th >코딩러:</th>
						<td >글이참재미있어요</td>


						<td>등록시간</td>
						<td>2018-10-28 10:28</td>
						<td>
							<form style="float: right">
								<button id="wrtieRerecom">
									<img
										src="/codin_mini/resources/img/KakaoTalk20181028221334614.gif"
									 />
								</button>
							</form>
						</td>

						<td>
							<form style="float: left">

								<button>
									<img
										src="/codin_mini/resources/img/KakaoTalk20181028221325536.gif"
									>
								</button>
							</form>
						</td>

					</tr>
					<tr>

					</tr>


					<tr>

						<td colspan="10"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<span> <img
			src="/codin_mini/resources/img/KakaoTalk20181028215011885.gif"
			 /> <textarea id="textarea"></textarea>
			<button>
				<img src="/codin_mini/resources/img/KakaoTalk20181028221348368.gif"
			 />
			</button>
		</span> <br> <br>



		<button>
			<img src="/codin_mini/resources/img/KakaoTalk20181028221340213.gif"
				 />
		</button>

		<button>
			<img src="/codin_mini/resources/img/KakaoTalk20181028221334614.gif"
			 />
		</button>

		<button>
			<img src="/codin_mini/resources/img/KakaoTalk20181028221325536.gif"
			 />
		</button>
		
	</div>
 
</body>
</html>