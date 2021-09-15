<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>

<!-- 합쳐지고 최소화된 최신 CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      <!-- 부가적인 테마 -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
       
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

$(document).ready(function(){

	// 목록 이동
	$(".cencle").on("click" , function(){

		     location.href = "home";
        
		})

    
	$("#submit").on("click" , function(){

		     if($("#sitter_email").val() == "")
			     {
                    alert("이메일을 입력해주세요.");
                    $("#sitter_email").focus();
                    return false;
			     }
		     
		     if($("#sitter_pass").val() == "")
			     {
                    alert("비밀번호를 입력해주세요.");
                    $("#sitter_pass").focus();
                    return false;
			     }
		     
		     if($("#sitter_name").val() == "")
			     {
                    alert("성명을 입력해주세요.");
                    $("#sitter_name").focus();
                    return false;
			     }
        
		     
		     if($("#sitter_phone").val() == "")
			     {
                    alert("핸드폰 번호를 입력해주세요.");
                    $("#sitter_phone").focus();
                    return false;
			     }
        
		     
		     if($("#sitter_gender").val() == "")
			     {
                    alert("성별을 체크해주세요.");
                    $("#sitter_gender").focus();
                    return false;
			     }
        
		});

		
})


function fn_sitterEmailChk(){
    $.ajax({
      url : "/join/sitterEmailChk",
      type : "post",
      dataType : "json",
      data : {"sitter_email" : $("#sitter_email").val()},
      success : function(data){
        if(data == 1)
        {
          alert("중복된 이메일입니다.");
        }
        else if(data == 0)
        {
          $("#sitterEmailChk").attr("value", "Y");
          alert("사용가능한 이메일입니다.");
        }
        else 
        {
          alert("이메일을 입력해주세요.");
        }
      }
    })
  }

function fn_sitterPhoneChk(){
    $.ajax({
      url : "/join/sitterPhoneChk",
      type : "post",
      dataType : "json",
      data : {"sitter_phone" : $("#sitter_phone").val()},
      success : function(data){
    	  if(data == 1)
          {
            alert("이미 사용중인 핸드폰 번호입니다ㅠ.ㅠ");
          }
          else if(data == 0)
          {
            $("#sitterEmailChk").attr("value", "Y");
            alert("사용가능한 핸드폰 번호입니다 *.*");
          }
          else 
          {
            alert("핸드폰 번호를 입력해주세요.");
          }
        }
      })
    }

</script>



</head>
<body>


<h2>SITTER 로그인</h2>


<section id="container">
 
    <form action="/join/sitterRegister" method="post">
       
       <div class="form-group has-feedback">
          <label class="control-label" for="sitter_email">이메일</label>
          <input class="form-control" type="email" id="sitter_email" name="sitter_email"/>
          <button class="sitterEmailChk" type="button" id="sitterEmailChk" onclick="fn_sitterEmailChk()" value="N">중복확인</button>
       </div>
       
       <div class="form-group has-feedback">
          <label class="control-label" for="sitter_name">성명</label>
          <input class="form-control" type="text" id="sitter_name" name="sitter_name"/>
       </div>
       
       <div class="form-group has-feedback">
          <label class="control-label" for="sitter_password">비밀번호</label>
          <input class="form-control" type="password" id="sitter_password" name="sitter_password"/>
       </div>
       
       
       <div class="form-group has-feedback">
          <label class="control-label" for="sitter_phone">핸드폰</label>
          <input class="form-control" type="text" id="sitter_phone" name="sitter_phone"/>
          <button class="sitterPhoneChk" type="button" id="sitterPhoneChk" onclick="fn_sitterPhoneChk()" value="N">핸드폰 번호 확인</button>
       </div>
       
       
       <div class="form-group has-feedback">
          <label class="control-label" for="sitter_gender">성별</label>
          <input class="form-control" type="checkbox" id="sitter_gender" name="sitter_gender" value="남자" checked="checked" />남자 
		  <input class="form-control" type="checkbox" id="sitter_gender" name="sitter_gender" value="여자" />여자
       </div>
       
                
       
       
       <div class="form-group has-feedback">
          <button class="btn btn-sucess" type="submit" id="submit">회원가입</button>
          <button class="cencle btn btn-danger" type="button">목록으로 이동</button>       
       </div>
 
    
 </form>
 

</section>

</body>
</html>