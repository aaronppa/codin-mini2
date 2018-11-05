<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>회원 상세 페이지입니다.</title>
<link rel="stylesheet" type="text/css" href="/codin_mini/resources/css/top.css" />
<style>
    table, tr, td{
        border-collapse: collapse;
        /* border: 1px solid black; */
    }

    .basics {
        width: 80%;
        margin-right : auto;
        margin-left : auto;

    }

    .form-control {
        width: 150px;
    }

    .career {
        width: 80%;
        margin-right : auto;
        margin-left : auto;
        
    }

    #tools {
        margin-left: 50px;
    }

    .imgTd {
        width: 170px;
    }
    th{
        font-size:large;
        width: 200px;
        text-align: center;
        height: 40px;
    }
    td {
        padding-left: 20px;
        width: 250px;
    }
    
    .save {
    	text-align: right;
    	margin-top: 50px;
    }
    
    a {
    	text-decoration: none !important;
    	color: white;
    }
    
    #top-menu {
    	height: 50px;
    }
    
    body {
    	font-size: 18px;
    }
</style>
</head>
<body>
	<div id="top-menu">
	<c:import url="../include/top.jsp" />
	</div>
	<form action="edit.do" method="post">
	                <input type="hidden" name="memberNo" value="${member.memberNo}" />
		<h2>기본 정보</h2>
	    <hr>
	    <div>
	        <table class="info basics">
	            <tr>
	                <td rowspan="5" class="imgTd">
	                    <img src="./동편11G.PNG" width="150px" height="150px" id="profile" />
	                </td>
	                <th>회원번호</th>
	                <td>${member.memberNo}</td>
	                <th>이름</th>
	                <td>${member.memberName}</td>
	            </tr>
	            <tr>
	                <th>회원구분</th>
	                <td>${member.memberGrade}</td>
	                <th>가입일</th>
	                <td>${member.memberRegDate}</td>
	            </tr>
	            <tr>
	                <th>나이</th>
	                <td>
	                	<c:choose>
		                	<c:when test="${empty member.memberAge}">
			                    <input type="text" name="memberAge" value="${member.memberAge}" />
		                    </c:when>
		                	<c:when test="${member.memberAge eq 0}">
			                    <input type="text" name="memberAge" value="${member.memberAge}" />
		                    </c:when>
		                    <c:otherwise>
		                    	${member.memberAge}
		                    	<input type="hidden" name="memberAge" value="${member.memberAge}" />
		                    </c:otherwise>
	                    </c:choose>
	                </td>
	                <th>성별</th>
	                <td>
	                	<c:choose>
		                	<c:when test="${empty member.memberGender}">
			                    <label class="radio-inline">
			                        <input type="radio" name="memberGender" id="inlineRadio1" value="1"> 남
			                    </label>
			                    <label class="radio-inline">
			                        <input type="radio" name="memberGender" id="inlineRadio2" value="2"> 여
			                    </label>
		                    </c:when>
		                    <c:otherwise>
		                    	<input type="hidden" name="memberGender" value="${member.memberGender}" />
		                    	<c:choose>
			                    	<c:when test="${member.memberGender eq '1'}">남</c:when>
			                    	<c:when test="${member.memberGender eq '2'}">여</c:when>
                    			</c:choose>
		                    </c:otherwise>
	                    </c:choose>
	                </td>
	            </tr>
	            <tr>
	                <th>ID</th>
	                <td>${member.memberId}</td>
	                <th>이메일</th>
	                <td><input type="text" name="memberEmail" value="${member.memberEmail}" /></td>
	            </tr>
	            <tr>
	                <td colspan="4">
	                    <div id="tools">
	                        <h4>주요 사용 툴</h4>
	                        <label class="checkbox-inline">
	                            <input type="checkbox" id="inlineCheckbox1" name="memberSkillNoList" value="1"> Java
	                        </label>
	                        <label class="checkbox-inline">
	                            <input type="checkbox" id="inlineCheckbox2" name="memberSkillNoList" value="2"> HTML
	                        </label>
	                        <label class="checkbox-inline">
	                            <input type="checkbox" id="inlineCheckbox3" name="memberSkillNoList" value="3"> JSP
	                        </label>
	                        <label class="checkbox-inline">
	                            <input type="checkbox" id="inlineCheckbox4" name="memberSkillNoList" value="4"> Oracle
	                        </label>
	                        <label class="checkbox-inline">
	                            <input type="checkbox" id="inlineCheckbox5" name="memberSkillNoList" value="5"> MySQL
	                        </label>
	                        <label class="checkbox-inline">
	                            <input type="checkbox" id="inlineCheckbox6" name="memberSkillNoList" value="6"> Javascript
	                        </label>
	                    </div>
	                </td>
	            </tr>
	        </table>
	    </div>
	    <h2>경력 사항</h2>
	    <hr>
	    <table class="info career">
	        <tr>
	                    <td rowspan="4" class="imgTd">
	                    </td>
	            <th>회사명</th>
	            <td>비트캠프</td>
	            <th>직위</th>
	            <td>사원</td>
	        </tr>
	        <tr>
	            <th>부서</th>
	            <td>개발</td>
	            <th>근무기간</th>
	            <td>2017-01-01 ~ 2018-01-01</td>
	        </tr>
	        <tr>
	            <th>담당업무</th>
	            <td>유지보수</td>
	            <th></th>
	            <td></td>
	        </tr>
	        <tr>
	            <th>개발언어</th>
	            <td>
	                <select class="form-control">
	                    <option>Java</option>
	                    <option>Python</option>
	                    <option>Javascript</option>
	                    <option>PHP</option>
	                    <option>C++</option>
	                </select>
	            </td>
	            <th>수준</th>
	            <td>
	                <select class="form-control">
	                    <option>상</option>
	                    <option>중</option>
	                    <option>하</option>
	                </select>
	            </td>
	        </tr>
	    </table>
	    <div class="col-md-offset-10 col-md-1 save">
	    	<button class="btn btn-primary">저장</button>
	    </div>
	</form>	   
</body>
</html>