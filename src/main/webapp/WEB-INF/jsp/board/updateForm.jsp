<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="/WEB-INF/jsp/include/basicInclude.jsp" %>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  
  
  

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
    <style>
        *{
            font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
        }
        #writeDiv {
            width:60%;
            position: relative;
			top: 70px;
            margin-left: 20%;
           
        }
        #TITLE{
            width:100%;
        }
        .board_view{
            width: 100%;
        }
        #CONTENTS{
            width:100%;
            overflow-y:scroll;
            height: 400px;
            height: 500px;
            text-align-last: left;
            vertical-align: 0%;
            resize: none;
        }
        #summernote{
            width: 100%;
            resize: none;
            height: 500px;
        }
     
    </style>
</head>
<body>
<c:import url="/WEB-INF/jsp/include/top.jsp" />
	
    <div id="writeDiv">
        <form id="frm" action="/codin_mini/board/update.do" method="post" name="board">
               
                    
               
                    	
                    	<input type="hidden" name="boardId" value="${user.memberId}">
                    	<input type="hidden" name="boardNo" value="${board.boardNo}">
                            
                                    <select id="category" name="categoryNo">
                                    		<option value="0"></option> 
                                            <option value="1">전체</option>
                                            <option value="2">자유</option>
                                            <option value="3">고민</option>
                                            <option value="4">하소연</option>
                                            <option value="5">감성</option>  
                                            <option value="6">질문</option> 
                                                      
                                    </select>
                         
                   제목 :  <input type="text" id="TITLE" name="boardTitle" class="wdp_90"></input>
                     
                                  
                                  
                   <textarea name="boardContent" id="summernote" style="resize: none; overflow-y: auto;"></textarea>
                 
                <button id="writeBTN" type="submit"><img src="/codin_mini/resources/img/KakaoTalk20181028221348368.gif" style="height: 40px;"></button>
                 <a href="list.do?PageNo=1"><img src="/codin_mini/resources/img/KakaoTalk20181028221340213.gif" style="height: 40px;"></a>
              
            </form>
     
 			
    </div>
    
    <script>
        	
    
            $(function() {
                $('#summernote').summernote({
                height: 300,          // 기본 높이값
                minHeight: 500,      // 최소 높이값(null은 제한 없음)
                maxHeight: 500,      // 최대 높이값(null은 제한 없음)
                focus: true,          // 페이지가 열릴때 포커스를 지정함
                lang: 'ko-KR'         // 한국어 지정(기본값은 en-US)
                });
                var sHTml = $('#summernote').code();
                alert(sHTml);
            });
            
           /*  $("writeBTN").click(function(){
            	$("#summernote").append('<input type="hidden" name="boardContent", id="contents"/>');
            });	$("#contents").val($('#summernote')code());
            $("frm").submit(); */
     
    </script>
</body>
</html>