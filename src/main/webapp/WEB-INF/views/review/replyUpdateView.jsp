<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
   $(document).ready(function(){
      var formObj = $("form[name='updateForm']");

      $(".cancel_btn").on("click", function(){
         location.href = "/review/readReview?rno=${replyUpdate.rno}"
                    + "&page=${scri.page}"
                    + "&perPageNum=${scri.perPageNum}"
                    + "&searchType=${srci.searchType}"
                    + "&keyword=${srci.keyword}";
         })
      })
</script>
<body>
	<p>수정 페이지</p>
	  <section id="container">
      <form name="updateForm" role="form" method="post" action="/review/replyUpdate">
         <input type="hidden" name="rno" value="${replyUpdate.rno}" readonly="readonly"/>
         <input type="hidden" id="re_num" name="re_num" value="${replyUpdate.re_num}" />
         <input type="hidden" id="page" name="page" value="${scri.page}">
         <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
         <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
         <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
         <table>
            <tbody>
               <tr>
                  <td>
                     <label for="re_content">댓글 내용</label>
                     <input type="text" id="re_content" name="re_content" value="${replyUpdate.re_content}"/>
                  </td>
               </tr>
            </tbody>
         </table>
         <div>
            <button type="submit" class="update_btn">저장</button>
            <button type="button" class="cancel_btn">취소</button>
         </div>
      </form>
   </section>
</body>
</html>