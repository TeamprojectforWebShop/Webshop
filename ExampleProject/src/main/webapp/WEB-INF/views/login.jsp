<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
    <link rel="stylesheet" type="text/css" href="resources/css/login.css">
</head>
<body>
    <div id="con">
        <div class="login_form">
            <h2>로그인</h2>
            <form class="form" action="loginCheck.do" method="post">
                <input name="id" type="text" placeholder="id"><br>
                <input name="pwd" type="password" placeholder="pwd"><br>

                <div class="login_one">
                    <input type="checkbox">로그인 저장<br>
                    <input type="submit" value="접속">
                </div>

                <a href="join.do">아직도 회원이 아니신가요?</a>

                <div class="login_two">
                    <div class="kakao">
                        <a href="#"><img src="resources/image/login_kakao.jpg" alt="">카카오로 로그인</a>
                    </div>
                    or
                    <div class="google">
                        <a href="#"><img src="resources/image/login_google.jpg" alt="">구글로 로그인</a>
                    </div>
                </div>
   			<c:if test="${msg == false}">
            <p style="color:#f00;">로그인에 실패했습니다.<br> 아이디 또는 비밀번호를 다시 입력해주십시오.</p>
            </c:if>
            </form>
         
        </div>

    </div>


    <div id="helper">
        <a href="#" class="up"><p>↑</p></a>
        <a href=""><p>■</p></a>
        <a href="#down_test" class="down"><p>↓</p></a>
    </div>  

</body>


</html>