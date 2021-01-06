<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<article>
	<div class="container">
		<h2>Order list</h2>
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
				</colgroup>
				<thead>
					<tr>
						<th>유저ID</th>
						<th>주소1</th>
						<th>주소2</th>
						<th>주소3</th>
						<th>주소4</th>
						<th>주소5</th>
						<th>제품번호</th>
						<th>주문수량</th>
						<th>배송상태</th>
						<th>주문번호</th>
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
									<td><c:out value="${list.custId}" /></td>
									<td><c:out value="${list.addr}" /></td>
									<td><c:out value="${list.addr2}" /></td>
									<td><c:out value="${list.addr3}" /></td>
									<td><c:out value="${list.addr4}" /></td>
									<td><c:out value="${list.addr5}" /></td>
									<td><c:out value="${list.prodNo}" /></td>
									<td><c:out value="${list.qty}" /></td>
									<td><c:out value="${list.shipStat}" /></td>
									<td><c:out value="${list.orderNo}" /></td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>
			<form action="orderList.do" method="get">
		<label for="condition">검색조건</label>
		<select name="condition" id="condition">
			<option value="custId" <c:if test="${condition eq 'custId' }">selected</c:if>>고객id</option>
			<option value="shipStat" <c:if test="${condition eq 'shipStat' }">selected</c:if>>배송상태</option>
			<option value="orderNo" <c:if test="${condition eq 'orderNo' }">selected</c:if>>주문번</option>
		</select>
		<input type="text" name="keyword" id="keyword"
			placeholder="검색어 ..." value="${keyword }"/>
		<button type="submit">검색</button>
	</form><!-- condition이라는 파라미터 명으로 넘어간다. -->
</div>
</article>
