<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload Form</title>
</head>
<body>
<h1> 스프링 MVC - 파일 업로드 예제</h1>
<hr/>

<h3>단일 파일 업로드</h3>
<form action="singleFileUpload" method="post" enctype="multipart/form-data">
	<table>
		<tr>
		<td> Select File</td>
		<td><input type="file" name="mediaFile"></td>
		<td>
		<button type="submit">Upload</button>
		</td>
		</tr>
	</table>
	</form>
	<br>
	<hr>
	<h3>다중 파일 업로드</h3>
	<form action="multipleFileUpload" method="post" enctype="multipart/form-data">
	<table>
	<tr>
	<td>Select File</td>
	</tr>
	<tr>
	<td><input type="file" name="mediaFile" multiple="multiple"></td>
	</tr>
		<tr>
	<td><input type="file" name="mediaFile" multiple="multiple"></td>
	</tr>
		<tr>
	<td><input type="file" name="mediaFile" multiple="multiple"></td>
	</tr>
	<tr>
	<td>
	<button type="submit">Upload</button>
	</td>
	</tr>
	</table>
	</form>
	<br>
	<hr>
	<span style="color: red; font-size:14px;">${msg }</span>
</body>
</html>