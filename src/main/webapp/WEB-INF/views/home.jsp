<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>

<head>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>로그인</title>
</head>
<body class="text-center"></body>
<div class="main">
<!--<img class="mb-4" src="https://getbootstrap.com/docs/4.0/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">-->
<img src="./resources/img/banner.jpg" width="600" height="150">
      <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
    <form method="post" action="/app/check_user" class="form-signin">
			USERID&nbsp;&nbsp;<input type=text name=userid class="log" placeholder="유저아이디를 입력해주세요" required autofocus"><br>
			USERPW&nbsp;<input type=password name=passcode class="log" placeholder="비밀번호"><br><br>
			<input type="submit" class="btn" value="로그인">&nbsp;
			 <a href='/app'>취소</a>&nbsp;
			<a href="selected?path=newbie">회원가입</a>
		
	</form>
      <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
      </div>
    <style>
.main {
	text-align: center;
	margin-top: 50px;
}
.log{
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 10px;
	font-size: 16px;
}
.btn{
 	position: relative;
 	box-sizing: border-box;
 	height: auto;
 	padding: 10px;
 	font-size: 16px;
	color: #fff;
    background-color: #007bff;
    border-color: #007bff;
    border-radius: .25rem;
} 
body {
	height: 100%;
}
body {
	display: -ms-flexbox;
	display: -webkit-box;
	display: flex;
	-ms-flex-align: center;
	-ms-flex-pack: center;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-signin {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: 0 auto;
	font-weight: 400;
}
.form-signin .log {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 10px;
	font-size: 16px;
}
.form-signin .log:focus {
	z-index: 2;
}
</style>
</body>
</html>
