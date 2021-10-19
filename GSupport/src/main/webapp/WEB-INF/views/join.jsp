<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G원사격 | 회원가입</title>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/base.css" rel="stylesheet">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<style>



#joinForm{
	margin: 0 auto;
	height: 500px;
	width: auto;
	border: none;
	padding: 10px;
	border-radius: 5px;
    background-color: #EEEFF177;
}

#joinForm h2{
	position:fixed;
	top:8%;
	width: 80%;
	left:50%;
	border: none;
	border-radius: 5px;
	transform:translate(-50%);
	text-align: center;
	margin-bottom: 0px;
	font-size: 30px;
}

#joinForm p {
	position:fixed;
	top:15%;
	width: 80%;
	left:50%;
	border: none;
	border-radius: 5px;
	transform:translate(-50%);
	text-align: center;
	margin-bottom: 0px;
	font-size: 20px;
}

#joinId {
	position:fixed;
	width: 60%;
	left:50%;
	height: 40px;
	border: none;
	border-radius: 5px;
	font-size: 14px;
	transform:translate(-50%);
	bottom:70%;
}

#joinName {
	position:fixed;
	width: 60%;
	left:50%;
	height: 40px;
	border: none;
	border-radius: 5px;
	font-size: 14px;
	transform:translate(-50%);
	bottom:58%;
}

#joinPw {
	position:fixed;
	width: 60%;
	left:50%;
	height: 40px;
	border: none;
	border-radius: 5px;
	font-size: 14px;
	transform:translate(-50%);
	bottom:46%;
}

#joinConfirmPw {
	position:fixed;
	width: 60%;
	left:50%;
	height: 40px;
	border: none;
	border-radius: 5px;
	font-size: 14px;
	transform:translate(-50%);
	bottom:34%;
}

#birthDate {
	position:fixed;
	width: 60%;
	left:50%;
	height: 40px;
	border: none;
	border-radius: 5px;
	font-size: 14px;
	transform:translate(-50%);
	bottom:22%;
}

#joinSubmit {
	position:fixed;
	width: 60%;
	height: 40px;
	left:50%;
	transform:translate(-50%);
	border: none;
	background-color: #728FCE;
	border-radius: 5px;
	font-size: 17px;
	color: white;
	padding: 10px;
	letter-spacing: 5px;
	font-weight: 600;
	bottom:10%;
}

.joinInput {
	border: none;
	color: black;
	border-bottom: 2px solid #D1D1D4;
	background: #f5f5f5;
	padding: 15px;
	padding-left: 24px;
	font-weight: 700;
	width: 75%;
	transition: .4s;
}

.joinInput:active,
.joinInput:focus,
.joinInput:hover {
	background: #f5f5f5;
	outline: none;
	border-color: green;
}

/*중복확인 버튼*/
#check_id{
    width: 75px;
    position: absolute;
    top: 73px;
    left: 463px;
    cursor: pointer;
    height: 30px;
    line-height: 30px;
    border-radius: 0 10px 10px 0;
    border: none;
    border-left: 2px solid #728FCE;
    box-shadow: none;
    background-color: white;
    transition: 0.3s;
    font-size: 13px;
}

#check_id:hover{
	background-color: #D6EAF8;
}



</style>
<!-- AJAX사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">
</script>
<script type="text/javascript">
/*비밀번호 일치 검사*/

function isSame() {
	var pw1 = $("#joinPw").val();
	var pw2 = $("#joinConfirmPw").val();
    
	if(pw1.length < 6 || pw1.length > 30){
			$("#joinErr").text("비밀번호를 6자 이상 입력해주세요.");
			$("#joinPw").css("border-color", "red");
            return false;
    }
	if(pw1.length > 5){
    	if(pw1 == pw2 && pw2 == pw1) {
    		$("#joinErr").text(" ");
			$("#joinPw").css("border-color", "#6A679E");
			$("#joinConfirmPw").css("border-color", "#6A679E");
            return true;
        } else if(pw2 == "") {
        	$("#joinErr").text("비밀번호를 한번 더 입력해주세요.");
			$("#joinConfirmPw").css("border-color", "red");
        } else {
            $("#joinErr").text("비밀번호가 일치하지 않습니다.");
			$("#joinPw").css("border-color", "red");
			$("#joinConfirmPw").css("border-color", "red");
        }
    } 
}

function checkID(){
	var id = $("#joinId").val();
	var email = $("#joinId").val();
	var agent = navigator.userAgent.toLowerCase();
	var joinErr = document.getElementById('joinErr');		
	

	
	if(id.length < 5 || id.indexOf('.') == -1 || id.indexOf('@') == -1){
		$("#joinErr").text("이메일을 다시 확인해주세요.");
		$("#joinErr").css("color", "red");
		$("#joinId").focus();
	} else {
		$.ajax({
			type:'get',
			dataType:'text',
			data: 'email='+email,
			url: '${pageContext.request.contextPath}/emailCount.do',
			success: function(rData, textStatus, xhr){
				if(rData == 1){
					$("#joinErr").text("이미 등록된 이메일 입니다.");
					$("#joinErr").css("color", "red");
				}else{
					$("#joinErr").text(" ");
					return true;
				}
			},
			error: function(xhr, status, e){
				alert("문제 발생 : " + e);
			}
		});
		
	}
	
}

function checkName(){
	var ame = $("#joinName").val();
	var joinErr = document.getElementById('joinErr');		
	

	
	if(id.length < 5 || id.indexOf('.') == -1 || id.indexOf('@') == -1){
		$("#joinErr").text("이메일을 다시 확인해주세요.");
		$("#joinErr").css("color", "red");
		$("#joinId").focus();
	} else {
		$.ajax({
			type:'get',
			dataType:'text',
			data: 'email='+email,
			url: '${pageContext.request.contextPath}/emailCount.do',
			success: function(rData, textStatus, xhr){
				if(rData == 1){
					$("#joinErr").text("이미 등록된 이메일 입니다.");
					$("#joinErr").css("color", "red");
				}else{
					$("#joinErr").text(" ");
					return true;
				}
			},
			error: function(xhr, status, e){
				alert("문제 발생 : " + e);
			}
		});
		
	}
	
}

function join(){
	var id = document.getElementById('id');
	var name = document.getElementById('name');
	var pw1 = document.getElementById('pw1');
	var email = document.getElementById('email');
	var phone = document.getElementById('phone');
	var date = document.getElementById('date');	
	
	//id가 없거나, 5글자 이하라면
	if(id.value == "" || id.value.length < 5){
		alert('아이디를 5자 이상 입력해주세요.');
		id.focus();
		id.style.backgroundColor = '#F5B7B1';
		return false;
	}
	if(name.value ==""){
		alert("이름을 입력해주세요.");
		name.focus();
		name.style.backgroundColor = '#F5B7B1';
		return false;
	}
	if(pw1.value == ""|| pw1.value.length < 5){
		alert("비밀번호를 5글자 이상 입력해주세요.");
		pw1.focus(); // 마우스 이동
		return false;
	}	
	
	if(phone.value == "" || phone.value.length < 10 ){
		alert("핸드폰 번호를 입력하세요.");
		email.style.backgroundColor='#F5B7B1';
		email.focus();
		return false;
	}
	
	if(email.value == ""){
		alert("email을 입력하세요.");
		email.style.backgroundColor='#F5B7B1';
		email.focus();
		return false;
	}
	
	if(date.value == ""){
		alert("생일을 입력하세요.");
		date2.style.backgroundColor='#F5B7B1';
		date2.focus();
		return false;
	}		
}
/*ajax
$(function(){
	$("#join_join").prop("disabled", true); //가입하기 버튼 비활성화
	$("#resultText").css("color","red");
});
*/

function handleOnInput(e) {
	e.value = e.value.replace(/[^a-z0-9@.-_]/ig, '')
}

function handleOnInputName(e)  {
	  e.value = e.value.replace(/[^ㄱ-힣a-zA-Z0-9]/ig, '')
	}

</script>


		<div id ="joinForm">
			<h2>회 원 가 입</h2><br>
			<p id="joinErr"></p>
			
			<form action="${pageContext.request.contextPath }/join.do" method="post" autocomplete="off">
				<div>
					<input type="email" id="joinId" name="id" class="joinInput" style="text-transform: lowercase" placeholder="이메일" required="required" onchange="checkID()" oninput="handleOnInput(this)" onfocus="focusID()">
				</div>
				<div>
					<input type="text" id="joinName" name="name" class="joinInput" placeholder="닉네임" required="required" onchange="checkName()" oninput="handleOnInputName(this)" onfocus="focusName()">
				</div>
				<div>
					<input type="password" id="joinPw" name="pw" class="joinInput" placeholder="비밀번호" required="required" onchange="isSame()" onfocus="focusPw()">
				</div>
				<div>
					<input type="password" id="joinConfirmPw" name="confirmPw" class="joinInput" placeholder="비밀번호 확인" required="required" onchange="isSame()">
					<input type="text" name="channel" value="web" hidden="hidden">
				</div>
			
				<div>
					<input type="date" id="birthDate" name="birthDate" class="joinInput" placeholder="생년월일" required="required" onchange="checkBirth()" onfocus="focusBirth()">
				</div>
			
					<input type="submit" id="joinSubmit" name="joinSubmit" value="가입하기">
		</form>
				
		</div>
	
	
</html>