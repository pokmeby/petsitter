<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Sitter Profile Board</title>
</head>
<body>
<form role="form" method="get">
<c:forEach items="${profileList}" var="sblist" >
<div>
이미지
<a href="/sitter/profileView?sitter_email=${sblist.sitter_email}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
<img src="c:/temp_1/upload/sitter_profile/${sblist.sitter_image}">
</a>
</div>
<div>
이름
<c:out value="${sblist.sitter_name}"/>
</div>
<div>
가능날짜
<c:out value="${sblist.sitter_avail}"/>
</div>
<div>
요금
<c:out value="${sblist.sitter_price}"/>
</div>
<div>
성별
<c:out value="${sblist.sitter_gender}"/>
</div>
<div>
지역
<c:out value="${sblist.sitter_addr}"/>
</div>
<p>
</c:forEach>

<div class="search row">
<div class="col-xs-2 col-sm-2">
<select name="searchType" class="form-control">
<option value="n"<c:out value="${scri.searchType==null ? 'selected' : ''}"/>>----</option>
<option value="a"<c:out value="${scri.searchType eq 'a' ? 'selected' : ''}"/>>지역</option>
<option value="n"<c:out value="${scri.searchType eq 'n' ? 'selected' : ''}"/>>이름</option>
<%-- <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option> --%>
</select>
</div>
<div class="col-xs-10 col-sm-10">
<div class="input-group">
<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
<span class="input-group-btn">
<button id="searchBtn" type="button">검색</button></span>
</div>
</div>


<script>
$(function(){
	$('#searchBtn').click(function(){
		self.location="profileList"+'${pageMaker.makeQuery(1)}'+"&searchType="+$("select option:selected").val()+"&keyword="+encodeURIComponent($('#keywordInput').val());
	});
});
</script>
</div>
<div class="col-md-offset-3">
<ul class="pagination">
<c:if test="${pageMaker.prev}">
<li><a href="list${pageMaker.makeSearch(pageMaker.startPage-1)}">이전</a></li></c:if>
<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
<li <c:out value="${pageMaker.cri.page==idx ? 'class=info':''}"/>>
<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li></c:forEach>
<c:if test="${pageMaker.next && pageMaker.endPage >0}">
<li><a href="list${pageMaker.makeSearch(pageMaker.endPage+1)}">다음</a></li></c:if>
</ul>
</div>
</form>
</body>
</html>