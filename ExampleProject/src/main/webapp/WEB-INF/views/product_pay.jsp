<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="pay" items="${pay}">
���̵�:${pay.id}
������:${pay.size}
����:${pay.color_name}
����:${pay.count}
����:${pay.price}
</c:forEach>
</body>
</html>