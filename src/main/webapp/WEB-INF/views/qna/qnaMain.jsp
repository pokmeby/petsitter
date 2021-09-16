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
<title>Q&A 게시판</title>
</head>
<body>
		<header>
			<h1> Q&A 게시판</h1>
		</header>
		<hr/>
		<div>
			<a href="/qna/qnaWriteView">q&a 등록하기</a>
		</div>
		
		<div>
		<c:import url="./qnaList.jsp"></c:import>
		</div>
		
</body>
</html>