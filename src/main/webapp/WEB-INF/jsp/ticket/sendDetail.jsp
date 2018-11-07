<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="<c:url value='/resources/script/sweet/sweetalert2.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/ticket/ticketSendDetail.css'/>">
    <script
    src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
   	<script src="<c:url value='/resources/script/sweet/sweetalert2.all.min.js'/>"/></script>
</head>
<body>
    <div id="container">
        <h2>티켓 세부 내용</h2>
        <hr>
        <form id="form">
           	<input type="hidden" name="ticketSender" value='${user.memberNo }'>
        	<input type="hidden" name="ticketNo" value='${ticket.ticketNo }'/>
            <span>티켓 발급일 : </span>
		    <fmt:formatDate value='${ticket.ticketDate }' pattern="yyyy-MM-dd HH:mm" var="ticketDate"/>
            <input class="line1 rightMargin" type="text" disabled="disabled" id="ticketDate" value='${ticketDate }'/>
            <span>만료일 : </span>
            <input class="line1 rightMargin" type="date" id="ticketEnd" name="ticketEnd" value='${ticket.ticketEnd }'/>
            <span>난이도 : </span>
            <select name="ticketDifficulty" name="ticketDifficulty" id="ticketDifficulty">
                <option value="1">하</option>
                <option value="2">중</option>
                <option value="3">상</option>
            </select><br>
            
<!--             <input class="line1" type="text" id="ticketDifficulty" disabled="disabled" /><br> -->
            <span>티켓 제목 : </span>
            <input class="title rightMargin" type="text" id="ticketTitle" name="ticketTitle" value='${ticket.ticketTitle }'/><br>
            <span>티켓 수신자 : </span>
            <input type="text" disabled="disabled" id="ticketReceiver"  value='${receiver }'/>
            <br>
            <p class="progress rightMargin">작업 진행률</p>
            <p class="progress" id="progress">${ticket.ticketProgress }</p>%<br>
            <div id="progressBar">
            	<input type="range" id="progressNum" min="0" max="100" value="${ticket.ticketProgress }" disabled="disabled"> <br>
			</div>
            <span >주요 사용 툴 : </span>
            <input class="skill" type="checkbox" name="ticketSkill" value="1" id="skill1">
            <label for="skill1">Java</label>
            <input class="skill" type="checkbox" name="ticketSkill" value="2" id="skill2">
            <label for="skill2">HTML/CSS</label>
            <input class="skill" type="checkbox" name="ticketSkill" value="3" id="skill3">
            <label for="skill3">JSP</label>
            <input class="skill" type="checkbox" name="ticketSkill" value="4" id="skill4">
            <label for="skill4">Oracle</label>
            <input class="skill" type="checkbox" name="ticketSkill" value="5" id="skill5">
            <label for="skill5">MySQL</label>
            <input class="skill" type="checkbox" name="ticketSkill" value="6" id="skill6">
            <label for="skill6">JQuery / Ajax</label>
            <input class="skill" type="checkbox" name="ticketSkill" value="7" id="skill7">
            <label for="skill7">spring</label><br>
        <div class="marginBottom"> </div>
            <span class="marginBottom">티켓 내용</span><br>
            <textarea class="ticketText" id="ticketText" disabled="disabled">${ticket.ticketText }</textarea>
            <span class="marginBottom">추가할 내용</span><br>
            <textarea class="ticketText" id="ticketAddText" name="ticketText"></textarea>
            <div id="submitBox">
                <button type="button" id="submit">수정</button>
                <button type="button" id="delete">티켓삭제</button>
                <button type="button" id="close">닫기</button>
            </div>
        </form>
    </div>
    <script>
 
    	$("#ticketDifficulty > option").eq(${ticket.ticketDifficulty}-1).attr("selected", "selected")
    
    	try {
    		var ticketSkill = ${ticketSkill}
    		for (let i = 0; i < ticketSkill.length; i++) {
    			console.log(ticketSkill[i].skillCode-1)
    			console.dir($(".skill"))
    			$(".skill").eq(ticketSkill[i].skillCode-1).attr("checked", "checked");

    		}

    	} catch(e) {
    		;;
    	}
    	
        $("#close").click(function() {
        	swal({
        		  title: '창을 닫으시겠습니까?',
        		  text: "저장하지 않은 내용은 손실됩니다.",
        		  type: 'warning',
        		  showCancelButton: true,
        		  confirmButtonColor: '#3085d6',
        		  cancelButtonColor: '#d33',
        		  confirmButtonText: '네',/*
        		  */
        		  cancelButtonText: "아니오"
        		}).then((result) => {
						if (result.value) {
	
							window.close()  	
						}
        		})
        })
        
         $("#delete").click(function() {
        	swal({
        		  title: '이 티켓을 삭제하시겠습니까?',
        		  text: "티켓 삭제는 취소되지 않습니다.",
        		  type: 'warning',
        		  showCancelButton: true,
        		  confirmButtonColor: '#3085d6',
        		  cancelButtonColor: '#d33',
        		  confirmButtonText: '네',
        		  cancelButtonText: "아니오"
        		}).then((result) => {
	  	      		  if (result.value) {
							$.ajax({
								url:"<c:url value='/ticket/deleteSender.do'/>",
								type:"POST",
								data: {ticketNo : `${ticket.ticketNo }`}
							}).done(function() {
								swal({
									  type: 'success',
									  title: 'OK!',
									  text: '작업이 정상적으로 저장되었습니다.'
								}).then((result)=>{
									opener.parent.location.reload();
									window.close();						
								})
							})
		      		  }
	       		})
        })
        
        $("#submit").click(function() {
        	swal({
      		  title: '저장하시겠습니까?',
      		  text: "저장하지 않은 내용은 손실됩니다.",
      		  type: 'question',
      		  showCancelButton: true,
      		  confirmButtonColor: '#3085d6',
      		  cancelButtonColor: '#d33',
      		  confirmButtonText: '네',
      		  cancelButtonText: "아니오"
      		}).then((result) => {
	      		  if (result.value) {
						$.ajax({
							url:"<c:url value='/ticket/updateSender.do'/>",
							type:"POST",
							data: $("#form").serialize()
						}).done(function() {
							swal({
								  type: 'success',
								  title: 'OK!',
								  text: '작업이 정상적으로 저장되었습니다.'
							}).then((result)=>{
								opener.parent.location.reload();
								window.close();						
							})
						})
	      		  }
      		})
        })	
        
        $("#progressNum").mouseup(function() {
            $("#progress").html($("#progressNum").val())
        })

    </script>
</body>
</html>