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
				<table class="table table-hover">
				
				
				<div class="col-xs-10 col-sm-10">
						<div class="input-group">
							<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
							<span class="input-group-btn">
								<button id="searchBtn" type="button" class="btn btn-default">검색</button>
							</span>
						</div>
					</div>
					<thead>
						<tr><th>번호</th><th>제목</th><th>카테고리</th><th>작성자</th><th>등록일</th></tr>
					</thead>
					
					<c:forEach items="${list}" var="list">
						<tr>
							<td><c:out value="${list.qno}"/></td>
							<td>
								<a href="/qna/qnaReadView?qno=${list.qno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
								<c:out value="${list.qna_title}"/></a>
							</td>
							<td><c:out value="${list.qna_category}"/></td>
							<td><c:out value="${list.user_email}"/></td>
							<td><fmt:formatDate value="${list.qna_date}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
				</table>
				 <div class="search row">
					<div class="col-xs-2 col-sm-2">
						<select name="searchType" class="form-control">
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