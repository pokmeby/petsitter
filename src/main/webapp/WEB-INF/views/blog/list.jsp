<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
   <!-- 합쳐지고 최소화된 최신 CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      <!-- 부가적인 테마 -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
       
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       
       <script>

		
	$(document).ready(function(){
		if ("geolocation" in navigator) {	/* geolocation 사용 가능 */
			navigator.geolocation.getCurrentPosition(function(data) {
			
				latitude = data.coords.latitude;
				longitude = data.coords.longitude;
				
				$('#latitude').text(latitude);
				$('#longitude').text(longitude);
			}, function(error) {
				alert(error);
			}, {
				enableHighAccuracy: true,
				timeout: Infinity,
				maximumAge: 0
			});
		} else {	/* geolocation 사용 불가능 */
			alert('geolocation 사용 불가능');
		}
	});
		
</script>

<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
        여기를 클릭.
        </a>
    </em>
</p>
<div id="map" style="width:100%;height:350px;"></div>
<div class="container">
<header>
<h1> 게시판 </h1>
</header>
<hr>
<div>
<%@ include file="nav.jsp" %>
</div>
<section id="container">
<form role="form" method="get">
<table class="table table-hover">
	<thead>
	<tr><th>이미지</th><th>제목</th><th>작성자</th><th>등록일</th></tr>
	</thead>
	<c:forEach items="${list}" var="list">
	<tr>
	<td><c:out value="${list.blog_image}"/></td>
	<td>
	<a href="/blog/readView?blog_bno=${list.blog_bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType }&keyword=${scri.keyword }">
	<c:out value="${list.blog_title}"/></a>
	</td>
	<td><c:out value="${ list.blog_email}"/></td>
	<td><fmt:formatDate value="${list.blog_date}" pattern="yyyy-MM-dd"/></td>
	</tr>
	</c:forEach>
</table>
<div class="search row">
<div class="col-xs-2 col-sm-2">
	<select name="searchType" class="form-control">
		<option value="n"<c:out value="${scri.searchType == null ? 'selected' : '' }"/>>-----</option>
		<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : '' }" />>제목</option>
		<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : '' }" />>내용</option>
	</select>
</div>
<div class="col-xs-10 col-sm-10">
<div class="input-group">
<input type="text" name="keyword" id="keywordInput" value="${scri.keyword }" class="form-control"/>
<span class="input-group-btn">
<button id="searchBtn" type="button" class="btn btn-default">검색</button>
</span>
</div>
</div>

<script>
$(function(){
	$('#searchBtn').click(function(){
		self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
		});
});
</script>
</div>
<div class="col-md-offset-3">
	<ul class="pagination">
	<c:if test ="${pageMaker.prev }">
	<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
	</c:if>
	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
	<li<c:out value="${pageMaker.cri.page == idx ? 'class=info': '' }"/>>
	<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
	</c:forEach>
	<c:if test="${pageMaker.next&& pageMaker.endPage > 0 }">
	<li> <a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
	</c:if>
	</ul>
</div>
</form>
</section>
</div>
      <div id="map" style="width:300px; height:300px;"></div>
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1807e8ae240d702dcb6050c5664fbef8&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    
</script>
</body>
</html>