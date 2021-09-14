<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
$(document).ready(function(){
	$(".cancelbtn").on("click",function(){
		location.href="/sitter/profileView?sitter_email=${profileEdit.sitter_email}";
			});
})
</script>
<meta charset="UTF-8">
<title>Sitter Profile Edit</title>
</head>
<body>
<h1>프로필 수정 페이지</h1>
<form name="viewForm" role="form" action="/sitter/profileEdit" method="post" >
<div>
<label for="sitter_email">아이디</label>
<input type="text" id="sitter_email" name="sitter_email" value="${profileEdit.sitter_email}" readonly="readonly"/></div>

<div>
<label for="sitter_image">프로필 이미지</label>
<img name="sitter_image" src="/upload/sitter_profile/${profileEdit.sitter_image}"><br>
</div>

<div>
<label for="sitter_name">이름</label>
<input type="text" id="sitter_name" name="sitter_name" value="${profileEdit.sitter_name}" />
</div>
<div>
<label for="sitter_gender">성별</label>
<input type="text" id="sitter_gender" name="sitter_gender" value="${profileEdit.sitter_gender}" />
</div>
<div>
<label for="sitter_addr">지역</label>
<input type="text" id="sitter_addr" name="sitter_addr" value="${profileEdit.sitter_addr}" />
</div>
<div>
<label for="sitter_avail">가능날짜</label>
<input type="text" id="sitter_avail" name="sitter_avail" value="${profileEdit.sitter_avail}" />
</div>
<div>
<label for="sitter_price">요금</label>
<input type="number" id="sitter_price" name="sitter_price" step="500" value="${profileEdit.sitter_price}" />원
</div>
<div>
<label for="sitter_phone">전화번호</label>
<input type="text" id="sitter_phone" name="sitter_phone" value="${profileEdit.sitter_phone}" />
</div>
<div>
<label for="sitter_exp">경력</label>
<textarea id="sitter_exp" name="sitter_exp" ><c:out value="${profileEdit.sitter_exp}"/></textarea>
</div>
<div>
<label for="sitter_intro">자기소개</label>
<textarea id="sitter_intro" name="sitter_intro" ><c:out value="${profileEdit.sitter_intro}"/></textarea>
</div>

	<button type="submit" class="sub">저장</button>
	<button type="button" class="cancelbtn" onclick="location.href='/sitter/profileView?sitter_email=${profileEdit.sitter_email}'">취소</button>
</form>
</body>
</html>