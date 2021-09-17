<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sitter Profile Detail</title>
</head>
<body>
<h1> 프로필 뷰 페이지 </h1>
<form name="viewForm" role="form" method="GET" action="/sitter/profileEditView">
<div>
<label for="sitter_email">아이디</label>
<input type="text" id="sitter_email" name="sitter_email" value="${profileView.sitter_email}" readonly/></div>
<div>
<label for="sitter_image">프로필 이미지</label>
<img src="../upload/sitter_profile/album-af.jpg"/>

</div>
<div>
<label for="sitter_name">이름</label>
<input type="text" id="sitter_name" name="sitter_name" value="${profileView.sitter_name}" readonly/>
</div>
<div>
<label for="sitter_gender">성별</label>
<input type="text" id="sitter_gender" name="sitter_gender" value="${profileView.sitter_gender}" readonly/>
</div>
<div>
<label for="sitter_addr">지역</label>
<input type="text" id="sitter_addr" name="sitter_addr" value="${profileView.sitter_addr}" readonly/>
</div>
<div>
<label for="sitter_avail">가능날짜</label>
<input type="text" id="sitter_avail" name="sitter_avail" value="${profileView.sitter_avail}" readonly/>
</div>
<div>
<label for="sitter_price">요금</label>
<input type="number" id="sitter_price" name="sitter_price" value="${profileView.sitter_price}" readonly/>원
</div>
<div>
<label for="sitter_phone">전화번호</label>
<input type="text" id="sitter_phone" name="sitter_phone" value="${profileView.sitter_phone}" readonly/>
</div>
<div>
<label for="sitter_exp">경력</label>
<textarea id="sitter_exp" name="sitter_exp" readonly><c:out value="${profileView.sitter_exp}"/></textarea>
</div>
<div>
<label for="sitter_intro">자기소개</label>
<textarea id="sitter_intro" name="sitter_intro" readonly><c:out value="${profileView.sitter_intro}"/></textarea>
</div>
<div>
<label for="rate">별점</label>
<input type="text" id="rate" name="rate" value="${profileView.rate}" readonly/>
</div>
<div>
	<button type="submit">수정</button>
	<button type="button" onclick="location.href='/sitter/profileBoard'">목록</button>
</div> 
</form>

</body>
</html>