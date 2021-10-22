<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Index</title>
<link href="./resources/css/index.css" rel="stylesheet">

<style>

.section {
	width:100%;
	margin-top: 80px;
	margin-bottom: 100px;
    overflow: hidden;
}

.section input[id*="slide"] {
	display: none;
}

.section .slidewrap {
	max-width: 100%;
	margin: 0 auto;
	overflow: hidden;
	position:relative;
}

.section .slidelist {
	white-space: nowrap;
	font-size: 0;
}

.section .slidelist > li {
	display: inline-block;
	vertical-align: middle;
	width: 100%;
	transition: all .5s;
}

.section .slidelist > li > a {
	display: block;
	position: relative;
}

.section .slidelist > li > a img {
	width: 100%;
}

.section .slidelist label {
	position: absolute;
	z-index: 10;
	top: 50%;
	transform: translateY(-50%);
	padding: 50px;
	cursor: pointer;
}

.section .slidelist .left {
	left: 30px;
	background: url("http://localhost:8080/GSupport/resources/images/left.png") center center/100% no-repeat;
}

.section .slidelist .right {
	right: 30px;
	background: url("http://localhost:8080/GSupport/resources/images/right.png") center center/100% no-repeat;
}

.section [id="slide01"]:checked ~ .slidewrap .slidelist > li {
transform:translateX(0%);
}

.section [id="slide02"]:checked ~ .slidewrap .slidelist > li {
transform:translateX(-100%);
}

.section [id="slide03"]:checked ~ .slidewrap .slidelist > li {
transform:translateX(-200%);
}
</style>
</head>
<body>


	<!-- navbar -->
	<%@ include file="./component/navbar.jsp"%>
		<div class="section">
			<input type="radio" name="slide" id="slide01" checked> 
			<input type="radio" name="slide" id="slide02"> 
			<input type="radio" name="slide" id="slide03">

			<div class="slidewrap">
				<ul class="slidelist">
					<li>
						<a href="./about.do"> 
							<label for="slide03" class="left"></label> 
							<img src="http://localhost:8080/GSupport/resources/images/header1.png">
							<label for="slide02" class="right"></label>
						</a>
					</li>
					<li>
						<a href="./storeList.do"> 
							<label for="slide01" class="left"></label> 
							<img src="http://localhost:8080/GSupport/resources/images/header2_2.png">
							<label for="slide03" class="right"></label>
						</a>
					</li>
					<li>
						<a> 
							<label for="slide02" class="left"></label> 
							<img src="http://localhost:8080/GSupport/resources/images/header3.png">
							<label for="slide01" class="right"></label>
						</a>
					</li>

				</ul>
			</div>
		</div>

	<!-- 		<div class="header-img"></div> -->



	<!-- footer -->
	<%@ include file="./component/footer.jsp"%>≠


</body>
</html>