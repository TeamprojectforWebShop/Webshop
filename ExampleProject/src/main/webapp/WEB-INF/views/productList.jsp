<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<div class="container">
		<h2>product list</h2>
		<div class="table-responsive">
			<table class="table table-striped table-sm">
				<colgroup>
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
					<col style="width: auto;" />
				</colgroup>
				<thead>
					<tr>
						<th>제품명</th>
						<th>제품코드</th>
						<th>색상</th>
						<th>성별</th>
						<th>S 사이즈</th>
						<th>M 사이즈</th>
						<th>L 사이즈</th>
						<th>XL 사이즈</th>
						<th>F 사이즈</th>
						<th>전체 사이즈 재고</th>
						<th>생산일</th>
						<th>가격</th>
						<th>제품 사진</th>
						<th>제품 설명1</th>
						<th>제품 설명2</th>
						<th>제품 설명3</th>
						<th>제품 설명4</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="5" align="center">데이터가 없습니다.</td>
							</tr>
						</c:when>
						<c:when test="${!empty list}">
							<c:forEach var="list" items="${list}">
								<tr>
									<td><c:out value="${list.product_name}" /></td>
									<td><c:out value="${list.product_code}" /></td>
									<td><c:out value="${list.color_name}" /></td>
									<td><c:out value="${list.gender}" /></td>
									<td><c:out value="${list.s}" /></td>
									<td><c:out value="${list.m}" /></td>
									<td><c:out value="${list.l}" /></td>
									<td><c:out value="${list.xl}" /></td>
									<td><c:out value="${list.f}" /></td>
									<td><c:out value="${list.total}" /></td>
									<td><c:out value="${list.manufacture_day}" /></td>
									<td><c:out value="${list.product_price}" /></td>
									<td><c:out value="${list.file}" /></td>
									<td><c:out value="${list.text1}" /></td>
									<td><c:out value="${list.text2}" /></td>
									<td><c:out value="${list.text3}" /></td>
									<td><c:out value="${list.text4}" /></td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>
			<form action="productList.do" method="get">
		<label for="condition">검색조건</label>
		<select name="condition" id="condition">
			<option value="product_name" <c:if test="${condition eq 'product_name' }">selected</c:if>>제품명</option>
			<option value="product_code" <c:if test="${condition eq 'product_code' }">selected</c:if>>제품코드</option>
			<option value="color_name" <c:if test="${condition eq 'color_name' }">selected</c:if>>색상</option>
			<option value="gender" <c:if test="${condition eq 'gender' }">selected</c:if>>성별</option>
		</select>
		<input type="text" name="keyword" id="keyword"
			placeholder="검색어 ..." value="${keyword }"/>
		<button type="submit">검색</button>
		</form>
	</div>
</article>
