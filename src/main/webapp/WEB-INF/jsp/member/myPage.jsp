<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
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
    
    a {
    	text-decoration: none !important;
    	color: white;
    }
    
    .update-delete {
    	text-align: right;
    	margin-top: 50px;
    }
    
    .career {
    	text-align: right;
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
	<h2>기본 정보<button class="btn btn-primary col-md-offset-9"><a href="<c:url value='/member/deleteAccount.do?memberNo=' />${member.memberNo}">탈퇴</a></button></h2>
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
                <td><fmt:formatDate value="${member.memberRegDate}" pattern="yyyy-MM-dd"/></td>
            </tr>
            <tr>
                <th>나이</th>
                <td>${member.memberAge}</td>
                <th>성별</th>
                <td>
                    <c:choose>
                    	<c:when test="${member.memberGender eq '1'}">남</c:when>
                    	<c:when test="${member.memberGender eq '2'}">여</c:when>
                    	<c:otherwise>성별을 체크해주세요.</c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <th>ID</th>
                <td>${member.memberId}</td>
                <th>이메일</th>
                <td>${member.memberEmail}</td>
            </tr>
            <tr>
                <td colspan="4">
                    <div id="tools">
                        <h4>주요 사용 툴</h4>
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox1" name="memberSkillNo" value="1"
                            disabled
                            <c:forEach var="skill" items="${memberSkill}">
                            	<c:if test="${skill.memberSkillNo eq 1}">checked</c:if>
                            </c:forEach>
                            > Java
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox2" name="memberSkillNo" value="2"
                            disabled
                            <c:forEach var="skill" items="${memberSkill}">
                            	<c:if test="${skill.memberSkillNo eq 2}">checked</c:if>
                            </c:forEach>
                            > HTML
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox3" name="memberSkillNo" value="3"
                            disabled
                            <c:forEach var="skill" items="${memberSkill}">
                            	<c:if test="${skill.memberSkillNo eq 3}">checked</c:if>
                            </c:forEach>
                            > JSP
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox4" name="memberSkillNo" value="4"
                            disabled
                            <c:forEach var="skill" items="${memberSkill}">
                            	<c:if test="${skill.memberSkillNo eq 4}">checked</c:if>
                            </c:forEach>
                            > Oracle
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox5" name="memberSkillNo" value="5"
                            disabled
                            <c:forEach var="skill" items="${memberSkill}">
                            	<c:if test="${skill.memberSkillNo eq 5}">checked</c:if>
                            </c:forEach>
                            > MySQL
                        </label>
                        <label class="checkbox-inline">
                            <input type="checkbox" id="inlineCheckbox6" name="memberSkillNo" value="6"
                            disabled
                            <c:forEach var="skill" items="${memberSkill}">
                            	<c:if test="${skill.memberSkillNo eq 6}">checked</c:if>
                            </c:forEach>
                            > Javascript
                        </label>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <h2>경력 사항</h2>
    <hr>
   	<button class="btn btn-primary col-md-offset-9"><a href="<c:url value='/member/insertCareerForm.do' />">추가</a></button>
   	<c:choose>
   		<c:when test="${empty memberCareer[0]}">
   		</c:when>
   		<c:otherwise>
	    	<button class="btn btn-primary"><a href="<c:url value='/member/updateForm.do' />">수정</a></button>
	    	<button class="btn btn-primary"><a href="<c:url value='/member/deleteCareerAll.do' />">일괄삭제</a></button>
   		</c:otherwise>
   	</c:choose>
    <table class="info career">
	    <c:forEach var="career" items="${memberCareer}">
	        <tr>
	        	<td rowspan="3"><button class="btn btn-primary" id="deleteCareer" data-no="${career.careerNo}" data-writer="${member.memberNo}">삭제</button></td>
	            <th>회사명</th>
	            <td>${career.careerCompany}</td>
	            <th>직위</th>
	            <td>${career.careerPosition}</td>
	        </tr>
	        <tr>
	            <th>부서</th>
	            <td>${career.careerDepartment}</td>
	            <th>근무기간</th>
	            <td><fmt:formatDate value="${career.careerStart}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${career.careerEnd}" pattern="yyyy-MM-dd"/></td>
	        </tr>
	        <tr>
	            <th>담당업무</th>
	            <td>${career.careerJob}</td>
	            <th></th>
	            <td></td>
	        </tr>
	    </c:forEach>
        <tr>
        	<td></td>
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
    <div class="col-md-offset-10 col-md-2 update-delete">
    	<button class="btn btn-primary"><a href="<c:url value='/member/updateForm.do' />">수정</a></button>
    	<button class="btn btn-primary"><a href="<c:url value='/member/logout.do' />">로그아웃</a></button>
    </div>
    <script>
    	$("#deleteCareer").click(function() {
			var memberNo = $(this).data('writer');
    		var no = $(this).data('no');
    		$.ajax({
    			url: "/codin_mini/member/deleteCareer.do",
    			method: "post",
    			dataType:"json",
    			data: {careerNo: no, memberNo: memberNo}
    		}).done(function() {
    			alert("삭제되었습니다.");
    		});
    	});
    </script>
</body>
</html>