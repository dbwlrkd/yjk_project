<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약관리</title>
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
 	<div class="nav-item"><p style="background-color: chartreuse;" id="guest">예약관리<p></div>&nbsp;
 	<div class="nav-item"><p><a href="booking">객실관리</a><p></div>&nbsp;
 	<div class="nav-item"><p><a href="logout">로그아웃</a></p></div>
 </div>
 </div>
 	<div class="main">
 		<div class=menual>
 			<div class=item>
 				<p>객실이름 <input type="text" id=textN><input type=hidden id=roomcode></p>
		        <p>객실분류</p>
             	<select size=10 style="width:250px;" id=selRoom>
			    <c:forEach items="${list}" var="room">
			    	<option value='${room.roomcode}'>${room.roomname},${room.typename},${room.howmany},${room.howmuch}</option>
			   	</c:forEach>
			       <p>숙박가능인원 <input type="number" texsize="5px" id=txtNum>명</p>
			        <p>1박요금 <input type="text" id=txtP>원</p>
 			</div>
 			<div class=item>
 			<div style=border-style:solid1px;>
       				 <p>타입</p>
   					 <select size=10 style="width:250px;" id="selType">
				   		<c:forEach items="${type}" var="roomtype">
				    		<option value="${roomtype.typecode}">${roomtype.name}</option>
				   		</c:forEach>
 				</div>
				<p>객실목록</p>
			 	<input type= button value="등록" id=btnadd class=btn>
			    <input type= button value="취소" id=btnEmpty class=btn>
			    <input type= button value="삭제" id=btnDelete class=btn>
			</div>
 			</div>
 			<div class=item>
 			
 			</div>
 		</div>
 	</div>
</body>
<script src="https://code.jquery.com/jquery-3.5.0.js"> </script>
<script>
$(document)
.ready(function(){
	$.post("http://localhost:8080/app/getRoomList",{},function(result){
		console.log(result);
		$.each(result,function(ndx,value){
			str='<option value="'+value['roomcode']+'">'+value['roomname']+','+
			value['typename']+','+value['howmany']+','+value['howmuch']+'</option>';
			$('#selRoom').append(str);
		});	
	},'json');
})
.on('click','#btnDelete',function(){
	$.post('Http://localhost:8080/app/deleteRoom',{roomcode:$('#roomcode').val()},
			function(result){
		console.log(result);
		if(result=="ok"){
			$('#btnEmpty').trigger('click'); //입력란 비우기
			$("#selRoom option:selected").remove(); //room 리스트에 비우기
		}
	},'text');
	return false;
})
.on('click','#selRoom option',function(){
	let str=$(this).text();
	let ar=str.split(',');
	
	
	$('#textN').val($.trim(ar[0]));
	console.log('['+$.trim(ar[1])+']');
	$('#selType option:contains("'+$.trim(ar[1])+'")').prop('selected','selected');
	
	$('#txtNum').val(ar[2]);
	$('#txtP').val(ar[3]);
	
	let code = $(this).val();
	$("#roomcode").val(code);
	
	return false;
})
.on('click','#btnEmpty',function(){
	$('#txtName,#txtNum,#txtP,#roomcode,#selType').val('');
	return false;
})
.on('click','#btnadd',function(){
	let roomname=String($('#textN').val());
	let roomtype=$('#selType').val();
	let howmany=$('#txtNum').val();
	let howmuch=$('#txtP').val();
	console.log("roomtype ["+roomtype+"]");
	if(roomname=='' || roomtype== '' || howmany=='' || howmuch==''){
		alert('누락된 값이 있습니다.')
		return false;
	}
	let roomcode=$("#roomcode").val();
	if($('#roomcode').val=='') { //insert
			$.post('http://localhost:8080/app/addRoom'
					,{roomname:roomname,roomtype:roomtype,howmany:howmany,howmuch:howmuch}
					,function(result){
						if(result=='ok'){
							location.reload();
						}
					},'text');		
	} else { // update
		$.post('http://localhost:8080/app/updateRoom',
			{roomcode:roomcode,roomname:roomname,roomtype:roomtype,howmany:howmany,howmuch:howmuch},
			function(result){
				if(result=='ok'){
					location.reload();
				}
			},'text');
	}
})
</script>
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
   