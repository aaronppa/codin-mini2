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
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
</head>
<body>
	<div id="signup">
        <form class="form-horizontal" action="signup.do" method="post" id="signup">
            <div class="form-group">
                <label for="username" class="col-md-2 control-label">ID</label>
                <div class="col-md-10">
                    <input type="text" class="form-control" id="username" placeholder="username" name="memberId" oninput="checkId()" autofocus>
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-md-2 control-label">password</label>
                <div class="col-md-10">
                    <input type="password" class="form-control" id="password" placeholder="password" name="memberPassword" oninput="check()">
            </div>
            </div>
            <div class="form-group">
                <label for="email" class="col-md-2 control-label">Email</label>
                <div class="col-md-10">
                    <input type="email" class="form-control" id="email" placeholder="Email" name="memberEmail" oninput="check()">
                </div>
            </div>
            <div class="form-group">
                <label for="name" class="col-md-2 control-label">name</label>
                <div class="col-md-10">
                    <input type="text" class="form-control" id="name" placeholder="name" name="memberName" oninput="check()">
                </div>
            </div>
		</div>
                <div class="col-md-1 offset-md-6 signup-button">
                    <button type="submit" class="btn btn-primary" id="signupBtn">Sign Up</button>
                </div>
        </form>
    </div>
    
    <script>
    	$('#username').keydown(function(key) {
    		if (key.keyCode == 13) {
    			key.preventDefault();
    			checkId();
    			$("#password").focus();
    		}
    	});
    	
    	function checkId() {
    		var inputed = $('#username').val().trim();
//     		console.dir(inputed);
    		
    		$.ajax({
    			data: {memberId: inputed},
    			dataType: "json",
    			url: "<c:url value='/member/checkId.do'/>"
    		}).done(function (data) {
    			if(inputed=="" && data=='0'){
    				$("#signupBtn").prop("disabled", true);
    				alert("id를 입력해주세요.");
    			} else if (data == '0') {
    				$("#signupBtn").prop("disabled", false);
    			} else if (data == '1') {
    				$("#signupBtn").prop("disabled", true);
    				alert("id가 중복되었습니다.");
    			}
    		});
    		
    	}

    	$('#password').keydown(function(key) {
    		if (key.keyCode == 13) {
    			key.preventDefault();
    			$("#email").focus();
    		}
    	});
    	
    	$('#email').keydown(function(key) {
    		if (key.keyCode == 13) {
    			key.preventDefault();
    			$("#name").focus();
    		}
    	});
    	
    	$('#name').keydown(function(key) {
    		if (key.keyCode == 13) {
    			key.preventDefault();
    		}
    	});
    	
    	function check() {
    		$("#signupBtn").prop("disabled", false);
    	}
    	
    	$("#signupBtn").click(function (e) {
    		console.dir($('#username').val());
    		console.dir($('#password').val());
    		console.dir($('#email').val());
    		console.dir($('#name').val());
    		if ($('#username').val() == "" || $('#password').val() == "" || $('#Email').val() == "" || $('#name').val() == "") {
    			e.preventDefault();
    			alert("입력란을 확인해주세요.");
    			$("#signupBtn").prop("disabled", true);
    		} else {
    			$("#signupBtn").prop("disabled", false);
    		}
    		
    		$("#signup").submit();
    	});
    </script>
</body>
</html>