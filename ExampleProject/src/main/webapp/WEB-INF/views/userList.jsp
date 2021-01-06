<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<article>
	<div class="container">
		<h2>User list</h2>
		<div class="table-responsive">
			<table class="table table-striped table-sm">
				<colgroup>
					<col style="width: auto;" />
					<col style="width: 15%;" />
					<col style="width: 25%;" />
					<col style="width: 25%;" />
					<col style="width: 15%;" />
					<col style="width: 15%;" />
				</colgroup>
				<thead>
					<tr>
						<th>유저ID</th>
						<th>유저PWD</th>
						<th>유저이름</th>
						<th>EMAIL</th>
						<th>유저등급</th>
						<th>가입일</th>
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
									<td><c:out value="${list.id}" /></td>
									<td><c:out value="${list.pwd}" /></td>
									<td><c:out value="${list.name}" /></td>
									<td><c:out value="${list.email}" /></td>
									<td><c:out value="${list.custRank}" /></td>
									<td><c:out value="${list.joinDate}" /></td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
		</div>
			<form action="userList.do" method="get">
		<label for="condition">검색조건</label>
		<select name="condition" id="condition">
			<option value="id" <c:if test="${condition eq 'id' }">selected</c:if>>유저id</option>
			<option value="name" <c:if test="${condition eq 'name' }">selected</c:if>>유저명</option>
			<option value="custRank" <c:if test="${condition eq 'custRank' }">selected</c:if>>유저등급</option>
		</select>
		<input type="text" name="keyword" id="keyword"
			placeholder="검색어 ..." value="${keyword }"/>
		<button type="submit">검색</button>
		</form>
		</div>
</article>

