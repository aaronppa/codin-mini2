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
    <link rel="stylesheet" href="<c:url value='/resources/css/ticket/ticketDetail.css'/>">
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
        <form>
            <span>티켓 발급일 : </span>
		    <fmt:formatDate value='${ticket.ticketDate }' pattern="yyyy-MM-dd HH:mm" var="ticketDate"/>
            <input class="line1 rightMargin" type="text" disabled="disabled" id="ticketDate" value='${ticketDate }'/>
            <span>만료일 : </span>
            <input class="line1 rightMargin" type="text" disabled="disabled" id="ticketEnd" value='${ticket.ticketEnd }'/>
            <span>난이도 : </span>
            <input class="line1" type="text" id="ticketDifficulty" disabled="disabled" /><br>
            <span>티켓 제목 : </span>
            <input class="title rightMargin" type="text" disabled="disabled" id="ticketTitle" value='${ticket.ticketTitle }'/>
            <span>티켓 발급자 : </span>
            <input type="text" disabled="disabled" id="ticketReceiver"  value='${ticket.member.memberName }'/>
            <br>
            <p class="progress rightMargin">작업 진행률</p>
            <p class="progress" id="progress">${ticket.ticketProgress }</p>%<br>
            <div id="progressBar">
            	<input type="range" id="progressNum" min="0" max="100" value="${ticket.ticketProgress }"> <br>
			</div>
            <span>주요 사용 툴 : </span>
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
            <span class="marginBottom">티켓 내용</span><br>
            <textarea class="ticketText" id="ticketText" disabled="disabled" name="ticketText">${ticket.ticketText }</textarea>
            <span class="marginBottom">추가할 내용</span><br>
            <textarea class="ticketText" id="ticketAddText" name="ticketAddText"></textarea>
            <div id="submitBox">
                <button type="button" id="submit">저장</button>
                <button type="button" id="delete">티켓거부</button>
                <button type="button" id="close">닫기</button>
            </div>
        </form>
    </div>
    <script>
    	if (${ticket.ticketDifficulty} == "1") {
    		$("#ticketDifficulty").val("하")	    		
    	}
    
    	if (${ticket.ticketDifficulty} == "2") {
    		$("#ticketDifficulty").val("중")	    		
    	}
    
    	if (${ticket.ticketDifficulty} == "3") {
    		$("#ticketDifficulty").val("상")	    		
    	}
    	
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
    	
        $("input[type='checkbox']").attr("disabled","disabled");

        $("#close").click(function() {
        	swal({
        		  title: '창을 닫으시겠습니까?',
        		  text: "저장하지 않은 내용은 손실됩니다.",
        		  type: 'warning',
        		  showCancelButton: true,
        		  confirmButtonColor: '#3085d6',
        		  cancelButtonColor: '#d33',
        		  confirmButtonText: '네',
        		  cancelButtonText: "아니오"
        		}).then((result) => {
					if (result.value) {

						window.close()  	
					}
        		})
        })
        
         $("#delete").click(function() {
        	swal({
        		  title: '이 티켓을 거부하시겠습니까?',
        		  text: "티켓 거부는 취소되지 않습니다.",
        		  type: 'warning',
        		  showCancelButton: true,
        		  confirmButtonColor: '#3085d6',
        		  cancelButtonColor: '#d33',
        		  confirmButtonText: '네',
        		  cancelButtonText: "아니오"
        		}).then((result) => {
	  	      		  if (result.value) {
							$.ajax({
								url:"<c:url value='/ticket/deleteReceiver.do'/>",
								type:"POST",
								data: {ticketNo : `${ticket.ticketNo }`,
									groupMember : `${user.memberNo}`	
									}
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
						url:"<c:url value='/ticket/updateReceiver.do'/>",
						type:"POST",
						data: {
							ticketNo:`${ticket.ticketNo}`,
							userName: `${user.memberName}`,
							addText: $("#ticketAddText").val(),
							progress: $("#progressNum").val()
						}
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