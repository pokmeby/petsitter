<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">

$(document).ready(function(){

	// 목록 이동
	$(".cencle").on("click" , function(){

		     location.href = "home";
        
		})

    
	$("#submit").on("click" , function(){

		     if($("#user_email").val() == "")
			     {
                    alert("아이디를 입력해주세요.");
                    $("#user_email").focus();
                    return false;
			     }
		     
		     if($("#user_pass").val() == "")
			     {
                    alert("비밀번호를 입력해주세요.");
                    $("#user_pass").focus();
                    return false;
			     }
		     		    
		});

		
})


</script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1>USER LOGIN</h1>

<section id="container">
 
    <form action="/login/memberLogin" method="post">
       
       <div class="form-group has-feedback">
          <label class="control-label" for="user_email">이메일</label>
          <input class="form-control" type="email" id="user_email" name="user_email"/>
       </div>
       
    
       <div class="form-group has-feedback">
          <label class="control-label" for="user_password">비밀번호</label>
          <input class="form-control" type="password" id="user_password" name="user_password"/>
       </div>
                                                             
       
       <div class="form-group has-feedback">
          <button class="btn btn-sucess" type="submit" id="submit">로그인</button>
          <button class="cencle btn btn-danger" type="button">취소</button>       
       </div>
 
    
 </form>
 

</section>








</body>
</html>