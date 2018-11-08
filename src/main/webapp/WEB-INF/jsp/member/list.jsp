<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>회원목록</title>
<link rel="stylesheet" type="text/css" href="/codin_mini/resources/css/top.css" />
<script src="https://rawgit.com/moment/moment/2.2.1/min/moment.min.js"></script>
<style>
    #test {
        border: 1px solid black;
    }
    form {
        margin-top: 50px;
    }
    #regDateEnd {
        margin: 0;
        padding: 0;
        margin-right: 500px;
    }
    .align-center {
        text-align: center;
    }
    
    #top-menu {
    	height: 50px;
    }
    
    table {
   		margin-top: 50px;
   	}
</style>
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
</head>
<body>
	<div id="top-menu">
	<c:import url="../include/top.jsp" />
	</div>
	<form class="form-horizontal" id="search-form" action="search.do" method="post">
        <div class="form-group">
            <label for="memberGrade" class="col-md-2 control-label">회원 구분</label>
            <div class="col-md-2">
                <select class="form-control" id="memberGrade" name="memberGrade">
                	<option value="0">선택해주세요.</option>
                    <option value="1">준회원</option>
                    <option value="2">정회원</option>
                    <option value="3">우수회원</option>
                </select>
            </div>
<!--             <label for="regDateStart" class="col-md-1 control-label">가입일</label> -->
<!--             <div class="col-md-2"> -->
<!--                 <input type="text" class="form-control" id="regDateStart" placeholder="날짜를 입력해주세요."> -->
<!--             </div> -->
<!--             <div class="col-md-1 align-center"> -->
<!--                 ~ -->
<!--             </div> -->
<!--             <div class="col-md-2"> -->
<!--                 <input type="text" class="form-control reg-date-to" id="regDateEnd" placeholder="날짜를 입력해주세요."> -->
<!--             </div> -->
<!--             <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> -->
<!--         </div> -->
<!--         <div class="form-group"> -->
            <label for="searchText" class="col-md-1 control-label">검색어</label>
            <div class="col-md-5">
                <input type="text" class="form-control" id="searchText" placeholder="내용을 입력해주세요." name="memberId">
            </div>
<!--         </div> -->
<!--         <div class="form-group"> -->
            <div class="col-md-1">
                <button class="btn btn-primary">검색</button>
            </div>
        </div>
    </form>
    
    <div class="col-md-offset-1 col-md-10">
        <table class="table table-hover">
            <tr>
                <th>회원번호</th>
                <th>회원이름</th>
                <th>이메일</th>
                <th>성별</th>
                <th>가입일</th>
                <th>회원구분</th>
                <th>강퇴</th>
            </tr>
	            <c:forEach var="member" items='${list}'>
	            	<tr>
	            		<td>${member.memberNo}</td>
	            		<td>
	            			<c:choose>
	            				<c:when test="${member.memberGrade eq 'a'}">
	            					<a href="<c:url value='/member/myPage.do'/>">${member.memberName}</a>
	            				</c:when>
	            				<c:otherwise>
			            			<a href="<c:url value='/member/detail.do?memberNo='/>${member.memberNo}">${member.memberName}</a>
	            				</c:otherwise>
	            			</c:choose>
	            		</td>
	            		<td>${member.memberEmail}</td>
	            		<td>${member.memberGender}</td>
	            		<td><fmt:formatDate value="${member.memberRegDate}" pattern="yyyy-MM-dd"/></td>
	            		<td>
	            			<c:choose>
		                		<c:when test="${member.memberGrade eq '1'}">준회원</c:when>
		                		<c:when test="${member.memberGrade eq '2'}">정회원</c:when>
		                		<c:when test="${member.memberGrade eq '3'}">우수회원</c:when>
		                		<c:when test="${member.memberGrade eq 'a'}">관리자</c:when>
		                	</c:choose>
	            		</td>
	            		<td><a href="<c:url value='/member/deleteAccount.do?memberNo=' />${member.memberNo}">강퇴</a></td>
	            	</tr>
	            </c:forEach>
        </table>
    </div>

<!--     <div class="col-md-offset-1 col-md-10"> -->
<!--         <table class="table table-hover"> -->
<!--             <tr> -->
<!--                 <th>회원번호</th> -->
<!--                 <th>회원이름</th> -->
<!--                 <th>이메일</th> -->
<!--                 <th>성별</th> -->
<!--                 <th>가입일</th> -->
<!--                 <th>회원구분</th> -->
<!--                 <th>강퇴</th> -->
<!--             </tr> -->
<%-- 	            <c:forEach var="member" items='${slist}'> --%>
<!-- 	            	<tr> -->
<%-- 	            		<td>${member.memberNo}</td> --%>
<!-- 	            		<td> -->
<%-- 	            			<c:choose> --%>
<%-- 	            				<c:when test="${member.memberGrade eq 'a'}"> --%>
<%-- 	            					<a href="<c:url value='/member/myPage.do'/>">${member.memberName}</a> --%>
<%-- 	            				</c:when> --%>
<%-- 	            				<c:otherwise> --%>
<%-- 			            			<a href="<c:url value='/member/detail.do?memberNo='/>${member.memberNo}">${member.memberName}</a> --%>
<%-- 	            				</c:otherwise> --%>
<%-- 	            			</c:choose> --%>
<!-- 	            		</td> -->
<%-- 	            		<td>${member.memberEmail}</td> --%>
<%-- 	            		<td>${member.memberGender}</td> --%>
<%-- 	            		<td><fmt:formatDate value="${member.memberRegDate}" pattern="yyyy-MM-dd"/></td> --%>
<%-- 	            		<td>${member.memberGrade}</td> --%>
<%-- 	            		<td><a href="<c:url value='/member/deleteAccount.do?memberNo=' />${member.memberNo}">강퇴</a></td> --%>
<!-- 	            	</tr> -->
<%-- 	            </c:forEach> --%>
<!--         </table> -->
<!--     </div> -->
    
    
    
    <script>
//     	$("#search-form").submit(function (e) {
//     		e.preventDefault();
// //     		alert($(this).serialize());
//     		$.ajax({
//     			url: "<c:url value='/member/search.do' />",
//     			method: "POST",
//     			dataType: "json",
//     			data: $(this).serialize()
//     		}).done(function(result) {
//     			console.dir(result);
// //     			$("#slist").css("display", "block");
// //     			search(result);
//     		});
//     	});
    	
    	function search(data) {
    		$("#result").html(
    				"<tr>"+
                    "<th>회원번호</th>"+
                    "<th>회원이름</th>"+
                    "<th>이메일</th>"
                    +"<th>성별</th>"
                    +"<th>가입일</th>"
                    +"<th>회원구분</th>"
                    +"<th>강퇴</th>"
                	+"</tr>"
    		);
			for (var i = 0; i < data.length; i++) {
				$("#result").append(
					   "<tr>"
	                  + "<td>" +  data[i].memberNo + "</td>"   
	                  + "<td><a href='/codin_mini/member/detail.do?memberNo=" + data[i].memberNo + "'>" + data[i].memberName + "</a></td>"
	                  + "<td>" +  data[i].memberEmail + "</td>"   
	                  + "<td>" +  data[i].memberGender + "</td>"   
	                  + "<td>" + moment(data[i].memberRegDate).format("YYYY-MM-DD") + "</td>"   
	                  + "<td>" +  data[i].memberGrade + "</td>"   
	                  + "<td><a href='/codin_mini/member/deleteAccount.do?memberNo=" + data[i].memberNo + "'>강퇴</a></td>"   
	                  + "</tr>"
				);
			}		
    	};
    </script>
</body>
</html>