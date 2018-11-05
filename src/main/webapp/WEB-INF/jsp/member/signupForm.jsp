<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입 페이지입니다.</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<style>
    .form-control{
        width: 300px;
    }

    #signup {
        width: 500px;
        margin: 150px auto 0 auto;
    }
</style>
</head>
<body>
	<div id="signup">
        <form class="form-horizontal" action="signup.do" method="post">
            <div class="form-group">
                <label for="username" class="col-md-2 control-label">username</label>
                <div class="col-md-10">
                    <input type="text" class="form-control" id="username" placeholder="username" name="memberId">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-md-2 control-label">password</label>
                <div class="col-md-10">
                    <input type="password" class="form-control" id="password" placeholder="password" name="memberPassword">
            </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-md-2 control-label">Email</label>
                <div class="col-md-10">
                    <input type="email" class="form-control" id="email" placeholder="Email" name="memberEmail">
                </div>
            </div>
            <div class="form-group">
                <label for="name" class="col-md-2 control-label">name</label>
                <div class="col-md-10">
                    <input type="text" class="form-control" id="name" placeholder="name" name="memberName">
                </div>
            </div>
		</div>
                <div class="col-md-1 offset-md-6 signup-button">
                    <button type="submit" class="btn btn-primary">Sign Up</button>
                </div>
        </form>
    </div>
</body>
</html>