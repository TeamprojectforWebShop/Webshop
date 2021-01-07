<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>main</title>
<link rel="stylesheet" type="text/css" href="resources/css/join.css">

</head>

<body>

   <div id="mypage">
      <div id="main_con">
         <div class="join_form">
            <form action="joinCheck.do" method="post" role="form">
               <table>
            <tr height="40">
                <td align="center"><b>[회원가입]</b></td>
            </tr>
        </table>    



               <label for="id">아이디</label><br>
                  <input type="text" class="form-control" id="id" name="id" placeholder="ID" required>
                  <input type="button" value="중복확인" id="idck"/><br>            
                  <div class="eheck_font" id="id_check"></div>
                  
               <div class="form-group">
                  <label for="pwd">비밀번호</label> <br>
                     <input type="password" class="form-control" id="pwd" name="pwd" placeholder="PASSWORD"  required>
                  <div class="eheck_font" id="pw_check"></div>
               </div>
               <div class="form-group">
                  <label for="name">이름</label> <br> <input type="text" class="form-control" id="name" name="name" placeholder="Name"  required>
                  <div class="eheck_font" id="name_check"></div>
               </div>
               <div class="form-group">
                  <label for="birth">생년월일</label> <br>
                  <input type="date" class="form-control" id="birth" name="birth" placeholder="ex) 19990101"  required>
                  <div class="eheck_font" id="birth_check"></div>
               </div>
               <div class="form-group">
                  <label for="mem_email">이메일 주소</label> <br>
                     <input type="email" class="form-control" id="email" name="email" placeholder="E-mail" required>
                  <div class="eheck_font" id="email_check"></div>
               </div>
               <label for="address">주소입력</label> <br>
                  <input type="text" id="postcode" name="addr4" placeholder="우편번호"  required>
                  <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"  ><br>
                  <input type="text" name="addr" id="addr" placeholder="도로명주소"  required><br>
                  <input type="text" name="addr3" id="addr3" placeholder="지번주소"  required><br>
                  <span id="guide" style="color: #999; display: none"></span>
                  <input type="text" name="addr2" id="addr2" placeholder="상세주소"  required><br> 
                  <input type="text" id="extraAddress" name="addr5" placeholder="참고주소" required>
               <div class="form-group">
                  <label for="contact">휴대폰번호</label> <br>
                     <input type="tel" class="form-control" id="contact" name="contact" placeholder="Phone Number"  required>
                  <div class="eheck_font" id="phone_check"></div>
               </div>
               <div class="form-group">
                  <label for="mem_gender" >성별 </label>
                     <input type="radio" id="sexy" name="sex" value="남" >남
                     <input type="radio" id="sexx" name="sex" value="여" >여
               </div>
                 <hr>
               <br> <input class="submit" type="submit" value="가입하기">
            </form>
         </div>

      </div>
   </div>





   <div id="helper">
      <a href="#" class="up"><p>↑</p></a> <a href=""><p>■</p></a> <a
         href="#down_test" class="down"><p>↓</p></a>
   </div>

   <script src="https://code.jquery.com/jquery-3.5.1.js"
      integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
      crossorigin="anonymous"></script>

   <script>
   //아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
      let idck = 0;
      //idck 버튼을 클릭했을 때 
      $("#idck").click(function() {
         //userid 를 param.
         let id = $("#id").val();

         console.log(id);

         $.ajax({
            type : 'POST',
            async : true,
            data : id,
            url : "idcheck.do",
            dataType : "json",
            contentType : "application/json; charset=UTF-8",
            success : function(data) {
               if (data.cnt > 0) {

                  alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                  //아이디가 존재할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                  $("#divInputId").addClass("has-error")
                  $("#divInputId").removeClass("has-success")
                  $("#id").focus();

               } else {
                  alert("사용가능한 아이디입니다.");
                  //아이디가 존재할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                  $("#divInputId").addClass("has-success")
                  $("#divInputId").removeClass("has-error")
                  $("#pwd").focus();
                  //아이디가 중복하지 않으면  idck = 1 
                  idck = 1;

               }
            },
            error : function(error) {

               alert("error : 상식적으로 id를 입력하고 중복체크를 해야지 돌빡 혜지같은놈", error);
            }
         });
      });
   </script>

   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
               <script>
                  //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
                  function execDaumPostcode() {
                     new daum.Postcode(
                           {
                              oncomplete : function(data) {
                                 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                 // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                                 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                 var roadAddr = data.roadAddress; // 도로명 주소 변수
                                 var extraRoadAddr = ''; // 참고 항목 변수

                                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                 if (data.bname !== ''
                                       && /[동|로|가]$/g
                                             .test(data.bname)) {
                                    extraRoadAddr += data.bname;
                                 }
                                 // 건물명이 있고, 공동주택일 경우 추가한다.
                                 if (data.buildingName !== ''
                                       && data.apartment === 'Y') {
                                    extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                          + data.buildingName
                                          : data.buildingName);
                                 }
                                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                 if (extraRoadAddr !== '') {
                                    extraRoadAddr = ' ('
                                          + extraRoadAddr + ')';
                                 }
                                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                 document.getElementById('postcode').value = data.zonecode;
                                 document.getElementById("addr").value = roadAddr;
                                 document
                                       .getElementById("addr3").value = data.jibunAddress;

                                 // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                                 if (roadAddr !== '') {
                                    document
                                          .getElementById("extraAddress").value = extraRoadAddr;
                                 } else {
                                    document
                                          .getElementById("extraAddress").value = '';
                                 }

                                 var guideTextBox = document
                                       .getElementById("guide");
                                 // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                                 if (data.autoRoadAddress) {
                                    var expRoadAddr = data.autoRoadAddress
                                          + extraRoadAddr;
                                    guideTextBox.innerHTML = '(예상 도로명 주소 : '
                                          + expRoadAddr + ')';
                                    guideTextBox.style.display = 'block';

                                 } else if (data.autoJibunAddress) {
                                    var expJibunAddr = data.autoJibunAddress;
                                    guideTextBox.innerHTML = '(예상 지번 주소 : '
                                          + expJibunAddr + ')';
                                    guideTextBox.style.display = 'block';
                                 } else {
                                    guideTextBox.innerHTML = '';
                                    guideTextBox.style.display = 'none';
                                 }
                              }
                           }).open();
                  }
               </script>

</body>


</html>