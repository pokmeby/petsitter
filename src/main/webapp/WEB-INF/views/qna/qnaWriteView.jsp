<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>q&a 작성</title>
</head>

<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='writeForm']");
		$(".write_btn").on("click", function(){
			if(fn_valiChk()){
				return false;
				}
			formObj.attr("action","/qna/qnaWrite");
			formObj.attr("method", "post");
			formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length; //form이름이 writeForm이고 그 안에 클래스가 chk 인것을 찾아라
			for(var i = 0; i<regForm; i++) {
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
					}
				}
		}
</script>

<body>
<div id="root">
	<header>
		<h1> Q & A 등록하기 </h1>
	</header>
	<hr />
	
	<section id="container">
		<form name="writeForm" method="post" action="/qna/qnaWrite">
			<table>
				<tbody>
				<%-- 	<c:if test="${member.userId != null}"> --%>
						<tr>
							<td>
								<label for="qna_title">제목</label>
								<input type="text" id="qna_title" name="qna_title" class="chk" title="제목을 입력하세요."/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="qna_category">카테고리</label>
								<textarea id="qna_category" name="qna_category" class="chk" title="내용을 입력하세요."></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<label for="qna_content">내용</label>
								<textarea id="qna_content" name="qna_content" class="chk" title="내용을 입력하세요."></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<label for="user_email">작성자</label>
								<input type="text" id="user_email" name="user_email" class="chk" title="작성자를 입력하세요."/>
							</td>
						</tr>
						<tr>
							<td>
								<button class="write_btn" type="submit">작성</button>
							</td>
						</tr>
					<%--</c:if>
					 <c:if test="${member.userId == null}">
						<p>로그인 후에 작성할 수 있습니다.</p>
					</c:if> --%>
				</tbody>
			</table>
		</form>
	
	</section>
	<hr />
</div>
</body>
</html>