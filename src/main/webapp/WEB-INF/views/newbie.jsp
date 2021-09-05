<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body class="new">
<form method="post" action="/app/signin" class="form"  id="frmSignin">
		이름입력 <input type=text name=realname class="dow"><br>
		ID입력&nbsp;&nbsp;&nbsp; <input type=text name=userid class="dow"><br>
		비밀번호 <input type="password" name=passcode1 class="dow"><br>
		비번확인 <input type="password" name=passcode2 class="dow"><br>
		휴대번호 <input type text name=mobile class="dow"><br>
		<input type="submit" value="전송" class="btn">&nbsp;
				<a href='/app/'>취소</a>&nbsp;
</form>
	
      <!-- <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p> -->
       <div id="bg">
    <img src="./resources/img/flower.png" alt="">
</div>
<script src="https:code.jquery.com/jQuery-3.5.0.js"></script>
   <script>
$(document)
.on("submit","#frmSignin",function(){
   if($('input[name=realname]').val()==''){
      alert("이름을 입력하시오.");
      return false;
   }
   if($('input[name=userid]').val()==''){
      alert('로긴아이디를 입력하시오');
      return false;
   }
   if($('input[name=passcode1]').val()==''){
      alert("비밀번호를 입력하시오");
      return false;
   }
   if($("input[name=passcode1]").val()!=$('input[name=passcode2]').val()){
      alert("비밀번호가 일치하지 않습니다.");
      return false;
   }
   return true;
})
</script>
<style>
#bg {
z-index: -11;
    position:absolute; 
    position: fixed; 
    top: -50%; 
    left: -50%;
    width: 200%;        
    height: 200%;
}
#bg img{
    top:0; 
    left:0; 
    right:0; 
    bottom:0; 
    margin:auto; 
    min-width:50%;
    min-height:50%;
}
.new {
	text-align: center;
	margin-top: 20px;
}
.dow{
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

.form {
	width: 100%;
	max-width: 330px;
	padding: 15px;
	margin: 0 auto;
	font-weight: 400;
}
.form .dow {
	position: relative;
	box-sizing: border-box;
	height: auto;
	padding: 10px;
	font-size: 16px;
}
.form .log:focus {
	z-index: 2;
}
.btn {
margin-top: 30px;
margin-left: 50px;
}
</style>
</body>
</html>