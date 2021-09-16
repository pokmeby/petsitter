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
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	var formObj = $("form[name='updateForm']");

	$(".cancel_btn").on("click", function(){
		location.href = "/qna/qnaReadView?qno=${replyDelete.qno}"
			  + "&page=${scri.page}"
			  + "&perPageNum=${scri.perPageNum}"
			  + "&searchType=${srci.searchType}"
			  + "&keyword=${srci.keyword}";
		})	
})
</script>
<body>
<div id="root">
	<header>
		<h1>qna 답변 삭제</h1>
	</header>
	<hr>

	
	<section id="container">
		<form name="updateForm" role="form" method="post" action="/qna/qnaReplyDelete">
			<input type="hidden" name="qno" value="${replyDelete.qno}" readonly="readonly"/>
			<input type="hidden" id="qna_rno" name="qna_rno" value="${replyDelete.qna_rno}" />
			<input type="hidden" id="page" name="page" value="${scri.page}">
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
			
			<div>
				<p>삭제 하시겠습니까?</p>
				<button type="submit" class="delete_btn">예 삭제합니다.</button>
				<button type="button" class="cancel_btn">아니오. 삭제하지 않습니다.</button>
			</div>
		</form>
	</section>
	<hr>
</div>
</body>
</html>