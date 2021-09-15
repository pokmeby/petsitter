<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>펫 시 터 후 기 </title>
</head>
<script type="text/javascript">

$(document).ready(function() {
	var fromObj = $("form[name='readForm']");

	$(".write_btn").on("click", function() {

			formObj.attr("action", "/review/writeReview");
			formObj.attr("method", "get");
			fromObj.submit();
	})
})
</script>
<body>
	<header> 펫 시 터 후 기 </header>
	  <div>
         <%@include file="nav.jsp" %>
       </div>
	
	<div>
		<a href="/review/writeReview">글 작성</a>
	</div>

	<section>
		<form role="form" method="get">
	<div>
		<div>
			<select name="searchType">
				<option value="x"<c:out value="${scri.searchType == null ? 'selected' : ''}" />>---</option>
				<option value="t"<c:out value="${scri.searchType == 't' ? 'selected' : ''}" />>제목</option>
				<option value="c"<c:out value="${scri.searchType == 'c' ? 'selected' : ''}" />>내용</option>
				<option value="u"<c:out value="${scri.searchType == 'u' ? 'selected' : ''}" />>작성자 아이디</option>
				<option value="tcu"<c:out value="${scri.searchType == 'tcu' ? 'selected' : ''}" />>전체</option>
			</select>
		</div>
		
		<div>
			<div>
				<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>
				<span>
					<button id="searchBtn" type="button">검색</button>
				</span>
			</div>
		</div>
		
		<script>
			$(function() {
				$('#searchBtn').click(function() {
					self.location = "boardReview" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
					});
				});
		</script>
	</div>

			<div>
				<c:forEach items="${list}" var="list">
					<div>
					<div>별점 : <c:out value="${list.r_rate}"/></div>
					<div>제목 : <c:out value="${list.r_title}"/></div>
					<div>작성일 : <fmt:formatDate value="${list.rwrite_date}" pattern="yyyy-MM-dd" /></div>
					<div>이용시간 : <c:out value="${list.ruse_date}"/></div>
					<div>이미지 : <img src="/resources/image/${list.r_image}"></div>
					<!-- <div><c:out value="${list.r_image}"/></div>  -->
					<div>작성자 아이디 : <c:out value="${list.user_email}"/></div>
					<div><a class="read_btn" href="/review/readReview?rno=${list.rno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">상세 보기</a></div>
					</div>
				</c:forEach>
			</div>
		<div>
			<ul>
				<c:if test="${pageMaker.prev}">
							<li><a href="boardReview${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>
						
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
							<a href="boardReview${pageMaker.makeSearch(idx)}">${idx}</a></li>
						</c:forEach>
						
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a href="boardReview${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
				</div>
			</form>
	</section>	
</body>
</html>