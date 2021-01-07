<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setDateHeader("Expires", 0L);
%> <!-- 뒤로가기 캐시 삭제 -->

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>main</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<script src="resources/Js/main.js"></script>
</head>

<body>

	<div id="main_content">

		<!-- 밑에서부터 슬라이드 시작 -->
		<div class="slide_container">

			<div class="mySlides fade">
				<div class="numbertext">1 / 3</div>
				<img src="resources/image/banner1.jpg">
				<div class="text">
					<a href="#">클릭1</a>
				</div>
			</div>

			<div class="mySlides fade">
				<div class="numbertext">2 / 3</div>
				<img src="resources/image/banner2.jpg">
				<div class="text">
					<a href="#">클릭2</a>
				</div>
			</div>

			<div class="mySlides fade">
				<div class="numbertext">3 / 3</div>
				<img src="resources/image/banner3.jpg">
				<div class="text">
					<a href="#">클릭3</a>
				</div>
			</div>
			<!-- 여기까지 슬라이드 본문 -->

			<!-- 밑은 양옆으로 옮기는 화살표 -->
			<a class="left_btn smart_btn" onclick="plusSlides(-1)">◀</a> <a
				class="right_btn smart_btn" onclick="plusSlides(1)">▶</a>
		</div>
		<div style="text-align: center">
			<span class="dot" onclick="currentSlide(1)"></span> <span class="dot"
				onclick="currentSlide(2)"></span> <span class="dot"
				onclick="currentSlide(3)"></span>
		</div>
		</div>
		<!-- 여기까지 슬라이드 -->

		<!-- 현재 슬라이드 위치 표시 -->
		
		<div class="list">
			<h2>제품리스트</h2>
			<c:forEach var="list" items="${list}">
			
			<section class="main_section1">
				<a href="product_detail.do?product_code=${list.product_code}">
				<img src="resources/image/${list.product_code}.jpg" alt="사진">
					<div class="list_option">
						<ul>
							<li>제품이름:${list.product_name}</li>
							<li>사이즈를 정하세요</li>
							<li>색상:${list.color_name}</li>
						</ul>
					</div></a>
			</section>
			</c:forEach>
		</div>

</body>
</html>