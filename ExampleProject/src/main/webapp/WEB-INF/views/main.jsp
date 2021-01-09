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
</head>

<body>
	<section class="main_slides">
        <h2 class="hidden">main_slides</h2>
        <ul>
            <li class="slide slide1">
                <div class="container slide_contents">
                    <div class="contents jumbotron">
                        <h2>이것이 코트다</h2>
                        <h3>코트가 좋아</h3>
                        <p>코트를 사줘요</p>
                        <div class="price_order">
                            <span class="price">가격입력1</span>
                            <a class="order_now" href="">Order now</a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="slide slide1">
                <div class="container slide_contents">
                    <div class="contents jumbotron">
                        <h2>ㅎㅇ</h2>
                        <h3>반갑습니다</h3>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry </p>
                        <div class="price_order">
                            <span class="price">가격입력2</span>
                            <a class="order_now" href="">Order now</a>
                        </div>
                    </div>
                </div>
            </li>
            <li class="slide slide1">
                <div class="container slide_contents">
                    <div class="contents jumbotron">
                        <h2>ㅎㅎ</h2>
                        <h3>Half Jacket + Skiny Trousers + Boot leather</h3>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry </p>
                        <div class="price_order">
                            <span class="price">가격입력3</span>
                            <a class="order_now" href="">Order now</a>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </section>
    
    <main class="container">
        <section class="new_arrivals">
            <h2 class="content_title"><span>멋진</span> 상품들</h2>
            <p class="content_desc">빨리 사주세요</p>
            <ul class="new_arrivals_list row">
             <c:forEach var="list" items="${list}">
                <li id="product_02" class="col-md-3">
                    <div class="list_contents">
                        <div class="default">
                            <img src="images/jacket_01.jpg" alt="jacket">       
                            <h3>${list.product_name}</h3> 
                            <h4>${list.product_price}</h4>
                        </div>
                        <div class="hover">
                            <p>sizes :<span class="size">s - m - l - xl - f</span></p>
                            <p class="color">
                                <span class="red">red</span>
                                <span class="darkmagenta">darkmagenta</span>
                                <span class="lightskyblue">lightskyblue</span>
                                <span class="lightgreen">lightgreen</span>
                            </p>
                            <hr/>
                            <ul>
                                <li><a href="detail.do?product_code=${list.product_code}" class="sprites share">제품자세히보기</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
              </c:forEach>
            </ul>
        </section>
    
	<%-- 	<div class="list">
			<h2>제품리스트</h2>
			<c:forEach var="list" items="${list}">
			
			<section class="main_section1">
				<a href="detail.do?product_code=${list.product_code}">
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
		</div> --%>

</body>
</html>