<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%
 request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>product</title>
    <link rel="stylesheet" type="text/css" href="resources/css/product_detail.css">
    <script src="resources/Js/detail.js">
    console.log(document.cookie);
    </script>
</head>

<body onload="init();">
<%
	String test = session.getId();
	String table1 = "test_cart";
	String table2 = "test_cart2";
%>
<!-- onload="init();" -->
    <!-- 밑에서 부터 상품정보 -->

    <div id="main">

        <c:forEach var="get" items="${get}">
        <div id="product">
            
                <div class="product_img1">
                    <img src="resources/image/${get.product_code}.jpg" alt="상품" title="사진">
                </div>
            
            <div class="main_box2">
                <div class="product_text">
                    <h3>제품이름:${get.product_name}</h3>
                    사이즈<br><hr>
                    제품설명:${get.text1}<br>
                    가격:${get.product_price}<br>
                    색상<label>을 선택해주세요</label><br>
                    <button>${get.color_name}</button><br>
                    
                    사이즈<label>를 선택해주세요</label><br>
                    <button value="${get.s}" id="bt">s</button>
                    <div id="bt">
                    <button value="${get.m}">m</button>
                    <button value="${get.l}">l</button>
                    <button value="${get.xl}">xl</button>
                    <button value="${get.f}">f</button>
                    </div>
                    <hr>
                    
                <form name="form" method="post">
                	<c:if test="${!empty userInfo.id}">
                	<input type="hidden" name="id" value="${userInfo.id}">
                	</c:if>
                	<c:if test="${empty usdrInfo.id}">
                	<input type="hidden" name="id" value="<%=test%>">
                	</c:if>
                	코드<input type="hidden" name="product_code" value="${get.product_code}">
                	사이즈<input type="text" name="size">
                	색상<input type="text" name="color_name">
                	수량<input type="text" name="count">
                	가격<input type="text" name="price">
                	<c:if test="${empty userInfo.id }">
                	<input type="submit" name="table" formaction="cart.do" value="<%=table1%>">
                	</c:if>
                	<c:if test="${!empty userInfo.id}">
                	<input type="submit" name="table" formaction="cart.do" value="<%=table2%>">
                	</c:if>
                	<c:if test="${empty userInfo.id }">
                	<input type="submit" name="table" formaction="product_pay.do" value="<%=table1%>">
                	</c:if>
                	<c:if test="${!empty userInfo.id}">
                	<input type="submit" name="table" formaction="product_pay.do" value="<%=table2%>">
                	</c:if>
                </form>
                
                <%-- <form action="cookie.do" name="form">
                	구매하실상품
                	<input type="hidden" value="${get.product_code}">
					제품이름:<input type="text" value="${get.product_name}" readonly="readonly"><br>
					색상<input type="text" name="form">
					선택한사이즈<input type="text" name="form"><br>
                    수량 : <input type=hidden name="sell_price" value="${get.product_price}">
					<input type="text" name="amount" value="1" size="3" onchange="change();" readonly="readonly">
					<input type="button" value="+" onclick="add();">
					<input type="button" value="-" onclick="del();"><br>
					금액 : <input type="text" name="sum" size="11" readonly>￦<br>
					<hr>
                    <input type="submit" value="장바구니">
                    <input type="submit" value="기능없음">
                </form> --%>
                
               </div>
            </div>
        </div>
        
        <div id="inform_goods">
                <div class="idontknow">
                    <div class="gg">
                            <a href="#product"><span>제품상세</span></a>
                            <a href="#goods"><span>구매후기</span></a>
                            <a href="#deliver"><span>자주묻는질문</span></a>
                        </div>
                    </div>    

                    
					<!-- 일단 보류 -->
                    <div id="goods">
                        <p>설명1:${get.text2}</p><br>
                        <img src="resources/image/detail/${get.product_code}_1.jpg" alt="예시" />

                        <p>대충제품좋다는내용2:${get.text3}</p><br>
                        <img src="resources/image/detail/${get.product_code}_2.jpg" alt="예시2" />

                        <p>대충제품좋다는내용3:${get.text4}</p><br>
                        <img src="resources/image/detail/${get.product_code}_3.jpg" alt="예시" />
                    </div>
                    
					<!-- 이 부분은 고정해도 되지 않을까? -->
                    <div id="deliver">
                        <h4>QNA예시</h4>
                        <img src="resources/image/delivery_info.gif" alt="배송예시?">
                    </div>
            </div>
		</c:forEach>
        </div>
    </div>
    
</body>
</html>