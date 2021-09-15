<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='updateForm']");

		$(".cancel_btn").on("click", function() {
			event.preventDefault();
			/*
			이벤트를 취소하는 도중에 preventDefault를 호출하게되면,
			일반적으로 브라우저의 구현에 의해 처리되는 기존의 액션이 동작하지 않게되고
			그 결과 이벤트가 발생하지 않게됩니다.
			*/
			location.href = "/review/readReview?rno=${update.rno}"
						  + "&page=${scri.page}"
						  + "&perPageNum=${scri.perPageNum}"
						  + "&searchType=${scri.searchType}"
						  + "&keyword=${scri.keyword}";
			})

		$(".update_btn").on("click", function() {
			if(fn_valiChk()){
				return false;
			}
			formObj.attr("action", "/review/update");
			formObj.attr("method", "post");
			formObj.submit();
			})
		})
		
			function openWin(){
				window.name="imageUpdate";
				var url="/review/imageUpdate?rno=${update.rno}"
					  + "&page=${scri.page}"
					  + "&perPageNum=${scri.perPageNum}"
					  + "&searchType=${scri.searchType}"
					  + "&keyword=${scri.keyword}";
				var name="imageUpdate";
				var option="_blank,width=100,height=50";
				window.open(url,name,option)
			}
	
		function fn_valiChk() {
		var updateForm = $("form[name='updateForm'] .chk").length;
		for(var i=0; i <updateForm; i++) {
			if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			} 
		}
</script>
<body>
	<section>
		<form name="updateForm" role="form" action="/review/update" method="post">
			<input type="hidden" id="rno" name="rno" value="${update.rno}" readonly="readonly"/>
			<input type="hidden" id="page" name="page" value="${scri.page}" >
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" >
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" >
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" >
		
			<!-- 	<div><input type="file" name="r_image" id = "r_image" value="${update.r_image }"></div> -->
			<img src="/resources/image/${update.r_image}"/>
			<button type="button" onclick="openWin()">이미지수정</button>
				
			<div>
			<label for="r_title">제목</label>
			<input type="text" id="r_title" name="r_title" value="${update.r_title}" title ="제목을 입력해주세요."/>
			</div>
			
			<div>
			<label for="ruse_date">이용 시간</label>
			<input type="text" id="ruse_date" name="ruse_date" value="${update.ruse_date}"/>
			</div>
			
			<div>
			<label for="r_content">내용</label>
			<textarea id="r_content" name="r_content"><c:out value="${update.r_content}"/></textarea>
			</div>
			

			<div>
			<label for="r_rate">별점</label>
				<input type="radio" name="r_rate" id="r_rate" class="rate_radio" value="1"/>
				<input type="radio" name="r_rate" id="r_rate" class="rate_radio" value="2"/>
				<input type="radio" name="r_rate" id="r_rate" class="rate_radio" value="3"/>
				<input type="radio" name="r_rate" id="r_rate" class="rate_radio" value="4"/>
				<input type="radio" name="r_rate" id="r_rate" class="rate_radio" value="5"/>		
			</div>

			<div>
			<label for="user_email">사용자</label>
			<input type="text" id="user_email" name="user_email" value="${update.user_email}"/>
			</div>
			
			<div>
			<label for="sitter_email">시터 아이디</label>
			<input type="text" id="sitter_email" name="sitter_email" value="${update.sitter_email}"/>
			</div>
			<div>
				<button type="submit" class="update_btn">저장</button>
				<button type="button" class="cancel_btn">취소</button>
			</div>
			
		</form>
	</section>
</body>
</html>