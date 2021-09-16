<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>



<meta charset="UTF-8">
<title>Q&A 게시판</title>
</head>
<style>
	.nav-item{
		margin-left: 30px;
	}
</style>
<body>
	<c:import url="../hello/nav.jsp"></c:import>
		<header>
			<h1> Q&A 게시판</h1>
		</header>
	<c:out value="${sessionScope.member}"/>
		<hr/>
		<c:choose>
		<c:when test = "${not empty member}">
		<div>
			<a href="${pageContext.request.contextPath}/qna/qnaWriteView">q&a 등록하기</a>
		</div>
		</c:when>
		<c:otherwise>
			<a href="/login/memberLogin">사용자 로그인</a><p>
			<a href="/login/sitterLogin">시터 로그인</a>
		</c:otherwise>
		</c:choose>
		
		
		<div>
		<c:import url="./qnaList.jsp"></c:import>
		</div>
		
</body>
</html>