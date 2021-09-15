<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='readForm']");

		// 수정
		$(".update_btn").on("click", function() {
			formObj.attr("action", "/review/updateView");
			formObj.attr("method", "get");
			formObj.submit();
			});

		// 삭제
		$(".delete_btn").on("click", function() {

			var deleteYN = confirm("삭제하시겠습니까?");
			if(deleteYN == true) {

				formObj.attr("action", "/review/delete");
				formObj.attr("method", "post");
				formObj.submit();
				}
			});

		// 목록
		$(".list_btn").on("click", function() {

			location.href = "/review/boardReview?page=${scri.page}"
						   +"&perPageNum=${scri.perPageNum}"
						   +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			});



		
		$(".replyWriteBtn").on("click", function() {

			var formObj = $("form[name='replyForm']");
			formObj.attr("action", "/review/replyWrite");
			formObj.submit();
			});

		$(".replyUpdateBtn").on("click", function() {

			location.href = "/review/replyUpdateView?rno=${read.rno}"
						  + "&page=${scri.page}"
						  + "&perPageNum=${scri.perPageNum}"
						  + "&keyword=${scri.keyword}"
						  + "&re_num="+$(this).attr("data-re_num");	
			});
		$(".replyDeleteBtn").on("click", function() {

			location.href = "/review/replyDeleteView?rno=${read.rno}"
					      + "&page=${scri.page}"
					      + "&perPageNum=${scri.perPageNum}"
					      + "&keyword=${scri.keyword}"
					      + "&re_num="+$(this).attr("data-re_num");
			});
		})
	
</script>
<body>
	<div>
	<header><h1> r e a d </h1></header><hr>
	
	<section>
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="rno" name="rno" value="${read.rno}" />
			<input type="hidden" id="page" name="page" value="${scri.page}" >
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" >
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" >
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" >
		</form>
		
	<div>
		<label for="r_title">제목</label>
		<input type="text" id="r_title" name="r_title" value="${read.r_title}" readonly="readonly" />
	</div>

	<div>
		<label for="r_rate">별점</label>
		<input type="text" id="r_rate" name="r_rate" value="${read.r_rate}" readonly="readonly"/>
	</div>
	
	<div>
		<label for="rwrite_date">글 작성 시간</label>
		<fmt:formatDate value="${read.rwrite_date}" pattern="yyyy-MM-dd"/>
	</div>

	<div>
		<label for="ruse_date">이용 시간</label>
		<input type="text" id="ruse_date" name="ruse_date" value="${read.ruse_date}" readonly="readonly"/>
	</div>
	
	<div>
		<label for="r_content">내용</label>
		<textarea id="r_content" name="r_content" readonly="readonly"><c:out value="${read.r_content}"/></textarea> 
	</div>
	
	<div>
		<label for="user_email">글쓴 사람</label>
		<input type="text" id="user_email" name="user_email" value="${read.user_email}" readonly="readonly"/>
	</div>
	
	<div>
		<label for="sitter_email">추천 시터 이름</label>
		<input type="text" id="sitter_email" name="sitter_email" value="${read.sitter_email}" readonly="readonly"/>
	</div>
	
		<div>
		<label for="r_image">사진</label>
		<img src="/resources/image/${read.r_image}"/>
	</div>
		
		<hr size="5" color="red">
		<div>
		<button type="button" class="update_btn">글 수정</button>
		<button type="button" class="delete_btn">글 삭제</button>
		</div>
		<hr size="5" color="blue">
		
	<div id="reply">
		<ol class="replyList">
			<c:forEach items="${replyList}" var="replyList">
				<li>
				<p> 작성자 : ${replyList.user_email}<br>
				작성 날짜 : <fmt:formatDate value="${replyList.re_write_date}" pattern="yyyy-MM-dd"/>
				</p>
				
				<p>${replyList.re_content}</p>
			<div>
				<button type="button" class="replyUpdateBtn" data-re_num="${replyList.re_num}">수정</button>
				<button type="button" class="replyDeleteBtn" data-re_num="${replyList.re_num}">삭제</button>
			</div>
				</li>
			</c:forEach>
		</ol>
	</div>
	
		<form name="replyForm" method="post">
			<input type="hidden" id="rno" name="rno" value="${read.rno}"/>
			<input type="hidden" id="page" name="page" value="${scri.page}">
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
			
			<div>
				<label for="user_email">아이디</label>
				<input type="text" id="user_email" name="user_email" value="${read.user_email}" /><!-- session 아디 -->
			</div>
			
			<div>
				<label for="re_content">내용</label>
				<input type="text" id="re_content" name="re_content"/>
			</div>
			
			<div>
				<button type="button" class="replyWriteBtn">작성</button>
			</div>
		</form>
	</section>
	</div>
</body>
</html>