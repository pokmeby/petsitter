<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      <!-- 부가적인 테마 -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
       
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
       
<style>
	.nav-item{
		margin-left: 30px;
	}
</style>
<meta charset="UTF-8">
<title>nav-bar</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">

  <div class="container-fluid">
  
    <a class="navbar-brand" href="/">메인로고</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active size" aria-current="page" href="#">소개</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link " href="#">씨터소개</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="review/boardReview">후기</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="#">Q&A</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="/blog/list">BLOG</a>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                   프로필
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="/petinfo/petinfoForm">펫등록</a></li>
            <li><a class="dropdown-item" href="/petinfo/petinfoUpdateForm">펫 정보 수정</a></li>
            <li><a class="dropdown-item" href="#">회원 정보 수정</a></li>
            <li><a class="dropdown-item" href="#">나의 예약 현황</a></li>
          </ul>
        </li>        
        
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
               회원가입
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="/join/sitterRegister">펫씨터로 회원가입하기</a></li>
            <li><a class="dropdown-item" href="/join/memberRegister">사용자로 회원가입하기</a></li>           
            <li><a class="dropdown-item" href="/login/logout">로그아웃</a></li>
          </ul>
        </li>        
        
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
               로그인
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="/login/sitterLogin">펫씨터로 로그인</a></li>
            <li><a class="dropdown-item" href="/login/memberLogin">사용자로 로그인</a></li>       
            <li><a class="dropdown-item" href="/login/logout">로그아웃</a></li>
          </ul>
        </li>        
      </ul>
      
     
    </div>
  </div>
</nav>


</body>
</html>