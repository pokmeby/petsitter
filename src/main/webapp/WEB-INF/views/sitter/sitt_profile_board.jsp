<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
	$("#searchType").change(function(){
	var val=$(this).val();
		if(val=="pu" || val=="pd"){
			$("#radiobtn").show();
			$("input[name='keyword']").hide();
			}
		else{
			$("#radiobtn").hide();
			}
		});
});
function getValue(){
	var chv = $("input[name='keywordr']:checked").val();
	$("input[name='keyword']").val(chv);
	}


</script>
<meta charset="UTF-8">
<title>Sitter Profile Board</title>
</head>
<body>
<form role="form" method="get">
<c:forEach items="${profileList}" var="sblist" >
<div>
이미지
<a href="/sitter/profileView?sitter_email=${sblist.sitter_email}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
<img src="/upload/sitter_profile/${sblist.sitter_image}">
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
<div>
<select name="searchType" class="searchType" id="searchType">
<option value="n"<c:out value="${scri.searchType==null ? 'selected' : ''}"/> >----</option>
<option value="a"<c:out value="${scri.searchType eq 'a' ? 'selected' : ''}"/>>지역</option>
<option value="n"<c:out value="${scri.searchType eq 'n' ? 'selected' : ''}"/>>이름</option>
<option value="pu"<c:out value="${scri.searchType eq 'pu' ? 'selected' : ''}"/>>금액이상</option>
<option value="pd"<c:out value="${scri.searchType eq 'pd' ? 'selected' : ''}"/>>금액이하</option>
</select>
</div>
<div>
<div class="input-group">
<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}">
<div id="radiobtn" style="display:none" >
<input type="radio" name="keywordr" id="keywordInput" value="10000" onclick="getValue()">1만원
<input type="radio" name="keywordr" id="keywordInput" value="30000" onclick="getValue()">3만원
<input type="radio" name="keywordr" id="keywordInput" value="50000" onclick="getValue()">5만원
<input type="radio" name="keywordr" id="keywordInput" value="100000" onclick="getValue()">10만원
</div>
<span>
<button id="searchBtn" type="button">검색</button></span>
</div>
</div>

<script>
$(function(){
	$('#searchBtn').on("click",function(){
		self.location="profileBoard"+'${pageMaker.makeQuery(1)}'+"&searchType="+$("select option:selected").val()+"&keyword="+encodeURIComponent($('#keywordInput').val());
	});
});
</script>
</div>
<div class="col-md-offset-3">
<ul class="pagination">
<c:if test="${pageMaker.prev}">
<li><a href="profileBoard${pageMaker.makeSearch(pageMaker.startPage-1)}">이전</a></li></c:if>
<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
<li <c:out value="${pageMaker.cri.page==idx ? 'class=info':''}"/>>
<a href="profileBoard${pageMaker.makeSearch(idx)}">${idx}</a></li></c:forEach>
<c:if test="${pageMaker.next && pageMaker.endPage >0}">
<li><a href="profileBoard${pageMaker.makeSearch(pageMaker.endPage+1)}">다음</a></li></c:if>
</ul>
</div>
</form>
</body>
</html>