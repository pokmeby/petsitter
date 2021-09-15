<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title> 후 기 글 쓰 기 p a g e </title>
</head>
<script type="text/javascript">
$(document).ready(function() {
	var formObj = $("form[name='writeForm']");
	$(".write_btn").on("click", function() {
		if(fn_valiChk()) {
			return false;
			}
		formObj.attr("action", "/review/writeReview");
		formObj.attr("method" ,"post");
		formObj.submit();		
	});
})
	function fn_valiChk() {
		var regForm = $("form[name='writeForm'] .chk").length;
		// 폼이름이 writeForm이고 .chk.length에 의미는 .chk가 몇개있는지 찾는것이다.
		for(var i=0; i <regForm; i++) {
			if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			} 
		}
</script>
<body>
	<header> nav </header>

	<section id="container">
		<form name="writeForm" method="post" action="/review/writeReview" enctype="multipart/form-data">
		<div>
			<div>
			<label for="r_image">이미지</label>
			<input type="file" name="image" id = "image">
			</div>
			
			<div>
			<label for="r_title">제목</label>
			<input type="text" id="r_title" name="r_title"/>
			</div>
			
			<div>
			<label for="ruse_date">이용 시간</label>
			<input type="text" id="ruse_date" name="ruse_date"/>
			</div>
			
			<div>
			<label for="r_content">내용</label>
			<textarea id="r_content" name="r_content"></textarea>
			</div>
			
			<div>
			<label for="r_rate">별점</label>
				<input type="radio" name="r_rate" id="r_rate" class="rate_radio" value="1"/>
				<input type="radio" name="r_rate" id="r_rate" class="rate_radio" value="2" checked="checked"/>
				<input type="radio" name="r_rate" id="r_rate" class="rate_radio" value="3"/>
				<input type="radio" name="r_rate" id="r_rate" class="rate_radio" value="4"/>
				<input type="radio" name="r_rate" id="r_rate" class="rate_radio" value="5"/>		
			</div>
			
			
			<div>
			<label for="sitter_email">시터 아이디</label>
			<input type="text" id="sitter_email" name="sitter_email"/>
			</div>

			<div>
			<label for="user_email">사용자 아이디</label>
			<input type="text" id="user_email" name="user_email"/>
			</div>
			<div><button class="write_btn" type="submit">작성하기</button></div>
		</div>
		</form>
	</section>	
</body>
</html>