<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
window.onload=function(){
	var btn=document.getElementById("changeImg");
	btn.onclick=function(){
		document.imageForm.target="imageUpdate";
		document.imageForm.action="/review/imageUpdate";
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
<form name="imageForm" role="form" enctype="multipart/form-data" method="POST" action="/review/imageUpdate">
<input type="hidden" id="rno" name="rno" value="${imageUpdate.rno}"/>
<input type="file" id="r_image" name="image" />
<button type="button" id="changeImg" onclick="window.close()">이미지 수정</button>
</form>
</body>
</html>