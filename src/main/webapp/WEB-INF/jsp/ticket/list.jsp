<%@page import="kr.co.codin.ticket.service.TicketServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/include/basicInclude.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내가 받은 티켓 - Codin</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value='/resources/css/ticket/ticketList.css'/>">
    <script
    src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>

</head>
<body>
	<c:import url="/WEB-INF/jsp/include/top.jsp" />
	<div style="height: 50px"></div>
    <div id="container">
        <h2>내가 받은 티켓</h2>
        <ul id="ticketTop">
        	<li class="rightMargin">내가 받은 티켓</li>
        	<li class="rightMargin">내가 보낸 티켓</li>
        	<li>티켓 발급</li>
        </ul>
        
        <hr>
        <table>
            <thead>
                <tr>
                    <th>발급 번호</th>
                    <th>제목</th>
                    <th>발급자</th>
                    <th>만료일</th>
                    <th>난이도</th>
                    <th>진행도</th>
                    <th>비고</th>
                </tr>
            </thead>
            <tbody id = ticketList>
               	<c:forEach var="ticket" items="${list}">
			    <tr>
					<td class="ticketNo">${ticket.ticketNo}</td>
					<td><span class="detail">${ticket.ticketTitle}</a></td>
					<td>${ticket.member.memberName }</td>
				    <td class="ticketDate">
					    <fmt:parseDate var="ticketEnd" value="${ticket.ticketEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>
   					    <fmt:formatDate value="${ticketEnd}" pattern="yyyy/MM/dd"/>
				    </td>
<%-- 				    <td>${ticket.ticketEnd}</td> --%>
				    <td>
				    	<c:choose>
				    		<c:when test="${ticket.ticketDifficulty == '1'}">
								하
				    		</c:when>
				    		<c:when test="${ticket.ticketDifficulty == '2'}">
								중
				    		</c:when>
				    		<c:when test="${ticket.ticketDifficulty == '3'}">
								상
				    		</c:when>
				    	</c:choose>
				    
				    </td>
				    <td><span class="ticketProgress">${ticket.ticketProgress}</span>%</td>
				    <td class="remarks"></td>
				</tr>
				</c:forEach>
            </tbody>
        </table>
   		<c:import url="/WEB-INF/jsp/ticket/ticketPageing.jsp"></c:import>
        <div id="buttonArea">
            <button type="button" id="issue">티켓 발급</button>
        </div>
        <script>
        $("#ticketTop > li:eq(0)").click(function(){
        	location.href='<c:url value="/ticket/list.do"/>'
        })
        
        $("#ticketTop > li:eq(1)").click(function(){
        	location.href='<c:url value="/ticket/sendList.do"/>'
        })
        
        $("#ticketTop > li:eq(2)").click(function(){
	    	window.open("/codin_mini/ticket/issue.do", "issue", "width=1030, height=700, location=no");
        })
        
	    $("#issue").click(function () {
	    	window.open("/codin_mini/ticket/issue.do", "issue", "width=1030, height=700, location=no");
	    })
	    
	   	var $ticketDate = $(".ticketDate");
	   	
	   	const TODAY = new Date();
	    
	   	for (let i = 0; i < $ticketDate.length; i++) {
	   		let ticketDate = new Date($ticketDate[i].textContent.trim())
			
			if ((TODAY - ticketDate) > 0) {
				if (TODAY.getDate() == ticketDate.getDate()) {
					$ticketDate.eq(i).parent().addClass("today");
					$ticketDate.eq(i).parent().children(".remarks").text("오늘 마감")
				} else {
  					$ticketDate.eq(i).parent().addClass("overdate")
					$ticketDate.eq(i).parent().children(".remarks").text("날짜 경과")
				}
	   		}
			
	   	}
	    
	   	var $ticketProgress = $(".ticketProgress");
// 	   	console.dir($ticketProgress);
	   	
	   	for (let i = 0; i < $ticketProgress.length; i++) {
	   		console.log(i, parseInt($ticketProgress[i]).textContent)
	   		
	   		if (parseInt($ticketProgress[i].textContent) == 100) {
	   			$ticketProgress.eq(i).parent().parent().addClass("complete")
				$ticketProgress.eq(i).parent().parent().children(".remarks").text(" ")

	   		}
	   		
	   	}
	   	
	   	$(".detail").click(function() {
			var ticketNo = $(this).parent().parent().children(".ticketNo").html()
	   		window.open("/codin_mini/ticket/detail.do?ticketNo="+ticketNo, "detail", "width=1030, height=700, location=no");		
	   	})
	   	
	   		   	
		$("nav > ul.pagination > li > a").click (function(e) {
			e.preventDefault();
			
			var pageNo = $(this).attr("href")
			
			if (pageNo == 0 || pageNo == ${pageResult.endPage + 1}) return false;
			location.href = "list.do?pageNo=" + pageNo;
		})

        </script>
</body>
</html>