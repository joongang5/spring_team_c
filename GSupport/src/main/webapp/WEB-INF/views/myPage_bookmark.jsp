<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page Bookmark</title>
<script type="text/javascript">
	function linkPage(pageNo) {
		location.href = "./myPage_bookmark.do?pageNo=" + pageNo;
	}
</script>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/myPage.css" rel="stylesheet">
<link href="./resources/css/base.css" rel="stylesheet">
<script src="../assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<style>

.customer_content_reservHistory {
	border-top: 1px solid #141414;
	background-color: #ffffff;
	margin-top: 20px;
	padding: 10px;
}

.customer_content_reservHistory_header {
	border-bottom: 1px solid #e5e5e5;
	margin-bottom: 10px;
	height:40px;
	padding:5px;
}

.customer_content_reservHistory_content {
	border-bottom: 1px solid #e5e5e5;
    padding: 10px 20px 10px 20px;	
    font-size:12px;
	
}

.button_submit {
	float:right;
	width: auto;
	height: 20px;
	font-size: 10px;
	text-align: center;
	font-weight: bold;
	background-color: white;
	color: green;
	border:none;
	
}

</style>
<body>

	<!-- Navbar -->
	<%@ include file="./component/navbar.jsp"%>

	<div class="container">
		<!-- Mypage menu -->
		<%@ include file="./myPage_menu.jsp"%>

		<!-- Mypage Content -->
		<div class="column middle">
			<div class="activity">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">예약</h4>
						<p class="card-text">??개</p>
						<a href="#" class="btn btn-primary">예약 확인</a>
					</div>
				</div>

				<div class="card">
				<a href="" class="">
					<div class="card-body">
						<h4 class="card-title">쪽지</h4>
						<p class="card-text">??개 /안 읽은거 ??개</p>
					</div>
				</a>
				</div>

				<div class="card">
					<div class="card-body">
						<h4 class="card-title">즐겨찾기</h4>
						<p class="card-text">??건</p>
						<a href="#" class="btn btn-primary">즐겨찾기</a>
					</div>
				</div>
			</div>

			<div class="customer_content">
				<h1>즐겨찾기 목록</h1>
				<c:forEach items="${list }" var="l">
					<div class="customer_content_reservHistory">
						<div class="customer_content_reservHistory_header"><a href="./storeDetail.do?shop_no=${l.shop_no }">${l.shop_name }</a> 
							<button class="button_submit" type="submit"><img src="resources/images/star_after.png" style="height:20px;"></button>
							</div>
						<div class="customer_content_reservHistory_content">
							<div class="customer_content_reservHistory_content_detail">
								${l.shop_loc } <br> 
								${l.shop_tel } <br> ${l.shop_opentime } ~ ${l.shop_closetime }

							</div>
						</div>
					</div>
					
				</c:forEach>
			</div>
			<div id="boardPaging">
				<ui:pagination paginationInfo="${paginationInfo }" type="text"
					jsFunction="linkPage" />
			</div> 


		</div>
		
	</div>




	<!-- footer -->
	<%@ include file= "./component/footer.jsp"%>
	

</body>
</html>