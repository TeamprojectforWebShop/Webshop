<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판</title>
</head>
<body>

   <div id="root">
      <header>
         <h1>게시판</h1>
      </header>
      <hr />

      <nav>홈 - 글 작성</nav>
      <hr />

      <section id="container">
         <form role="form" method="get" name="boardForm" action="boardwrite.do">
            <table>
               <tbody>
                  <tr>
                     <td>
                        <label for="title">제목</label>
                        <select name="title" id ="title" >
                           <option disabled="disabled">제목을 선택하세요</option>
                           <option value="상품관련 문의">상품 관련문의</option>
                           <option value="사이즈 문의">사이즈 문의</option>
                           <option value="재입고 문의">재입고 문의</option>
                        </select>
                     </td>
                  </tr>
                  <tr> 
                     <td>
                        <label for="content">내용</label>
                        <textarea id="content" name="content" required
                        placeholder="내용을 입력해수제요" rows="15" cols="50"></textarea>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <label for="writer">작성자</label>
                        <input type="text" id="writer" name="writer" value="${sessionScope.userInfo.name}"readonly>
                     </td>
                   
                  <tr>
                     <td>
                        <input type="button" id="submitBtn" value="작성">
                     </td>
                     
                        
                     
                  </tr>
               </tbody>
            </table>
         </form>
      </section>
      <hr />
   </div>
   <script src="https://code.jquery.com/jquery-3.5.1.js"
      integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
      crossorigin="anonymous"></script>
   <script>
      $('#submitBtn').click(function () {
         let con = confirm('등록하시겠습니까?');
         if (!con) return;
         
         let form = $('form[name=boardForm]').serialize();
         
         $.ajax({
            type : 'post',
            async : true,   //(아마) 기본값이 true라 안해줘도 될듯?ㅎㅎ나중에 찾아보시고...
            data : form,
            url : "boardWriteAjax.do",
            dataType : "json",
            contentype :"application/json; charset=UTF-8",
            success :function(xml){
               if (xml.code === 200 ){
                  alert("게시글이 정상적으로 등록됐슈");
                  location.href='${pageContext.request.contextPath}/' 
               } else {
                  console.log(xml.code, " :: error code")
                  alert("으이구 혜지같은넘 그걸 실패하냐");
               }
            }, error: function(request, status, error) {
                     console.log("code:" + status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                     alert('제목과 내용을 작성해주세요');
              }
         });
      });
   </script>
</body>
</html>