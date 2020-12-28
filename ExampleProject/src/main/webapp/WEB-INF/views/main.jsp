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
		<!-- 여기까지 슬라이드 -->

		<!-- 현재 슬라이드 위치 표시 -->

		<div class="list">
			<h2>신상</h2>
			<section class="main_section1">
				<a href="product_ext1.html"> <img src="resources/image/t1.jpg"
					alt="사진1">
					<div class="list_option">
						<ul>
							<li>옷 이름을 정하세요</li>
							<li>사이즈를 정하세요</li>
							<li>색상을 정하세요</li>
						</ul>
					</div></a>
			</section>

			<section class="main_section2">
				<img src="resources/image/t2.jpg" alt="사진2">
				<div class="list_option">
					<div>
						<ul>
							<li>옷 이름을 정하세요</li>
							<li>사이즈를 정하세요</li>
							<li>색상을 정하세요</li>
						</ul>
					</div>
				</div>
			</section>

			<section class="main_section3">
				<img src="resources/image/t3.jpg" alt="사진3">
				<div class="list_option">
					<div>
						<ul>
							<li>옷 이름을 정하세요</li>
							<li>사이즈를 정하세요</li>
							<li>색상을 정하세요</li>
						</ul>
					</div>
				</div>
			</section>
		</div>

		<div class="list">
			<h2>베스트</h2>
			<section class="main_section1">
				<img src="resources/image/t4.jpg" alt="사진4">
				<div class="list_option">
					<div>
						<ul>
							<li>옷 이름을 정하세요</li>
							<li>사이즈를 정하세요</li>
							<li>색상을 정하세요</li>
						</ul>
					</div>
				</div>
			</section>

			<section class="main_section2">
				<img src="resources/image/t5.jpg" alt="사진5">
				<div class="list_option">
					<div>
						<ul>
							<li>옷 이름을 정하세요</li>
							<li>사이즈를 정하세요</li>
							<li>색상을 정하세요</li>
						</ul>
					</div>
				</div>
			</section>

			<section class="main_section3">
				<img src="resources/image/t6.jpg" alt="사진6">
				<div class="list_option">
					<div>
						<ul>
							<li>옷 이름을 정하세요</li>
							<li>사이즈를 정하세요</li>
							<li>색상을 정하세요</li>
						</ul>
					</div>
				</div>
			</section>
		</div>

		<div class="list">
			<h2>추천!</h2>
			<section class="main_section1">
				<img src="resources/image/t7.jpg" alt="사진7">
				<div class="list_option">
					<div>
						<ul>
							<li>옷 이름을 정하세요</li>
							<li>사이즈를 정하세요</li>
							<li>색상을 정하세요</li>
						</ul>
					</div>
				</div>
			</section>

			<section class="main_section2">
				<img src="resources/image/t8.jpg" alt="사진8">
				<div class="list_option">
					<div>
						<ul>
							<li>옷 이름을 정하세요</li>
							<li>사이즈를 정하세요</li>
							<li>색상을 정하세요</li>
						</ul>
					</div>
				</div>
			</section>

			<section class="main_section3">
				<img src="resources/image/t9.jpg" alt="사진9">
				<div class="list_option">
					<div>
						<ul>
							<li>옷 이름을 정하세요</li>
							<li>사이즈를 정하세요</li>
							<li>색상을 정하세요</li>
						</ul>
					</div>
				</div>
			</section>
		</div>
		<div class="list">

			<h2>당일배송!</h2>
			<section class="main_section1">
				<img src="resources/image/t10.jpg" alt="사진10">
				<div class="list_option">
					<div>
						<ul>
							<li>옷 이름을 정하세요</li>
							<li>사이즈를 정하세요</li>
							<li>색상을 정하세요</li>
						</ul>
					</div>
				</div>
			</section>

			<section class="main_section2">
				<img src="resources/image/t11.jpg" alt="사진11">
				<div class="list_option">
					<div>
						<ul>
							<li>옷 이름을 정하세요</li>
							<li>사이즈를 정하세요</li>
							<li>색상을 정하세요</li>
						</ul>
					</div>
				</div>
			</section>

			<section class="main_section3">
				<img src="resources/image/t12.jpg" alt="사진12">
				<div class="list_option">
					<div>
						<ul>
							<li>옷 이름을 정하세요</li>
							<li>사이즈를 정하세요</li>
							<li>색상을 정하세요</li>
						</ul>
					</div>
				</div>
			</section>
		</div>
	</div>

	<div id="helper">
		<a href="#" class="up"><p>↑</p></a> <a href=""><p>■</p></a> <a
			href="#down_test" class="down"><p>↓</p></a>
	</div>

	<hr>
</body>

</html>