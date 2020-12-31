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
				<a href="${path}/WEB-INF/views/product_detail/${row.product_code}"> <!-- 클릭시 상품 상세정보로 이동 -->
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
</body>
</html>