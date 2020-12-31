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
아이디:${pay.id}
사이즈:${pay.size}
색상:${pay.color_name}
수량:${pay.count}
가격:${pay.price}
</c:forEach>
</body>
</html>