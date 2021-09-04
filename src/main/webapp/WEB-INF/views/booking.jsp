<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" style="border-style: solid;">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <a href="room"></a>
    <link rel="stylesheet" href="untitled-1.CSS">
</head>

<body>
<%
   String loginid=(String)session.getAttribute("loginid");
	out.println(loginid);
   if(!loginid.equals("admin")){
	  response.sendRedirect("http://localhost:8080/app/login");
   }
   %>
    <header>
        <table>
            <th style="background-color: chartreuse;" id="guest">객실관리</th>
            <th><a href="room">예약관리</a></th>
            <th> <a href="logout">로그아웃</a></th>
        </table>
    </header>

    <div>
        <div id="s_left" style=" float: left; width: 33%;">
            <div style="border-style: solid;">
                숙박기간 <input type="date"><br>
                객실분류
                <select>
                    <option>Suite Room</option>
                    <option>Family Room</option>
                    <option>Double Room</option>
                    <option>Single Room</option>
                    <option>Domitory</option>
                </select>
                <input type="button" value="찾기">
            </div>
          
           <p>예약가능</p>
            <table style="border: solid;">

                <tr><td>한라산</td></tr>
                <tr><td>지리산</td></tr>
                <tr><td>백두산</td></tr>
                <tr><td>관악산</td></tr>
                <tr><td>남산</td></tr>
            </table>
        </div>


        <div id="contesnts" style=" float: left; width: 33%;">
            <th>
                객실관리<input type="text"><br>
                숙박기간<input type="date"><br>
                숙박인원<input type="number">명<br>
                1박비용<input type="number">원<br>
                총 숙박비<input type="number">원<br>
                예약자 모바일<input style="margin-bottom: 10%;" type="number"><br>
                <input type="button" value="등록">
                <input type="button" value="취소">
                <input type="button" value="Clear">
            </th>



        </div>

        <div id="s_rigth">
            <p>예약된 객실</p>
            <table style="border: 2px solid;">
                <tbody>
                    <tr><td>광덕산</td></tr>
                    <tr><td>태조산</td></tr>
                    <tr><td>흑성산</td></tr>
                    <tr><td>관악산</td></tr>
                </tbody>
            </table>

        </div>
        </div>
  
</body>
</html>
   