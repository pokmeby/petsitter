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
<title>게시판</title>
</head>
<script type="text/javascript">
   $(document).ready(function() {
      var formObj = $("form[name='readForm']");

      // 수정
      $(".update_btn").on("click", function() {
         formObj.attr("action", "/blog/updateView");
         formObj.attr("method", "get");
         formObj.submit();
         });

      // 삭제
      $(".delete_btn").on("click", function() {
			
         var deleteYN = confirm("삭제하시겠습니까?");
         if(deleteYN == true) {

            formObj.attr("action", "/blog/delete");
            formObj.attr("method", "post");
            formObj.submit();
            }
         });

      // 목록
      $(".list_btn").on("click", function() {

         location.href = "/blog/list?page=${scri.page}"
                     +"&perPageNum=${scri.perPageNum}"
                     +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
         });


      // 댓글 작성
      $(".replyWriteBtn").on("click", function() {

         var formObj = $("form[name='replyForm']");
         formObj.attr("action", "/blog/replyWrite");
         formObj.submit();
         });

      // 댓글 수정 View
      $(".replyUpdateBtn").on("click", function() {
         location.href = "/blog/replyUpdateView?blog_bno=${read.blog_bno}"
                    + "&page=${scri.page}"
                    + "&perPageNum=${scri.perPageNum}"
                    + "&searchType=${scri.searchType}"
                    + "&keyword=${scri.keyword}"
                    + "&reply_no="+$(this).attr("data-rno");
         });

      // 댓글 삭제 View
      $(".replyDeleteBtn").on("click", function() {
         location.href = "/blog/replyDeleteView?blog_bno=${read.blog_bno}"
                    + "&page=${scri.page}"
                    + "&perPageNum=${scri.perPageNum}"
                    + "&searchType=${scri.searchType}"
                    + "&keyword=${scri.keyword}"
                    + "&reply_no="+$(this).attr("data-rno");
         });   

      //좋아요 버튼
      $(".likebtn").on("click", function(){
    	  var formObj = $("form[name='likeForm']");
          formObj.attr("action", "/blog/like");
          formObj.submit();
          });
      })
</script>

<body>
   <div class="container">
      <header>
         <h1> 게시판</h1>
      </header>
      <hr>
      
      <div>
         <%@include file="nav.jsp" %>
      </div>
            
      <section id="container">
         <form name="readForm" role="form" method="post">
         <input type="hidden" id="blog_bno" name="blog_bno" value="${read.blog_bno}" />
         <input type="hidden" id="page" name="page" value="${scri.page}" >
         <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" >
         <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" >
         <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" >
         </form>
         
      <div class="form-group">
         <label for="title" class="col-sm-2 control-label">제목</label>
         <input type="text" id="title" name="title" class="form-control" value="${read.blog_title}" readonly="readonly" />
      </div>
      
                
      <div class="form-group">
         <label for="content" class="col-sm-2 control-label">이미지</label>
       	<img src="/resources/images/${read.blog_image }"/>
      </div>
         
      
      <div class="form-group">
         <label for="content" class="col-sm-2 control-label">내용</label>
         <form method="post" name="likeForm">
         <input type="hidden" id="likeBlog_bno" name="likeBlog_bno" value="${read.blog_bno}" />
         <c:choose>
         <c:when test="${likeResult eq '0' or empty likeResult}">
         <img src="/resources/images/like.png" class="likebtn" style="cursor:pointer; width: 20px;">
         </c:when>
         <c:otherwise>
         <img src="/resources/images/unlike.png" class="likebtn" style="cursor: pointer; width:20px;">
         </c:otherwise>
         </c:choose> 
          <c:out value="${likeTotal}"></c:out>
         </form>
         <textarea id="content" name="content" class="form-control" readonly="readonly"><c:out value="${read.blog_content}" /></textarea>
      </div>
         

      <div class="form-group">
         <label for="writer" class="col-sm-2 control-label">작성자</label>
         <input type="text" id="writer" name="writer" class="form-control" value="${read.blog_email}" readonly="readonly" />
      </div>
      
      <div class="form-group">
         <label for="regdate" class="col-sm-2 control-label">작성날짜</label>
         <fmt:formatDate value="${read.blog_date}" pattern="yyyy-MM-dd" />
      </div>
    
	<c:if test="${read.blog_email eq sessionScope.member}">
      <div>
         <button type="button" class="update_btn btn btn-warning">수정</button>
         <button type="button" class="delete_btn btn btn-danger">삭제</button>
         <button type="button" class="list_btn btn btn-primary">목록</button>
      </div>
	</c:if>
      <!-- 댓글 -->
      <div id="reply">
         <ol class="replyList">
            <c:forEach items="${replyList}" var="replyList">
               <li>
                  <p>
                  작성자 : ${replyList.reply_writer}<br />
                  작성 날짜 : <fmt:formatDate value="${replyList.reply_date}" pattern="yyyy-MM-dd" />
                  </p>
                  
                  <p>${replyList.reply_content}</p>
                  <c:if test="${replyList.reply_writer eq sessionScope.member}">
                  <div>
                     <button type="button" class="replyUpdateBtn btn btn-warning" data-rno="${replyList.reply_no}">수정</button>
                     <button type="button" class="replyDeleteBtn btn btn-danger" data-rno="${replyList.reply_no}">삭제</button>
                  </div>
                  </c:if>
               </li>
            </c:forEach>
         </ol>
      </div>
      
      <form name="replyForm" class="form-horizontal" method="post">
         <input type="hidden" id="blog_no" name="blog_no" value="${read.blog_bno}" />
         <input type="hidden" id="page" name="page" value="${scri.page}" >
         <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" >
         <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" >
         <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" >
         
         <div class="form-group">
            <label for="writer" class="col-sm-2 control-label">댓글 작성자</label>
            <div class="col-sm-10">
               <input type="text" id="reply_writer" name="reply_writer" class="form-control" value="${sessionScope.member}" readonly="readonly"/>
            </div>
         </div>   
         
         <div class="form-group">
            <label for="content" class="col-sm-2 control-label">댓글 내용</label>
            <div class="col-sm-10">
               <input type="text" id="reply_content" name="reply_content" class="form-control"/>
            </div>
         </div>
         
         <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
               <button type="button" class="replyWriteBtn btn btn-success">작성</button>
            </div>
         </div>
      </form>
      </section>
      <hr />
   </div>
</body>
</html>