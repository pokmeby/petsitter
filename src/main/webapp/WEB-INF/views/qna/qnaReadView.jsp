<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Q&A</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='readForm']");

		//수정
	      $(".update_btn").on("click", function() {
	          formObj.attr("action", "/qna/qnaUpdateView");
	          formObj.attr("method", "get");
	          formObj.submit();
	          })

		//삭제
		$(".delete_btn").on("click", function(){
			var deleteYN = confirm("삭제하시겠습니까?");
			if(deleteYN == true) {
				formObj.attr("action", "/qna/qnaDelete");
				formObj.attr("method","post");
				formObj.submit();
				}
			})

		//목록
		$(".list_btn").on("click", function(){
			location.href="/qna/qnaList?page=${scri.page}"
						 +"&perPageNum=${scri.perPageNum}"
						 +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})

		//댓글작성
		$(".replyWriteBtn").on("click",function(){
			var formObj = $("form[name='replyForm']");
			formObj.attr("action", "/qna/replyQnaWrite");
			formObj.submit();
			});
		//댓글 수정 view
		$(".replyUpdateBtn").on("click", function(){
			location.href="/qna/replyQnaUpdateView?qno=${read.qno}" 
						 + "&page=${scri.page}"
						 + "&perPageNum=${scri.perPageNum}"
						 + "&searchType=${srci.searchType}"
						 + "&keyword=${srci.keyword}"
						 + "&qna_rno="+$(this).attr("data-qna_rno");
			});

		//댓글 삭제 view
		$(".replyDeleteBtn").on("click",function(){
			location.href="/qna/replyQnaDeleteView?qno=${read.qno}" 
				 + "&page=${scri.page}"
				 + "&perPageNum=${scri.perPageNum}"
				 + "&searchType=${srci.searchType}"
				 + "&keyword=${srci.keyword}"
				 + "&qna_rno="+$(this).attr("data-qna_rno");
			});
		})
</script>
<body>

<div class="container">
	<header>
		<h1>게시판</h1>
	</header>
	<hr>
	

	<section id="container">
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="qno" name="qno" value="${read.qno}"/>
			<input type="hidden" id="page" name="page" value="${scri.page}">
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
		</form>
		
		<div class="form-group">
			<label for="qna_title" class="col-sm-2 control-label">제목</label>
			<input type="text" id="qna_title" name="qna_title" class="form-control" value="${read.qna_title}" readonly="readonly"/>
		</div>
		<div class="form-group">
			<label for="qna_category" class="col-sm-2 control-label">내용</label>
			<textarea id="qna_category" name="qna_category" class="form-control" readonly="readonly"><c:out value="${read.qna_content}"/></textarea>
		</div>
		<div class="form-group">
			<label for="qna_content" class="col-sm-2 control-label">내용</label>
			<textarea id="qna_content" name="qna_content" class="form-control" readonly="readonly"><c:out value="${read.qna_content}"/></textarea>
		</div>
		<div class="form-group">
			<label for="user_email" class="col-sm-2 control-label">작성자</label>
			<input type="text" id="user_email" name="user_email" class="form-control" value="${read.user_email}" readonly="readonly" />
		</div>
		<div class="form-group">
			<label for="qna_date" class="col-sm-2 control-label">작성날짜</label>
			<fmt:formatDate value="${read.qna_date}" pattern="yyyy-MM-dd"/>
		</div>
		
		<div>
			<button type="button" class="update_btn">수정</button>
			<button type="button" class="delete_btn">삭제</button>
			<button type="button" class="list_btn">목록</button>
		</div>
		
		<!-- 댓글 -->
		<div id="reply">
			<ol class="replyList">
				<c:forEach items="${replyList}" var="replyList">
					<li>
						<p>
						작성자 : ${replyList.sitter_email}<br />
						작성 날짜 : <fmt:formatDate value="${replyList.qna_reply_date}" pattern="yyyy-MM-dd"/>
						</p>
						
						<p>${replyList.qna_reply_content}</p>
						<div>
							<button type="button" class="replyUpdateBtn btn btn-warning" data-qna_rno="${replyList.qna_rno}">수정</button>
							<button type="button" class="replyDeleteBtn btn btn-danger" data-qna_rno="${replyList.qna_rno}">삭제</button>
						</div>
					</li>
				</c:forEach>
			</ol>
		</div>
		
		<form name="replyForm" method="post" class="form-horizontal">
			<input type="hidden" id="qno" name="qno" value="${read.qno}"/>
			<input type="hidden" id="page" name="page" value="${scri.page}">
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
			
			<div class="form-group">
				<label for="sitter_email" class="col-sm-2 control-label">댓글 작성자</label>
				<div class="col-sm-10">
					<input type="text" id="sitter_email" name="sitter_email" class="form-control"/>
				</div>
			</div>
			
			<div class="form-group">
				<label for="qna_reply_content" class="col-sm-2 control-label">댓글 내용</label>
				<div class="col-sm-10">
					<input type="text" id="qna_reply_content" name="qna_reply_content" class="form-control" />
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