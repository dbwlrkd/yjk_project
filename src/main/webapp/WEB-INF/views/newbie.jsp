<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form method="get" action="/app/home">
사용할ID <input type=text name=userid><br>
비밀번호 <input type="text" name=passcode><br>
이름 <input type=text name=name><br>
휴대번호 <input type text name=mobile><br>
<input type="submit" value="전송">&nbsp;
	<a href='/app/'>취소</a>&nbsp;
</form>
</body>
</html>