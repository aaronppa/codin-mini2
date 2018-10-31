<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입 페이지입니다.</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
    .form-control{
        width: 300px;
    }

    #signup {
        width: 500px;
        margin: 150px auto 0 auto;
    }
    
    .signup-button {
    	padding-left: 60px;
    }
</style>
</head>
<body>
	<div id="signup">
        <form class="form-horizontal">
            <div class="form-group">
                <label for="username" class="col-sm-2 control-label">username</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="username" placeholder="username">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">password</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="password" placeholder="password">
            </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-sm-2 control-label">Email</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" id="email" placeholder="Email">
                </div>
            </div>
            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">name</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="name" placeholder="name">
                </div>
            </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-6 col-sm-2 signup-button">
                    <button type="submit" class="btn btn-default">Sign Up</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>