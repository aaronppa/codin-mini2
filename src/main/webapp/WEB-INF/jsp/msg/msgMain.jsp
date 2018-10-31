<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Message Main Inbox</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/msginbox.css">
<%@ include file="/WEB-INF/jsp/include/basicInclude.jsp" %>
</head>
<body>
<c:import url="/jsp/include/top.html" />
    <div class="container-fluid">
        <div class="container-sidebar col-2">
            <div class="sidebar icon">
                <i class="fas fa-envelope fa-5x"></i>
            </div>
            
            <span class="glyphicon glyphicon-pencil"></span>
            <ul class="msg-menu-btn">
                <li class="msg-menu-btn writemsg"><i class="fas fa-pencil-alt">&nbsp;&nbsp;&nbsp;</i>메세지 작성</li>
                <li class="msg-menu-btn maininbox"><i class="fas fa-mail-bulk">&nbsp;&nbsp;&nbsp;</i>전체 Inbox</li>
                <li class="msg-menu-btn mailinbox"><i class="fas fa-envelope-open-text">&nbsp;&nbsp;&nbsp;</i>메일 Inbox</li>
                <li class="msg-menu-btn memoinbox"><i class="fas fa-comment-alt">&nbsp;&nbsp;&nbsp;</i>쪽지 Inbox</li>
                <li class="msg-menu-btn announceinbox"><i class="far fa-bell">&nbsp;&nbsp;&nbsp;</i>공지 Inbox</li>
                <li class="msg-menu-btn draftbox"><i class="far fa-edit">&nbsp;&nbsp;&nbsp;</i>Draft</li>
                <li class="msg-menu-btn trash"><i class="far fa-trash-alt">&nbsp;&nbsp;&nbsp;</i>휴지통</li>

            </ul>
        </div>
        <div class="container-body col-10">
           <div class="searchcontainer">
               <div class="searcharea">
                   <form class="searchform" method="get" role="search" id="aso_search_form_anchor">
                        <div class="searchbox" gh="sb">
                            <input class="searchkeyword" aria-label="Search mail" autocomplete="off" placeholder="Search mail" value="" name="q" type="text" dir="ltr" spellcheck="false" aria-haspopup="true" aria-live="off" aria-owns="gs_sbt50" aria-activedescendant="gs_anrs50_0">
                        </div>
                        <button class="clearsearch" aria-label="Clear search" type="button">
                                <i class="fas fa-times"></i>
                        </button>
                        <button class="search" aria-label="Search Mail" role="button">
                                <i class="fas fa-search"></i>
                        </button>
                        </form>
                    </div>
            </div>
            <div class="table-wrapper">
                <div class="msglist">
                    <table class="table table-hover">
                        <thead>
                            <tr> 
                                <th style="width: 3%"><input type="checkbox"></th>
                                <th style="width: 5%">유형</th>
                                <th style="width: 5%">상태</th>
                                <th style="width: 20%">보낸사람</th>
                                <th style="width: 70%">제목/메세지</th>
                                <th style="width: 15%">날짜/시간</th>
                            </tr>
                        </thead>
                        <tbody>
                                <tr> <td>1, 0</td> <td>2, 0</td> <td>3, 0</td> </tr>
                                <tr> <td>1, 1</td> <td>2, 1</td> <td>3, 1</td> </tr>
                                <tr> <td>1, 2</td> <td>2, 2</td> <td>3, 2</td> </tr>
                                <tr> <td>1, 3</td> <td>2, 3</td> <td>3, 3</td> </tr>
                                <tr> <td>1, 4</td> <td>2, 4</td> <td>3, 4</td> </tr>
                                <tr> <td>1, 5</td> <td>2, 5</td> <td>3, 5</td> </tr>
                                <tr> <td>1, 6</td> <td>2, 6</td> <td>3, 6</td> </tr>
                                <tr> <td>1, 7</td> <td>2, 7</td> <td>3, 7</td> </tr>
                                <tr> <td>1, 8</td> <td>2, 8</td> <td>3, 8</td> </tr>
                                <tr> <td>1, 9</td> <td>2, 9</td> <td>3, 9</td> </tr>
                                <tr> <td>1, 10</td> <td>2, 10</td> <td>3, 10</td> </tr>
                                <!-- etc... -->
                                <tr> <td>1, 99</td> <td>2, 99</td> <td>3, 99</td> </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script>
        var navigation = $('#nav-main').okayNav();
        function doSearch(){
            var f = document.mForm 
            f.submit()
        }
    </script>
</body>
</html>