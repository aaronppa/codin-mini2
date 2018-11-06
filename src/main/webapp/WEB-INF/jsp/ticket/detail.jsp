<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="<c:url value='/resources/css/ticket/ticketDetail.css'/>">
    <script
    src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
</head>
<body>
    <div id="container">
        <h2>티켓 세부 내용</h2>
        <hr>
        <form>
            <span>티켓 발급일 : </span>
            <input class="line1 rightMargin" type="text" disabled="disabled" id="ticketTitle"/>
            <span>만료일 : </span>
            <input class="line1 rightMargin" type="text" disabled="disabled" id="ticketTitle"/>
            <span>난이도 : </span>
            <input class="line1" type="text" id="ticketTitle" disabled="disabled" value="1" /><br>
            <span>티켓 제목 : </span>
            <input class="title rightMargin" type="text" disabled="disabled" id="ticketTitle"/>
            <span>티켓 발급자 : </span>
            <input type="text" disabled="disabled" id="ticketReceiver"/>
            <br>
            <p class="process rightMargin">작업 진행률</p>
            <p class="process" id="process">0</p>%
            <input type="range" id="processNum" min="0" max="100" value="0"> <br>

            <span>주요 사용 툴 : </span>
            <input type="checkbox" name="ticketSkill" value="1" id="skill1">
            <label for="skill1">Java</label>
            <input type="checkbox" name="ticketSkill" value="2" id="skill2">
            <label for="skill2">HTML/CSS</label>
            <input type="checkbox" name="ticketSkill" value="3" id="skill3">
            <label for="skill3">JSP</label>
            <input type="checkbox" name="ticketSkill" value="4" id="skill4">
            <label for="skill4">Oracle</label>
            <input type="checkbox" name="ticketSkill" value="5" id="skill5">
            <label for="skill5">MySQL</label>
            <input type="checkbox" name="ticketSkill" value="6" id="skill6">
            <label for="skill6">JQuery / Ajax</label>
            <input type="checkbox" name="ticketSkill" value="7" id="skill7">
            <label for="skill7">spring</label><br>
            <span class="marginBottom">티켓 내용</span><br>
            <textarea id="ticketText" disabled="disabled" name="ticketText"></textarea>
            <span class="marginBottom">티켓 작업 내용</span><br>
            <textarea id="ticketDoingText" name="ticketDoingText"></textarea>
            <div id="submitBox">
                <button type="button" confim">저장</button>
            </div>
        </form>
    </div>
    <script>
        $("input[type='checkbox']").attr("disabled","disabled").attr("checked", "checked");

        $("#processNum").mouseup(function() {
            $("#process").html($("#processNum").val())
        })
        $(".profileImg").mouseenter( function(){
            var delImg = $("<img class='profileImg delete' src='../del.png'/>")
            $(this).css({opacity: '0.6', cursor: 'Pointer'})
            .parent().append(delImg);
        })
        $(".profileImg").mouseleave( function(){
            $(this).css('opacity', '1');
            $(".delete").remove();
        })
        $(".profileImg").click( function(){
            $(this).parent().remove();
        })
        $("#search").click(function(){
            $("#receiver").append($("#test").clone());
        
            $(".profileImg").mouseenter( function(){
            var delImg = $("<img class='profileImg delete' src='../del.png'/>")
            $(this).css({opacity: '0.6', cursor: 'Pointer'})
            .parent().append(delImg);
            })

            $(".profileImg").mouseleave( function(){
                $(this).css('opacity', '1');
                $(".delete").remove();
            })

            $(".profileImg").click( function(){
                $(this).parent().remove();
            })
        })
    </script>
</body>
</html>