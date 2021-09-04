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
    <a href="booking"></a>
</head>
<body>
    <header>
 

        <table>
        <th> <a href="booking">객실관리</a></th>
        <th style="background-color: chartreuse;" id="rese">예약관리</th>
        <th> <a href="logout">로그아웃</a></th>
   	 </table>
    </header>
    
    <div>
    
        <p>객실이름 <input type="text" id=textN><input type=hidden id=roomcode></p>
        <p>객실분류</p>
             <select size=10 style="width:250px;" id=selRoom>
    <c:forEach items="${list}" var="room">
    	<option value='${room.roomcode}'>${room.roomname},${room.typename},${room.howmany},${room.howmuch}</option>
   	</c:forEach>
   	
   	
       <p>숙박가능인원 <input type="number" texsize="5px" id=txtNum>명</p>
        <p>1박요금 <input type="text" id=txtP>원</p>
        <div style=border-style:solid;>
        <p>타입</p>
   	 <select size=10 style="width:250px;" id="selType">
   <c:forEach items="${type}" var="roomtype">
    	<option value="${roomtype.typecode}">${roomtype.name}</option>
   	</c:forEach>
            <p>객실목록</p>
           
        </div>
    </div>
    <input type= button value="등록" id=btnadd>
    <input type= button value="취소" id=btnEmpty>
    <input type= button value="삭제" id=btnDelete>

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
</style>
</html>