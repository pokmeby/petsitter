<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<section id="container">
			<form role="form" method="get">
			
				
				
				<div>
					
							<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
							<span>
								<button id="searchBtn" type="button"><img src="../resources/img/common/loupe.png"></button>
							</span>
						</div>
					
								
					<c:forEach items="${list}" var="list">
					<div>
					<p>
							<%-- <td><c:out value="${list.qno}"/></td> --%>
							Q. <a href="/qna/qnaReadView?qno=${list.qno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
								<c:out value="${list.qna_title}" />
							</a> <c:out value="${list.user_email}" />  
							<fmt:formatDate value="${list.qna_date}" pattern="yyyy-MM-dd" /> <p>
							<c:out value="${list.qna_content}"/>
							<%-- <td><c:out value="${list.qna_category}"/></td> --%>
							
						
							
						</div>
						
					</c:forEach>
		
				
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
		
		
		
		
		
		
		
				 <div>
					<div>
						<select name="searchType">
							<option value="n" <c:out value="${srci.searchType == null ? 'selected' : '' }"/>>-----</option>
							<option value="t" <c:out value="${srci.searchType eq 't' ? 'selected' : '' }"/>>제목</option>
							<option value="ca" <c:out value="${srci.searchType eq 'ca' ? 'selected' : '' }"/>>카테고리</option>
							<option value="co" <c:out value="${srci.searchType eq 'co' ? 'selected' : '' }"/>>내용</option>
							<option value="w" <c:out value="${srci.searchType eq 'w' ? 'selected' : '' }"/>>작성자</option>
							<option value="tc" <c:out value="${srci.searchType eq 'tc' ? 'selected' : '' }"/>>제목+내용</option>
						</select>
					</div>
					
					
					
					<script>
	$(function(){
		$('#searchBtn').click(function() {
			self.location = "qnaList" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
			});
		});
					</script>
				</div>
				<div class="col-md-offset-3">
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li><a href="qnaList${pageMaker.makeSearch(pageMaker.startPage -1)}">이전</a></li>
						</c:if>
						
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
							<a href="qnaList${pageMaker.makeSearch(idx)}">${idx}</a></li>
						</c:forEach>
						
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a href="qnaList${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
				</div>
			</form>
		</section>
	</div>
</body>
</html>