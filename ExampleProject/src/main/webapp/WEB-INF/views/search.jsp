<%@ page language="java" contentType="text/html; charset= UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>검색결과</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<script src="/JavaScript/main.js"></script>
</head>

<body>
	<c:if test="${map.msg ne null }">
		<!-- 메세지 온게 있으면 alert으로 출력하는거 -->
		<script>
			alert('${map.msg}');
		</script>
	</c:if>
	<div id="header_form">
		<header class="header_top">
			<span class="left_menu"><a href="#">문의장소</a></span> <span
				class="right_menu"> <c:if test="${userInfo == null }">
					<a href="login.do">로그인</a>
				</c:if> <c:if test="${userInfo != null}">
					<a>${userInfo.name}님 환영합니다.</a>
					<a href="logout.do">로그아웃</a>
				</c:if> <a href="mypage.do">마이페이지</a> <a href="#">장바구니</a> <a href="#">Q&A</a></span>
		</header>

		<header class="header_middle">
			<a href="index.do"><img src="resources/image/logo.png" alt="로고"></a>
		</header>
		<h2>상품목록</h2>
		<c:if test="${sessionScope.adminId != null}">
		<button type="button" id="btnAdd">상품등록</button><br>
		</c:if>
		<table border="1">
		<tr>
			<th>상품 코드</th>
			<th>상품이미지</th>
			<th>상품명</th>
			<th>가격</th>
		</tr>
		<c:forEach var="row" items="${list}">
		<tr>
			<td>
				${row.product_code}
			</td>
			<td>
				<a href="${path}/shop/product/detail/${row.product_code}"> <!-- 클릭시 상품 상세정보로 이동 -->
				<img src="${path}/resources/image/t1.jpg" width="120px" height="110px"> 
				</a>
			</td>
			<td align="center">
				<a href="${path}/shop/product/detail/${row.product_name}">${row.product_name}</a><br>
				<c:if test="${sessionScope.adminId != null }">
					<a href="${path}/shop/product/edit/${row.productId}">[상품편집]</a>
					</c:if>
			</td>
			<td>
				
				<fmt:formatNumber value="${row.product_price}" pattern="###,###,###"/>
			</td>
			</tr>
			</c:forEach>
		</table>
	<footer>
		<div id="down_test"></div>
		<div id="address_box">

			<div class="address1">
				고객전화<br> 1234-5678<br> 월~금 : am 06:00 ~ am 09:00<br>
				주말안함<br> 내용없음<br> 할말없음
			</div>
			<div class="address2">
				무통장입금<br> 우리 156789-15156-8789<br> 농협 125486-1287-516897<br>
				국민 154-1548923-1549412<br> 신한 12454-1189-1541899<br> 예금주 :
				아무개<br>
			</div>
			<div class="address3">
				회사정보<br> (주) 회사<br> 대표 : 아무개<br> 사업자 등록 번호 :
				130-86-56658<br> E-mail : dkanro@dkanro.net<br> 주소 : 주소를
				입력<br>
			</div>
		</div>
	</footer>
</body>


</html>