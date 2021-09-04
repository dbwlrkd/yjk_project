<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
</head>
<body>
<form method="post" action="/app/check_user">
	USERID<input type=text name=userid><br>
	USERPW<input type=password name=passcode><br><br>
	<input type="submit" value="로그인">&nbsp;
	<a href='/app'>취소</a>&nbsp;
<a href="selected?path=newbie">회원가입</a>


</form>
</body>
</html>
