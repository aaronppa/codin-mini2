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
</style>
</head>
<body>
	<div id="top-menu">
	<c:import url="../include/top.jsp" />
	</div>
	<form class="form-horizontal">
        <div class="form-group">
            <label for="searchText" class="col-md-2 control-label">검색어</label>
            <div class="col-md-8">
                <input type="text" class="form-control" id="searchText" placeholder="내용을 입력해주세요.">
            </div>
        </div>
        <div class="form-group">
            <label for="memberGrade" class="col-md-2 control-label">회원 구분</label>
            <div class="col-md-2">
                <select class="form-control" id="memberGrade">
                    <option>준회원</option>
                    <option>정회원</option>
                    <option>우수회원</option>
                </select>
            </div>
            <label for="regDateStart" class="col-md-1 control-label">가입일</label>
            <div class="col-md-2">
                <input type="text" class="form-control" id="regDateStart" placeholder="날짜를 입력해주세요.">
            </div>
            <div class="col-md-1 align-center">
                ~
            </div>
            <div class="col-md-2">
                <input type="text" class="form-control reg-date-to" id="regDateEnd" placeholder="날짜를 입력해주세요.">
            </div>
            <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
        </div>
        <div class="form-group">
            <div class="col-md-offset-9 col-md-2 align-center">
                <button type="submit" class="btn btn-primary">검색</button>
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
            <c:forEach var="member" items="${list}">
            	<tr>
            		<td>${member.memberNo}</td>
            		<td><a href="<c:url value='/member/detail.do?memberNo='/>${member.memberNo}">${member.memberName}</a></td>
            		<td>${member.memberEmail}</td>
            		<td>${member.memberGender}</td>
            		<td><fmt:formatDate value="${member.memberRegDate}" pattern="yyyy-MM-dd"/></td>
            		<td>${member.memberGrade}</td>
            		<td><a href="<c:url value='/member/deleteAccount.do?memberNo=' />${member.memberNo}">강퇴</a></td>
            	</tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>