<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      <!-- 부가적인 테마 -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
       
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>replyUpdate</title>
</head>

<script type="text/javascript">

$(document).ready(function(){

     var formObj = $("form[name='updateForm']");

     $(".cancel_btn").on("click", function(){

            location.href="/blog/readView?blog_bno=${replyUpdate.blog_no}"
                + "&page=${scri.page}"
                + "&perPageNum=${scri.perPageNum}"
                + "&searchType=${scri.searchType}"
                + "&keyword=${scri.keyword}";
         
         })
   
})

</script>


<body>

<div id="root">
   <header>
      <h1>게시판 답변 수정</h1>
   </header>
   <br>
   
   <div>
      <%@include file="nav.jsp" %>
   </div>
   
   <hr>
   
   <section id="container">
      <form name="updateForm" role="form" method="post" action="/blog/replyUpdate">
         <input type="hidden" name="blog_no" value="${replyUpdate.blog_no }" readonly="readonly"/>
         <input type="hidden" id="reply_no" name="reply_no" value="${replyUpdate.reply_no }"/>
         <input type="hidden" id="page" name="page" value="${scri.page }"/>
         <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }"/>
         <input type="hidden" id="searchType" name="searchType" value="${scri.searchType }"/>
         <input type="hidden" id="keyword" name="keyword" value="${scri.keyword }"/>
         
         
         <table>
           <tbody>
             <tr>
               <td>
                 <label for="content">댓글 내용</label>
                 <input type="text" id="content" name="reply_content" value="${replyUpdate.reply_content }"/>
               </td>
             </tr>
           </tbody>
         </table>
         
         
         <div>
           <button type="submit" class="update_btn">저장</button>
           <button type="button" class="cancel_btn">취소</button>
         </div>
         
   </form>
 </section>
</div>

</body>
</html>