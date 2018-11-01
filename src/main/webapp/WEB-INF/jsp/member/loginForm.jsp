<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
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
        margin-left: 70px;
    }
    
    .btn {
        margin-top: 10px;
    }
</style>
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
            <button type="reset" class="btn btn-default">취소</button>
            <button type="submit" class="btn btn-primary login">로그인</button>
        </form>
    </div>
</body>
</html>