<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<title>로그인 페이지입니다.</title>
<style>
    #login-container {
        width: 244px;
        height: 123px;
        margin: 15% auto;
    }
    
    .password {
        margin-top: 10px;
    }

    .login {
        margin-left: 88px;
    }
    
    .btn {
        margin-top: 10px;
    }
    a {
    	text-decoration: none;
    	color: black;
    }
</style>
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
</head>
<body>
	<div id="login-container">
        <form class="form-inline" action="login.do" method="post">
            <div class="input-group username">
                <div class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true" /></div>
                <input type="text" class="form-control" placeholder="username" name="memberId" />
            </div>
            <br>
            <div class="input-group password">
                <div class="input-group-addon"><span class="glyphicon glyphicon-lock" aria-hidden="true" /></div>
                <input type="password" class="form-control" placeholder="password" name="memberPassword" />
            </div>
            <br>
            <button type="button" class="btn btn-default"><a href="<c:url value='/member/signupForm.do'/>">회원가입</a></button>
            <button type="submit" class="btn btn-primary login">로그인</button>
        </form>
    </div>
</body>
</html>