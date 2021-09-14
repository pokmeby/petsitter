<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	$(document).ready(function() {

		// 목록 이동
		$(".cencle").on("click", function() {
			location.href = "home";
		});

		
     				
		// 회원가입 
		$("#submit").on("click", function() {

			if ($("#user_email").val() == "") {
				alert("이메일을 입력해주세요");
				$("#user_email").focus();
				return false;
			}

			if ($("#user_pass").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#user_pass").focus();
				return false;
			}

			if ($("#user_name").val() == "") {
				alert("성명을 입력해주세요.");
				$("#user_name").focus();
				return false;
			}

			if ($("#user_phone").val() == "") {
				alert("핸드폰 번호를 입력해주세요.");
				$("#user_phone").focus();
				return false;
			}

			if ($("#user_gender").val() == "") {
				alert("성별을 체크해주세요.");
				$("#user_gender").focus();
				return false;
			}

			

		});

	})

	
function fn_memberEmailChk(){
    $.ajax({
      url : "/join/memberEmailChk",
      type : "post",
      dataType : "json",
      data : {"user_email" : $("#user_email").val()},
      success : function(data){
        if(data == 1)
        {
          alert("중복된 이메일입니다.");
        }
        else if(data == 0)
        {
          $("#memberEmailChk").attr("value", "Y");
          alert("사용가능한 이메일입니다.");
        }
        else 
        {
          alert("이메일을 입력해주세요.");
        }
      }
    })
  }
	
function fn_memberPhoneChk(){
    $.ajax({
      url : "/join/memberPhoneChk",
      type : "post",
      dataType : "json",
      data : {"user_phone" : $("#user_phone").val()},
      success : function(data){
        if(data == 1)
        {
          alert("이미 사용중인 핸드폰 번호입니다ㅠ.ㅠ");
        }
        else if(data == 0)
        {
          $("#memberEmailChk").attr("value", "Y");
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


	<h2>USER 로그인</h2>


	<section id="container">

		<form action="/join/memberRegister" method="post">

			<div class="form-group has-feedback">
				<label class="control-label" for="user_email">이메일</label> 
				<input class="form-control" type="email" id="user_email" name="user_email" />
				<button class="memberEmailChk" type="button" id="memberEmailChk" onclick="fn_memberEmailChk()" value="N">EMAIL 중복확인</button>
			</div>

			<div class="form-group has-feedback">
				<label class="control-label" for="user_name">성명</label> <input
					class="form-control" type="text" id="user_name" name="user_name" />
			</div>

			<div class="form-group has-feedback">
				<label class="control-label" for="user_password">비밀번호</label> <input
					class="form-control" type="password" id="user_password"
					name="user_password" />
			</div>


			<div class="form-group has-feedback">
				<label class="control-label" for="user_phone">핸드폰</label>
				<input class="form-control" type="text" id="user_phone" name="user_phone" />
			<button class="memberPhoneChk" type="button" id="memberPhoneChk" onclick="fn_memberPhoneChk()" value="N">핸드폰 번호 확인</button>
			</div>


			<div class="form-group has-feedback">
				<label class="control-label" for="user_gender">성별</label> 
				<input class="form-control" type="checkbox" id="user_gender" name="user_gender" value="남자" checked="checked"/>남자 
				<input class="form-control" type="checkbox" id="user_gender" name="user_gender" value="여자" />여자
			</div>

			<div class="form-group has-feedback">
				
				<button class="btn btn-sucess" type="submit" id="submit">회원가입</button>
				<button class="cencle btn btn-danger" type="button">목록으로 이동</button>
				
			</div>


		</form>

	</section>

</body>
</html>