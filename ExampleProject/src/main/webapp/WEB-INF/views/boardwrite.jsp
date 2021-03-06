<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-theme.min.css">

<title>게시판</title>
</head>
<body>

   <div id="container" class="container">
      <header>
         <h1>게시판</h1>
      </header>
      <hr />

         <section id="container">
         <form role="form" method="get" name="boardForm" action="boardwrite.do">
                       
					<div class="form-group">	                  
                        <label class="col-sm-2 control-label" for="title">제목</label><br>
                        <!-- <input type="text" id="title" name="title" required> -->
                        <select  class= "form-control4"  name="title" id ="title" >
	                        <option>제목을 선택하세요</option>
	                        <option value="상품관련 문의">상품 관련문의</option>
	                        <option value="사이즈 문의">사이즈 문의</option>
	                        <option value="재입고 문의">재입고 문의</option>
                        </select>
                     </div>
                     
                     <div class="form-group">
                        <label class="col-sm-2 control-label" for="content">내용</label>
                        <textarea  class= "form-control" id="content" name="content" ></textarea>
                    </div>
                  
                 <div class="form-group">                   
                        <label class="col-sm-2 control-label" for="writer">작성자</label>
                        <input class= "form-control3" type="text" id="writer" name="writer" value="${sessionScope.userInfo.name}"readonly>
                    
                 </div>
                     <div class="form-group">
                        <input class="boardwrite_btn btn-primary"  type="button" id="submitBtn" value="작성하기">
                        <button class="boardlist_btn btn-primary"  onclick=" location.href = 'boardlist.do' ; " name="boardlist_btn">목록</button>
             			</div>
         </form>
      </section>
      <hr />
   </div>
   <script src="https://code.jquery.com/jquery-3.5.1.js"
      integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
      crossorigin="anonymous"></script>
   <script>
   jQuery.fn.serializeObject = function() {
       let obj = null;
       try {
          if (this[0].tagName) {
             let arr = this.serializeArray();
             if (arr) {
                obj = {};
                jQuery.each(arr, function() {
                   obj[this.name] = this.value;
                });
             }
          }
       } catch (e) {
          alert(e.message);
       } finally {
       }
       return obj;
    };   
    
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