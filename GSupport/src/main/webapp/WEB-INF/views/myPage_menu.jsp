<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./resources/css/myPage.css" rel="stylesheet">

<style>
</style>

</head>
<body>

	<div class="column side">
		<div class="account_profile">
			<div class="title">
				<h1>
					마이페이지<br>
				</h1>
				<span class="name"><strong>${sessionScope.name}</strong> 님
					안녕하세요</span>
			</div>
		</div>
		<div class="customer_side">
			<h1 class="customer_side_title">나의 정보</h1>
			<ul class="customer_side_list">
				<li><a href="./myPage_update.do">회원정보 수정 </a></li>
				<li><a href="">비밀번호 변경 </a></li>
				<li><a href="">회원 탈퇴 </a></li>
			</ul>
		</div>

		<div class="customer_side">
			<h1 class="customer_side_title">예약 관리</h1>
			<ul class="customer_side_list">
				<li><a href="">grade1용 예약 확인하기 </a></li>
				<li><a href="">grade2용 예약 확인하기 </a></li>
				<li><a href="">예약 변경 / 취소 </a></li>
			</ul>
		</div>

		<div class="customer_side">
			<h1 class="customer_side_title">활동</h1>
			<ul class="customer_side_list">
				<li><a href="">쪽지함 </a></li>
				<li><a href="">쪽지 보내기 </a></li>
			</ul>
		</div>

		<div class="customer_side">
			<h1 class="customer_side_title">즐겨찾기</h1>
			<ul class="customer_side_list">
				<li><a href="">즐겨찾기 관리 </a></li>
			</ul>
		</div>
	</div>


</body>
</html>