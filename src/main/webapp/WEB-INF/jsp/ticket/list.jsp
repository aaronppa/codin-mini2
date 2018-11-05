<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내가 받은 티켓 - Codin</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value='/resources/css/ticket/ticketList.css'/>">
    <script
    src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
</head>
<body>
    <div id="container">
        <h2>내가 받은 티켓</h2>
        <hr>
        <table>
            <thead>
                <tr>
                    <th>발급 순서</th>
                    <th>제목</th>
                    <th>발급자</th>
                    <th>만료일</th>
                    <th>난이도</th>
                    <th>진행도</th>
                    <th>비고</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>Front Servlet 제작</td>
                    <td>최원영</td>
                    <td>2018-10-20</td>
                    <td>중</td>
                    <td>75%</td>
                    <td></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>MVC 성능 최적화</td>
                    <td>이경</td>
                    <td>2018-11-30</td>
                    <td>최상</td>
                    <td>3%</td>
                    <td></td>
                </tr>
                <tr class="overdate">
                    <td>3</td>
                    <td>Oven 구현화</td>
                    <td>유병욱</td>
                    <td>2018-10-10</td>
                    <td>하</td>
                    <td>95%</td>
                    <td>날짜경과</td>
                </tr>
            </tbody>
        </table>
        <div id="buttonArea">
            <button type="button">티켓 발급</button>
        </div>
</body>
</html>