<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Codin Mini - Sent Message Box</title>
<%@ include file="/WEB-INF/jsp/include/basicInclude.jsp" %>
<link rel="stylesheet" href="<c:url value="/resources/css/msginbox.css"/>">
<style>
</style>
</head>
<body>
<c:import url="/WEB-INF/jsp/include/top.jsp" />
    <div class="container-fluid">
        <div class="container-sidebar col-2">
            <div class="sidebar icon">
                <i class="far fa-paper-plane fa-5x"></i>
            </div>
            <span class="glyphicon glyphicon-pencil"></span>
            <ul class="msg-menu-btn">
                <li class="msg-menu-btn writemsg"><i class="fas fa-pencil-alt">&nbsp;&nbsp;&nbsp;</i>메세지 작성</li>
                <li class="msg-menu-btn maininbox"><i class="fas fa-mail-bulk">&nbsp;&nbsp;&nbsp;</i>전체 Inbox</li>
                <li class="msg-menu-btn mailinbox"><i class="fas fa-envelope-open-text">&nbsp;&nbsp;&nbsp;</i>메일 Inbox</li>
                <li class="msg-menu-btn memoinbox"><i class="fas fa-comment-alt">&nbsp;&nbsp;&nbsp;</i>쪽지 Inbox</li>
                <li class="msg-menu-btn announceinbox"><i class="far fa-bell">&nbsp;&nbsp;&nbsp;</i>공지 Inbox</li>
                <li class="msg-menu-btn draftbox"><i class="far fa-edit">&nbsp;&nbsp;&nbsp;</i>Draft</li>
                <li class="msg-menu-btn sentbox"><i class="far fa-paper-plane">&nbsp;&nbsp;&nbsp;</i>보낸메세지</li>
                <li class="msg-menu-btn trash"><i class="far fa-trash-alt">&nbsp;&nbsp;&nbsp;</i>휴지통</li>

            </ul>
        </div>
        <div class="container-body col-10">
           <div class="searchcontainer">
               <form class="searchform" method="get" role="search" id="aso_search_form_anchor">
                    <div class="searchbox" gh="sb">
                     <input class="searchkeyword" aria-label="Search mail" autocomplete="off" placeholder="Search mail" value="" name="q" type="text" dir="ltr" spellcheck="false" aria-haspopup="true" aria-live="off" aria-owns="gs_sbt50" aria-activedescendant="gs_anrs50_0">
                    <button class="clearsearch" aria-label="Clear search" type="button">
                            <i class="fas fa-times"></i>
                    </button>
                    <button class="search" aria-label="Search Mail" role="button">
                            <i class="fas fa-search"></i>
                    </button>
                    </div>
                 </form>
            </div>
            <div class="table-wrapper canvasboard">
	            <div class="trashicon receivedmsg">
	           	<i class="far fa-trash-alt"></i>
	           	</div>
                <div class="msglist">
                    <table class="table table-hover">
                        <thead>
                            <tr> 
                                <th id="thtrwidth-1"><div class="checkbox"><input type="checkbox" id="selectall"></div></th>
                                <th id="thtrwidth-2">유형</th>
                                <th id="thtrwidth-3">상태</th>
                                <th id="thtrwidth-4">받는 사람</th>
                                <th id="thtrwidth-5">제목/메세지</th>
                                <th id="thtrwidth-6">보낸 날짜/시간</th>
                            </tr>
                        </thead>
                        <tbody id="msglistresult">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
       </div>
       
        
<!-- Side Menu Buttons Event -->
<script>
	$(".maininbox").click(function(){window.location.pathname = '/codin_mini/msg/maininbox.do'});
	$(".mailinbox").click(function(){window.location.pathname = '/codin_mini/msg/mailinbox.do'});
	$(".memoinbox").click(function(){window.location.pathname = '/codin_mini/msg/memoinbox.do'});
	$(".announceinbox").click(function(){window.location.pathname = '/codin_mini/msg/announcementinbox.do'});
	$(".draftbox").click(function(){window.location.pathname = '/codin_mini/msg/draftinbox.do'});
	$(".sentbox").click(function(){window.location.pathname = '/codin_mini/msg/sentbox.do'});
	$(".trash").click(function(){window.location.pathname = '/codin_mini/msg/trashbox.do'}); 
</script>

<!-- Display Msg Script-->
<script  src="<c:url value="/resources/script/msg/displayinbox.js"/>" ></script>
<script>
const thisUserNo = ${user.memberNo};
window.onload = displaydrafsentbox(1); 
</script>

<!-- Modal WriteForm -->
	<div class="modal fade" id="writeFormModal" tabindex="-1" role="dialog"
		aria-labelledby="writeMsgFormModal" aria-hidden="true">
		<div class="modal-dialog writeForm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id=writeMsgFormModal">메세지 작성</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="<c:url value='/msg/write.do'/>" method="post" autocomplete="off" onSubmit="return checkR()">
						<div class="form-group info ui-front">
							<!-- 수신자 검색 자동완성 추가 필요 -->
							<input type="hidden" class="form-control info" id="wfromUserNo" name="fromUserNo" value="${user.memberNo}">
							<label for="searchRecipient" class="col-form-label">수신자:</label> 
							<input type="text" class="form-control info" id="searchRecipient" name="searchStr">
							<div class="recipientadded">
							<ul id='recipientAddedLabel'></ul>
							</div><br>
							<label for="subject" class="col-form-label">제목/쪽지메세지:</label> 
							<input type="text" class="form-control info" id="wSubject" name="subject" maxlength="50">
						</div>
						<div class="form-group body">
							<label for="message-body" class="col-form-label">본문내용:</label>
							<textarea class="form-control message-body" id="summernote" name="body"></textarea>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary">임시저장</button>
					<button type="submit" class="btn btn-primary">발신</button>
				</div>
					</form>
			</div>
		</div>
	</div>

<!-- Write Form Modal Script -->
<script>
	$('#summernote').summernote({
	    placeholder: '제목만 입력하고 내용이 없으면 쪽지 형태로 발송됩니다.',
	    tabsize: 2,
	    height: 360,
	    toolbar: [
	        // [groupName, [list of button]]
	        ['style', ['bold', 'italic', 'underline', 'clear']],
	        ['font', ['strikethrough', 'superscript', 'subscript']],
	        ['fontsize', ['fontsize']],
	        ['color', ['color']],
	        ['para', ['ul', 'ol', 'paragraph']],
	        ['height', ['height']]
	      ]
    });
	$("li.msg-menu-btn.writemsg").on("click", function(){
		$("#writeFormModal").modal('show');
		// Modal 상에서 autocomplete하면 자동완성 리스트가 모달 뒤로 보여지고 사용자는 보이지 않음으로 
		// 이를 처리하기 위해서 사용하는 코드 
		$("#searchRecipient").autocomplete("option", "appendTo", "#writeFormModal");
	});
</script>

<!-- Search User -->
<script src="<c:url value="/resources/script/msg/searchMember.js"/>" ></script>

</body>
</html>