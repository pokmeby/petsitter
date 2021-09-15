<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
      <!-- 합쳐지고 최소화된 최신 CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      <!-- 부가적인 테마 -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
       
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>게시판 답변 삭제</title>
</head>
<script type="text/javascript">
$(document).ready(function() {
    var formObj = $("form[name='updateForm']");
    $(".cancel_btn").on("click", function(){
	location.href="/blog/readView?blog_bno=${replyDelete.blog_no}"
    + "&page=${scri.page}"
    + "&perPageNum=${scri.perPageNum}"
    + "&searchType=${scri.searchType}"
    + "&keyword=${scri.keyword}";
        })
}) 
        
</script>
<body>
<header>
<h1> 계시판 댓글 삭제</h1>
</header>
<hr>
<div>
<%@ include file="nav.jsp" %>
</div>
<hr>
<section id="container">
	<form name="updateForm" role="form" method="post" action="/blog/replyDelete">
	  <input type="hidden" name="blog_no" value="${replyDelete.blog_no }" readonly="readonly"/>
         <input type="hidden" id="reply_no" name="reply_no" value="${replyDelete.reply_no }"/>
         <input type="hidden" id="page" name="page" value="${scri.page }"/>
         <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }"/>
         <input type="hidden" id="searchType" name="searchType" value="${scri.searchType }"/>
         <input type="hidden" id="keyword" name="keyword" value="${scri.keyword }"/>
         
         <div>
         <p> 삭제 하시겠습니까?</p>
         <button type="submit" class="delete_btn">예 삭제합니다.</button>
         <button type="button" class="cancel_btn">아니요, 삭제 X</button>
         </div>
	</form>
</section>
</body>
</html>