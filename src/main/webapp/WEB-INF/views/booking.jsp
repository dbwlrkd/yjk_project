<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>객실관리</title>
    <a href="room"></a>
</head>

<body>
<%
   String loginid=(String)session.getAttribute("loginid");
	out.println(loginid);
   if(!loginid.equals("admin")){
	  response.sendRedirect("http://localhost:8080/app/login");
   }
   %>
<div id="bg">
    <img src="./resources/img/flower.png" alt="">
</div>
 <div class="nav">
 <div class="nav-it">
 	<div class="nav-item"><p style="background-color: chartreuse;" id="guest">객실관리<p></div>&nbsp;
 	<div class="nav-item"><p><a href="room">예약관리</a><p></div>&nbsp;
 	<div class="nav-item"><p><a href="logout">로그아웃</a></p></div>
 </div>
 </div>
 	<div class="main">
 		<div class=menual>
 			<div class=item>
 				숙박기간 <input type="date"><br>
               	 객실분류<select>
                    <option>Suite Room</option>
                    <option>Family Room</option>
                    <option>Double Room</option>
                    <option>Single Room</option>
                    <option>Domitory</option>
                </select>
                <input type="button" value="찾기">
 			<p>예약가능</p>
            <table style="border: solid 1px;">
                <tr><td>한라산</td></tr>
                <tr><td>지리산</td></tr>
                <tr><td>백두산</td></tr>
                <tr><td>관악산</td></tr>
                <tr><td>남산</td></tr>
            </table>
 			</div>
 			<div class=item>
 			객실관리<input type="text"><br>
                숙박기간<input type="date"><br>
                숙박인원<input type="number"><br>
                1박비용<input type="number"><br>
                총 숙박비<input type="number"><br>
                예약자 모바일<input style="margin-bottom: 10%;" type="number"><br>
 			<input type="button" value="예약완료" class="btn">
 			<input type="button" value="리셋" class="btn">
 			<input type="button" value="예약취소" class="btn">
 			</div>
 			<div class=item>
 			<p>예약된 객실</p>
            <table style="border: 1px solid;">
                <tbody>
                    <tr><td>광덕산</td></tr>
                    <tr><td>태조산</td></tr>
                    <tr><td>흑성산</td></tr>
                    <tr><td>관악산</td></tr>
                </tbody>
            </table>
 			</div>
 		</div>
 	</div>
</body>
<style>
#bg {
z-index: -11;
    position:absolute; 
    position: fixed; 
    top: 0%; 
    left: 0%;
    width: 100%;        
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
.nav {
	height: 70px;
	border-bottom: 1px solid black;
	display: flex;
	align-items: center;
}
.nav-it{
	display: flex;
}
.item{
	width: 300px;
	height: 500px;
	border: 1px solid black;
	margin: 20px;
	border-radius: 6px;
	text-align: center;
	line-height: 30px;
	font-weight: bold;
	padding: 20px;
}
.menual{
	display: flex;
}
.main{
	width: 1000px;
	margin: 0 auto;
	margin-top: 60px;
}
.btn{
	padding: .5rem .1rem;
	font-size: 1.25rem;
	line-height: 1.5;
	border-radius: .3rem;
	color: white;
	background-color: #007bff;
	background-image: none;
	border-color: #007bff; 
	margin-top: 30px;
}
</style>
</html>
   