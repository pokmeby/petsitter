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
<title>qna 답변 수정</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='updateForm']");

		$(".cancel_btn").on("click", function(){
			location.href = "/qna/qnaReadView?qno=${replyUpdate.qno}"
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
		<h1>게시판 댓글 수정</h1>
	</header>
	<hr />

	
	<section id="container">
		<form name="updateForm" role="form" method="post" action="/qna/qnaReplyUpdate">
			<input type="hidden" name="qno" value="${replyUpdate.qno}" readonly="readonly"/>
			<input type="hidden" id="qna_rno" name="qna_rno" value="${replyUpdate.qna_rno}" />
			<input type="hidden" id="page" name="page" value="${scri.page}">
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
			<table>
				<tbody>
					<tr>
						<td>
							<label for="qna_reply_content">댓글 내용</label>
							<input type="text" id="qna_reply_content" name="qna_reply_content" value="${replyUpdate.qna_reply_content}"/>
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
	<hr/>
</div>
</body>
</html>