<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
      <!-- 합쳐지고 최소화된 최신 CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      <!-- 부가적인 테마 -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
       
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판 글 쓰기</title>
</head>
<script type="text/javascript">
   $(document).ready(function() {
      var formObj = $("form[name='writeForm']");
      $(".write_btn").on("click", function(){
            formObj.attr("action", "/blog/write");
            formObj.attr("method", "post");
            formObj.submit();
         });
      })
   function fn_valiChk() {
      var regForm = $("form[name='writeForm'] .chk").length;
      // 폼이름이 writeForm이고 .chk.length에 의미는 .chk가 몇개있는지 찾는것이다.
      for(var i=0; i <regForm; i++) {
         if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
               alert($(".chk").eq(i).attr("title"));
               return true;
            }
         } 
      }
</script>
<body>
   <div id="root">
      <header>
         <h1>게시판</h1>
      </header>
      <hr size="5" color="red"/>
      
      <div>
         <%@include file="nav.jsp" %>
      </div>
      <hr size="5" color="red"/>
      
      <section id="container">
         <form name="writeForm" method="post" action="/blog/write" enctype="multipart/form-data">
            <table>
               <tbody>
                     <tr>
                        <td>
                           <label for="blog_title">제목</label>
                           <input type="text" id="blog_title" name="blog_title" class="chk" title="제목을 입력하세요."/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <label for="blog_content">내용</label>
                           <textarea id="blog_content" name="blog_content" class="chk" title="내용을 입력하세요."></textarea>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <label for="file">이미지</label>
                          <input type="file" name="image" class="chk" title="이미지를 입력하세요."/>
                     </tr>
                     <tr>
                        <td>
                           <label for="blog_email">작성자</label>
                           <input type="text" id="blog_email" name="blog_email" class="chk" title="작성자를 입력하세요."/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <button class="write_btn" type="submit">작성</button>
                        </td>
                     </tr>
               </tbody>
            </table>
         </form>
       </section>
       <hr />
   </div>
</body>
</html>