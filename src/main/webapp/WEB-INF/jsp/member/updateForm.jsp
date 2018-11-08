<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	                <td>
						<c:choose>
	                		<c:when test="${member.memberGrade eq '1'}">준회원</c:when>
	                		<c:when test="${member.memberGrade eq '2'}">정회원</c:when>
	                		<c:when test="${member.memberGrade eq '3'}">우수회원</c:when>
	                		<c:when test="${member.memberGrade eq 'a'}">관리자</c:when>
                		</c:choose>
					</td>
	                <th>가입일</th>
	                <td><fmt:formatDate value="${member.memberRegDate}" pattern="yyyy-MM-dd"/></td>
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
	                            <input type="checkbox" id="inlineCheckbox1" name="memberSkillNo" value="1"
	                            <c:forEach var="skill" items="${memberSkill}">
	                            	<c:if test="${skill.memberSkillNo eq 1}">checked</c:if>
	                            </c:forEach>
	                            > Java
	                        </label>
	                        <label class="checkbox-inline">
	                            <input type="checkbox" id="inlineCheckbox2" name="memberSkillNo" value="2"
	                            <c:forEach var="skill" items="${memberSkill}">
	                            	<c:if test="${skill.memberSkillNo eq 2}">checked</c:if>
	                            </c:forEach>
	                            > HTML
	                        </label>
	                        <label class="checkbox-inline">
	                            <input type="checkbox" id="inlineCheckbox3" name="memberSkillNo" value="3"
	                            <c:forEach var="skill" items="${memberSkill}">
	                            	<c:if test="${skill.memberSkillNo eq 3}">checked</c:if>
	                            </c:forEach>
	                            > JSP
	                        </label>
	                        <label class="checkbox-inline">
	                            <input type="checkbox" id="inlineCheckbox4" name="memberSkillNo" value="4"
	                            <c:forEach var="skill" items="${memberSkill}">
	                            	<c:if test="${skill.memberSkillNo eq 4}">checked</c:if>
	                            </c:forEach>
	                            > Oracle
	                        </label>
	                        <label class="checkbox-inline">
	                            <input type="checkbox" id="inlineCheckbox5" name="memberSkillNo" value="5"
	                            <c:forEach var="skill" items="${memberSkill}">
	                            	<c:if test="${skill.memberSkillNo eq 5}">checked</c:if>
	                            </c:forEach>
	                            > MySQL
	                        </label>
	                        <label class="checkbox-inline">
	                            <input type="checkbox" id="inlineCheckbox6" name="memberSkillNo" value="6"
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
	    <div class="col-md-offset-10">
	    	<button class="btn btn-primary">저장</button>
	    </div>
	    <h2>경력 사항</h2>
	    <hr>
	    <table class="info career">
	        <c:forEach var="career" items="${memberCareer}">
		        <tr>
		            <th>회사명</th>
		            <td><input type="text" name="careerCompany" value="${career.careerCompany}" /></td>
		            <th>직위</th>
		            <td><input type="text" name="careerPosition" value="${career.careerPosition}" /></td>
		        </tr>
		        <tr>
		            <th>부서</th>
		            <td><input type="text" name="careerDepartment" value="${career.careerDepartment}" /></td>
		            <th>근무기간</th>
		            <td><input type="text" name="careerStart" value="<fmt:formatDate value='${career.careerStart}' pattern='yyyy-MM-dd'/>" /> ~ <input type="text" name="careerEnd" value="<fmt:formatDate value='${career.careerEnd}' pattern='yyyy-MM-dd'/>" /></td>
		        </tr>
		        <tr>
		            <th>담당업무</th>
		            <td><input type="text" name="careerJob" value="${career.careerJob}" /></td>
		            <th></th>
		            <td></td>
		        </tr>
		    </c:forEach>
<!-- 	        <tr> -->
<!-- 	            <th>개발언어</th> -->
<!-- 	            <td> -->
<!-- 	                <select class="form-control"> -->
<!-- 	                    <option>Java</option> -->
<!-- 	                    <option>Python</option> -->
<!-- 	                    <option>Javascript</option> -->
<!-- 	                    <option>PHP</option> -->
<!-- 	                    <option>C++</option> -->
<!-- 	                </select> -->
<!-- 	            </td> -->
<!-- 	            <th>수준</th> -->
<!-- 	            <td> -->
<!-- 	                <select class="form-control"> -->
<!-- 	                    <option>상</option> -->
<!-- 	                    <option>중</option> -->
<!-- 	                    <option>하</option> -->
<!-- 	                </select> -->
<!-- 	            </td> -->
<!-- 	        </tr> -->
	    </table>
	</form>	   
</body>
</html>