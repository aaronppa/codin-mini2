<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>티켓 발급 - Codin</title>
<!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="<c:url value='/resources/script/sweet/sweetalert2.css'/>">
	<link rel="stylesheet" href="<c:url value='/resources/css/ticket/ticketIssue.css'/>">
	<script
    src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>

	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value='/resources/script/sweet/sweetalert2.all.min.js'/>"/></script>
</head>
<body>
    <div id="container">
        <h2>티켓 발급</h2>
        <span>${user.memberName }</span>
        <hr>
        <form id="form" method="POST">
<%--         	<input type="hidden" name="ticketSender" value='${user.memberNo}'> --%>
        	<input type="hidden" name="ticketSender" value='1'>
            <span>티켓 제목 : </span>
            <input type="text" id="ticketTitle" name="ticketTitle"/><br>
            <span>티켓 대상자 : </span>
            <input type="text" id="autocomplete" />
            <button type="button" id="addPeople">추가</button>
            <br>
            <div id="receiver"></div>
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
            <span>티켓 난이도 : </span>
            <select name="ticketDifficulty" id="ticketDifficulty">
                <option value="0">선택</option>
                <option value="3">상</option>
                <option value="2">중</option>
                <option value="1">하</option>
            </select><br>
            <span>티켓 기한 : </span>
            <input class="date" type="date" name="ticketStart"/> ~ 
            <input class="date" type="date" name="ticketEnd"/><br>
            <span class="marginBottom">티켓 내용</span><br>
            <textarea id="ticketText" name="ticketText"></textarea>
            <div id="submitBox">
                <button id="issue" type="button">발급</button>
            </div>
        </form>
    </div>
    <script>
    
		// 수신자 등록
        $('#autocomplete').focus(function() {
        	var userList;
        	
        	$.ajax({
        		url: "<c:url value='/ticket/autoCom.do'/>"
        	}).done(function(result) {
        		$( "#autocomplete" ).autocomplete({
        			  source: result
        		});
        	})
        })
        
        $("#addPeople").click(function() {
    		$.ajax({
    			url: "<c:url value='/ticket/searchMember.do'/>",
    			data: "memberId=" + $("#autocomplete").val()
    		}).done(function(member) {
    			
    			if (member.memberNo == null) {
    				swal({
    					  type: 'error',
    					  title: 'ERROR!!',
    					  text: '존재하지 않은 사용자입니다.'
    				})
    				return;
    			}
				
    			var $memberId = $(".memberId")    			
				for (let i = 0; i < $memberId.length; i++) {
					if (member.memberId == $memberId[i].textContent) {
						swal({
	    					  type: 'error',
	    					  title: 'ERROR!!',
	    					  text: '이미 추가 된 사용자입니다.'
	    				})
	    				return;
					}
				}
    			
    			var $peopleDiv = $("<div class='people'>");
            	var $peopleImg = $("<img/>").attr('class', 'profileImg').attr('src', '<c:url value='/resources/ticketImg/people1.jpg'/>');
    	        var $peopleSpan1 = $("<span class='memberId'>").html(member.memberId);
    	        var $peopleSpan2 = $("<span>").html(member.memberName);
            	
                $("#receiver")
                .append($peopleDiv.append($peopleImg)
                .append($("<br>"))
                .append($peopleSpan1)
                .append($("<br>"))
                .append($peopleSpan2));        	        
                $(".profileImg").mouseenter( function(){
    	            var delImg = $("<img/>").attr('class', 'profileImg delete').attr('src', '<c:url value='/resources/ticketImg/del.png'/>');
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
    	})
 
    	// 발급 버튼
        $("#issue").click(function() {
   			var $memberId = $(".memberId");
   			var groupMember = "";
   			for (let i = 0; i < $memberId.length; i++) {
   				$("#form").append($("<input class='groupMember' type='hidden', name=groupMember>").val($memberId[i].textContent))
   			}
   			
            $.ajax({
            	url: "<c:url value='/ticket/submit.do'/>",
            	type: 'POST',
            	data: $("#form").serialize()
            }).done(function(){
            	$(".groupMember").remove();
            })
            
        })
        
	    
    </script>
</body>
</html>