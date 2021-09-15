<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
window.onload=function(){
	document.getElementById("sitter_email").value=opener.document.getElementById("sitter_email").value;
	var btn=document.getElementById("changeImg");
	btn.onclick=function(){
		document.imageForm.target="profileDetail";
		document.imageForm.action="/sitter/profileImageEdit";
		document.imageForm.method="POST";
		document.imageForm.submit();
		self.close();
		}
};
</script>
<meta charset="UTF-8">
<title>이미지수정</title>
</head>
<body>
<form name="imageForm" role="form" enctype="multipart/form-data" method="POST" action="/sitter/profileImageEdit">
<input type="hidden" id="sitter_email" name="sitter_email" value="${profileEdit.sitter_email}">
<input type="file" id="sitter_image" name="file" />
<button type="button" id="changeImg" onclick="window.close()">
이미지 수정</button>
</form>
</body>
</html>